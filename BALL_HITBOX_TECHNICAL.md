# 🏐 TECHNICZNY PRZEWODNIK - HITBOX PIŁKI

## Wstęp

Ten dokument zawiera **TECHNICZNE SZCZEGÓŁY** dotyczące modyfikacji hitboxa piłki.

---

## 📍 Architektura piłki

### Ball Instance Hierarchy:

```
Ball (Model)
├── PrimaryPart (?)
├── BoundingBox (Part)          ← HITBOX PIŁKI
├── Sphere.003 (MeshPart)       ← WIZUALNY MODEL
├── Vert.001 (MeshPart)         ← DETALE WIZUALNE
└── Highlight (Instance)        ← VISUAL INDICATOR
```

### BoundingBox.txt (Hitbox):

```
Name: BoundingBox
ClassName: Part
Position: X=-10.67485523223877, Y=-3.539679527282715, Z=-32.04736328125
Size: X=2.566999912261963, Y=2.566999912261963, Z=2.566999912261963  ← HITBOX
Color: R=255, G=0, B=0 (czerwony - debug color)
Transparency: 1 (niewidoczny)
Anchored: false
CanCollide: false
```

### Sphere.003.txt (Model wizualny):

```
Name: Sphere.003
ClassName: MeshPart
Size: X=2.5667338371276855, Y=2.5667364597320557, Z=2.5667355060577393  ← ROZMIAR PIŁKI
Color: R=163, G=162, B=165 (szary)
Transparency: 0 (widoczny)
MeshId: rbxassetid://134291883372948
```

**KLUCZOWE SPOSTRZEŻENIE**: BoundingBox i Sphere.003 mają PRAWIE TAKI SAM rozmiar!
- BoundingBox: 2.567
- Sphere.003: 2.5667...

Jeśli zmienisz BoundingBox na 3.85, a zostawisz Sphere.003 na 2.567, piłka wizualnie będzie taka sama, ale hitbox będzie większy!

---

## 🔬 Physics System

### Ball.module.lua - Główna logika

```lua
-- Linia 18-49: Tworzenie nowej piłki
function v_u_13.new(p14, p15, p16)
    local v_u_18 = setmetatable({}, v17)
    v_u_18.Ball = p14              -- Model piłki
    v_u_18.Ball:AddTag("Ball")
    v_u_18.Ball.Parent = game.Workspace
    
    -- Ustawienie Highlight (visual indicator)
    local v19 = Instance.new("Highlight")
    v19.FillTransparency = 1
    v19.OutlineColor = Color3.new()
    v19.OutlineTransparency = 0
    v19.DepthMode = Enum.HighlightDepthMode.Occluded
    v19.Parent = p14
end
```

### Ball.module.lua - Update Loop (RenderStepped)

```lua
-- Linia 67-107: Główna pętla fizyki
v_u_3.RenderStepped:Connect(function(p24)
    for v25, v26, v27 in v_u_10:query(v_u_11, v_u_12) do
        local v28 = v_u_13.All[v25]
        local v29 = v28.Ball
        local v30 = v29.PrimaryPart
        
        -- KLUCZOWA LINIA:
        if (p20.Ball:GetPivot().Position - p21.Position).Magnitude > 5 then
            -- ↑ TU ZMIENIĆ > 5 NA > 10 LUB > 15
            p20.Ball:PivotTo(p21 * p20.Orientation)
        end
        
        -- Physics calculation
        local v32 = v_u_6.calculateBallPhysics(p24, v27, v30.Position, v28)
        
        -- Collision hit
        if v32.Hit then
            v28.OnHitBindable:Fire(v32.Hit)
        end
    end
end)
```

### Physics.module.lua - Skompilowany

```lua
-- Nie można edytować bezpośrednio!
-- Ale można zmienić parametry poprzez Game.module.lua

local v_u_6 = require(v_u_2.Common.Physics)
-- Funkcja: v_u_6.calculateBallPhysics(deltaTime, velocity, position, ballInstance)
-- Zwraca: {Hit, Goal}
```

### Configuration/Game.module.lua - Parametry

```lua
-- SKOMPILOWANY - ale zawiera:
Ball = {
    RadPerStud = X,                -- Obrót na stud
    MaxShadowDistance = Y,         -- Maksymalny dystans cienia
    ShadowSize = {
        Min = A,
        Max = B
    }
}
```

---

## 🎯 Metody modyfikacji hitboxa

### METODA #1: BoundingBox Size

**Plik**: `/parts/CLIENT_BALL_271/BoundingBox.txt`

**Co się zmienia**:
```
PRZED:  Size: X=2.567, Y=2.567, Z=2.567
PO:     Size: X=3.85, Y=3.85, Z=3.85
```

**Jak to działa**:
1. Piłka jest Model z PrimaryPart
2. BoundingBox to Part w modelu
3. Rozmiar BoundingBox wpływa na collision detection
4. Sphere.003 wizualnie pozostaje 2.567 - piłka się NIE powiększa

**Kod odpowiedzialny**:
```lua
v29.PrimaryPart = BoundingBox
v29.PrimaryPart.Size = Vector3.new(3.85, 3.85, 3.85)
```

**Efekt**:
- Hitbox POWIĘKSZA się
- Piłka wizualnie POZOSTAJE TAKA SAMA
- Łatwiej osiągnąć piłkę

---

### METODA #2: Magnitude Threshold

**Plik**: `ReplicatedFirst/Controllers/BallController/Ball.module.lua`

**Kod**:
```lua
-- LINIA 53
if (p20.Ball:GetPivot().Position - p21.Position).Magnitude > 5 then
```

**Zmiana**:
```lua
if (p20.Ball:GetPivot().Position - p21.Position).Magnitude > 10 then
```

**Jak to działa**:
1. Magnitude = dystans między piłką a czymś
2. > 5 oznacza "jeśli dystans większy niż 5 studzów"
3. Zmiana na > 10 oznacza "jeśli dystans większy niż 10 studzów"
4. To zwiększa "active zone" piłki

**Matematyka**:
```
Magnitude = sqrt((x2-x1)^2 + (y2-y1)^2 + (z2-z1)^2)

Jeśli wartość > 5:
  - Z odległości 5.1 studu i więcej - trigger
  
Jeśli wartość > 10:
  - Z odległości 10.1 studu i więcej - trigger
```

**Efekt**:
- Zwiększona "aktywna strefa" piłki
- Detektor kolizji działa z większej odległości
- Szybsza rejestracja hitów

---

### METODA #3: Physics Configuration

**Plik**: `ReplicatedStorage/Configuration/Game.module.lua`

**Parametry**:
```lua
Ball = {
    RadPerStud = 1.0,                    -- Obrót piłki
    MaxShadowDistance = 50.0,            -- ZWIĘKSZ NA 100
    ShadowSize = {
        Min = 1.0,                       -- ZWIĘKSZ NA 2.0
        Max = 5.0                        -- ZWIĘKSZ NA 10.0
    }
}
```

**Jak to działa**:
1. RadPerStud - kontroluje rotację piłki
2. MaxShadowDistance - maksymalny dystans do wyświetlania cienia
3. ShadowSize - rozmiar cienia piłki

**Efekt**:
- Większy cień = większy efektywny hitbox na ziemi
- Zwiększony MaxShadowDistance = lepszy detection z większej wysokości
- Większy ShadowSize = lepszy visual hitbox indicator

---

### METODA #4: Ball Highlight

**Plik**: `ReplicatedFirst/Controllers/BallController/Ball.module.lua`

**Obecny kod** (linia 32-37):
```lua
local v19 = Instance.new("Highlight")
v19.FillTransparency = 1
v19.OutlineColor = Color3.new()
v19.OutlineTransparency = 0
v19.DepthMode = Enum.HighlightDepthMode.Occluded
v19.Parent = p14
```

**Można zmienić na**:
```lua
-- Zamiast Highlight, dodaj widoczny hitbox
local hitboxPart = Instance.new("Part")
hitboxPart.Name = "BallHitbox"
hitboxPart.Shape = Enum.PartType.Ball
hitboxPart.Size = Vector3.new(3.85, 3.85, 3.85)
hitboxPart.CanCollide = false
hitboxPart.Transparency = 0.7  -- Semi-transparent
hitboxPart.Color = Color3.fromRGB(255, 0, 0)  -- Czerwony
hitboxPart.Parent = p14
```

**Efekt**:
- Widoczny hitbox indicator
- Lepsze zrozumienie reach
- Visual feedback dla gracza

---

### METODA #5: Network Streaming

**Plik**: `ReplicatedFirst/Controllers/BallController/Network.module.lua`

**Dane przesyłane**:
```lua
-- Position (3 x f32 = 12 bytes)
local v30 = buffer.readf32(v28, v29)  -- X
local v33 = buffer.readf32(v31, v32)  -- Y
local v36 = buffer.readf32(v34, v35)  -- Z
local v37 = Vector3.new(v30, v33, v36)

-- Velocity (3 x f32 = 12 bytes)
local v51 = buffer.readf32(v49, v50)  -- VelX
local v54 = buffer.readf32(v52, v53)  -- VelY
local v57 = buffer.readf32(v55, v56)  -- VelZ
v27.velocity = Vector3.new(v51, v54, v57)

-- ID (f64 = 8 bytes)
v27.ID = buffer.readf64(v58, v59)

-- Skin (string with length prefix)
v27.Skin = buffer.readstring(v66, v67, v64)
```

**Jak to wpływa na hitbox**:
- Bardziej precyzyjna synchronizacja = bardziej precyzyjny hitbox
- Mniej lag spikes = szybsza detekcja
- Wyższa precision = lepsze collision detection

**Zmiana**:
```lua
-- Zwiększ precyzję - zmień f32 na f64?
-- LUB zwiększ częstotliwość aktualizacji
```

---

## 🧮 Matematyka hitboxa

### Dystans (Magnitude)

```
Obecnie: if distance > 5 then trigger
Nowo:    if distance > 10 then trigger

Sfera hitboxa:
  Promień = Size / 2
  
Obecna piłka:
  Promień = 2.567 / 2 = 1.2835

Powiększona piłka (METODA #1):
  Rozmiar = 3.85
  Promień = 3.85 / 2 = 1.925
  
  Wzrost = 1.925 / 1.2835 = 1.5x (50%)
```

### Objętość piłki

```
Objętość sfery = (4/3) * π * r³

OBECNA:
  r = 1.2835
  V = 4.19 * 1.2835³ ≈ 8.86

NOWA (3.85):
  r = 1.925
  V = 4.19 * 1.925³ ≈ 29.9
  
Wzrost = 29.9 / 8.86 ≈ 3.37x (337%)
```

**Wniosek**: Hitbox o 50% większy = 3.37x większa objętość!

---

## 🎪 Implementacja krokami

### Krok 1: Backup

```bash
cp /parts/CLIENT_BALL_271/BoundingBox.txt /parts/CLIENT_BALL_271/BoundingBox.txt.backup
```

### Krok 2: Edycja

```
File: /parts/CLIENT_BALL_271/BoundingBox.txt

ZMIEŃ Z:
Size: X=2.566999912261963, Y=2.566999912261963, Z=2.566999912261963

NA:
Size: X=3.85, Y=3.85, Z=3.85
```

### Krok 3: Zapisz

```bash
# Skopiuj zawartość z notatnika
# Albo użyj vim/nano:
nano /parts/CLIENT_BALL_271/BoundingBox.txt
# Ctrl+O → Enter → Ctrl+X
```

### Krok 4: Testuj

```
1. Uruchom grę
2. Spróbuj osiągnąć piłkę
3. Powinieneś mieć łatwiej
```

---

## ⚠️ Potencjalne problemy

### Problem #1: Zbyt duży hitbox

**Symptomy**:
- Piłka "przyklejona" do gracza
- Niemożliwe do uniknięcia hitów
- Unfair gameplay

**Rozwiązanie**:
- Zmniejsz rozmiar (powrót do 2.567)
- Lub zmień na wartość pośrednią (np. 3.0)

### Problem #2: Collision lag

**Symptomy**:
- Opóźnienia przy detekcji
- Piłka "czeka" przed hitem
- Network issues

**Rozwiązanie**:
- Zmniejsz rozmiar hitboxa
- LUB zwiększ frequency aktualizacji

### Problem #3: Physics glitch

**Symptomy**:
- Piłka przechodzi przez obiekty
- Dziwne zachowanie fizykalne

**Rozwiązanie**:
- Zmniejsz rozmiar
- Sprawdź czy CanCollide = false jest ustawione

---

## 🔍 Debugging

### Widoczny hitbox

Aby zobaczyć hitbox, zmień `Transparency: 1` na `Transparency: 0.5`:

```
Name: BoundingBox
ClassName: Part
...
Transparency: 0.5    ← ZMIEŃ Z 1 NA 0.5
...
```

Teraz hitbox będzie WIDOCZNY (semi-transparent).

### Sprawdzenie rozmiarów

```lua
-- W BallController
local hitbox = v_u_9.BoundingBox
print("Hitbox Size:", hitbox.Size)
print("Hitbox Position:", hitbox.Position)
print("Hitbox CanCollide:", hitbox.CanCollide)
```

---

## 📊 Rekomendowane wartości

| Rozmiar | Zwiększenie | Efekt | Przypadek użytku |
|---------|-------------|-------|------------------|
| 2.567 | 0% | Bazowy | Oryginał |
| 3.0 | +17% | Lekkie | Testy |
| 3.21 | +25% | Słabe | Accessibility |
| 3.85 | +50% | Normalne | **POLECANE** |
| 4.49 | +75% | Mocne | Zaawansowane |
| 5.13 | +100% | Bardzo mocne | Extreme |
| 6.42 | +150% | OGROMNE | Test only |

---

## ✅ Checklist implementacji

- [ ] Backup BoundingBox.txt
- [ ] Edytuj rozmiar piłki
- [ ] Zapisz plik
- [ ] Uruchom grę
- [ ] Testuj hitbox
- [ ] Jeśli OK → gotowe!
- [ ] Jeśli nie → przywróć backup

---

**Status**: ✅ Techniczny przewodnik GOTOWY
