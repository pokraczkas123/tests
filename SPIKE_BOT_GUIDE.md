# 🏐 VOLTEXBALL - AUTOMATED SPIKE BOT GUIDE

## Wstęp

Ten bot automatycznie spikeuje piłkę w Voltexball. Dwie wersje:

- **SPIKE_BOT_AUTOMATED.lua** - Podstawowa, zaawansowana ale czytelna
- **SPIKE_BOT_ADVANCED.lua** - AI-powered z predykcją i anti-block

---

## 🚀 SZYBKI START

### 1. Wczytanie Bota

```lua
-- Załaduj do gry (MATCHA/RCE)
loadstring(readfile("SPIKE_BOT_AUTOMATED.lua"))()
```

Lub zaawansowana wersja:

```lua
loadstring(readfile("SPIKE_BOT_ADVANCED.lua"))()
```

### 2. Kontrola

- **F6** - Włącz/Wyłącz bot
- **F7** - Włącz/Wyłącz ESP (wizualizacja)

### 3. Czekaj na Piłkę

Bot automatycznie:
- Szuka piłki
- Rotuje się do piłki
- Skacze do optymalnej pozycji
- Spikeuje!

---

## 📊 Wersja 1: SPIKE_BOT_AUTOMATED

### Features

✅ Auto-rotation do piłki  
✅ Optimal spike position calculation  
✅ ESP visualization (hitbox, trajectory)  
✅ Automatic jump & spike  
✅ Real-time distance/angle display  

### Konfiguracja

```lua
local CONFIG = {
    SPIKE_POWER = 1.35,              -- Moc spika (Mikage default)
    SPIKE_REACH = 5.0,               -- Zasięg do piłki
    JUMP_HEIGHT = 50,                -- Siła skoku
    OPTIMAL_SPIKE_HEIGHT = 10.0,     -- Optymalna wysokość
    SPIKE_ANGLE_OFFSET = 45,         -- Kąt ataku
    ROTATION_SPEED = 0.15,           -- Szybkość rotacji (0-1)
}
```

### Jak to działa

1. **Ball Detection** - Szuka "Ball" lub "CLIENT_BALL" w workspace
2. **Position Calculation** - Oblicza optymalną pozycję dla spika
3. **Rotation** - Gładka rotacja do piłki
4. **Jump Execution** - Skacze gdy piłka jest w zasiągu
5. **Spike** - Wciśnięcie przycisku E (spike/jumpset)

### Kod Kluczowy

```lua
-- Szukanie piłki
local function GetBall()
    local parts = workspace:GetDescendants()
    for _, part in ipairs(parts) do
        if part.Name:lower():find("ball") then
            return part.Parent  -- Zwróć model piłki
        end
    end
end

-- Rotacja do piłki
local function RotateCharacterTowardsBall()
    local ball_pos = GetBallPosition()
    local target_yaw, target_pitch = GetYawPitch(
        BotState.humanoid_root.Position,
        ball_pos
    )
    -- Aplica smooth rotation
end

-- Spike!
local function PerformSpike()
    keypress(0x45)  -- E key
    wait(0.05)
    keyrelease(0x45)
end
```

---

## 🤖 Wersja 2: SPIKE_BOT_ADVANCED

### Advanced Features

✅ **Predictive Tracking** - Przewiduje gdzie będzie piłka  
✅ **Multi-point Optimization** - Testuje wiele opcji spike'a  
✅ **Anti-block Detection** - Unika bloków przeciwnika  
✅ **Adaptive Timing** - Dostosowuje czas spika  
✅ **Enemy Detection** - Śledzi przeciwników  
✅ **Performance Stats** - Wyświetla success rate  
✅ **Advanced ESP** - Pokazuje wszystko  

### Konfiguracja Zaawansowana

```lua
local CONFIG = {
    PREDICTION_TIME = 0.15,          -- Predykcja 0.15s w przód
    SPIKE_POWER_VARIANTS = {1.0, 1.35, 1.5, 2.0},
    BLOCK_DETECTION_RANGE = 8.0,     -- Zasięg detekicji bloku
    TARGET_COURT_ZONE = "opponent",  -- cross, line, opponent
    AGGRESSION_LEVEL = 0.8,          -- 0-1 (wyższa = bardziej agresywny)
}
```

### Jak to działa (Advanced)

1. **Ball Velocity Calculation**
   ```lua
   delta = current_pos - previous_pos
   velocity = delta / frame_time
   ```

2. **Position Prediction**
   ```lua
   predicted_pos = current_pos + (velocity * prediction_time) - gravity_offset
   ```

3. **Multi-point Spike Candidates**
   - Testuje 5+ różnych kątów i mocy
   - Rankuje każdy punkt po score
   - Wybiera najlepszy

4. **Enemy Detection**
   - Szuka przeciwników na mapie
   - Oblicza czy są w ścieżce spike'a
   - Dostosowuje kąt aby uniknąć

5. **Timing Window**
   ```lua
   timing_window = 200 + (distance * 10) ms
   ```

---

## 📈 Performance Monitoring

```lua
-- Bot wyświetla:
print(string.format("Spikes: %d | Success: %.1f%%",
    AdvancedBotState.total_spikes,
    AdvancedBotState.spike_success_rate))
```

Przykład output:
```
Spikes: 15 | Success: 86.7%
```

---

## 🎮 ESP Visualization

### Kolory

- 🟢 **Zielone** - Ball hitbox
- 🔴 **Czerwone** - Spike zone & optimal position
- 🟡 **Żółte** - Trajektoria spike'a
- 🔵 **Niebieskie** - Informacje (odległość, kąt)
- 🟠 **Pomarańczowe** - Predicted ball position
- ⚫ **Czarne** - Enemy blockers

### Włączanie/Wyłączanie ESP

```
F7 - Toggle ESP on/off
```

---

## 🔧 Modyfikacja Bota

### Zmiana Masy Spika

```lua
CONFIG.SPIKE_POWER = 2.0  -- 2x więcej mocy
```

### Zmiana Zakresu Spike'a

```lua
CONFIG.SPIKE_REACH = 8.0  -- Z 5.0 na 8.0
```

### Zmiana Szybkości Rotacji

```lua
CONFIG.ROTATION_SPEED = 0.5  -- Szybsza rotacja (0.15 -> 0.5)
```

### Zmiana Klawisza Spike'a

```lua
-- Zmień E (0x45) na Q (0x51)
keypress(0x51)  -- Q key
```

---

## ⚠️ Problemy & Rozwiązania

### Problem: Bot nie znajduje piłki

**Rozwiązanie:**
```lua
-- Debug: sprawdź czy piłka jest w workspace
local ball = GetBall()
print("Ball found:", ball)
if not ball then
    print("Workspace children:")
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj.Name:lower():find("ball") then
            print("Found:", obj.Name, obj)
        end
    end
end
```

### Problem: Bot skacze ale nie spikeuje

**Rozwiązanie:**
- Sprawdź czy przycisk E jest prawidłowy (JumpSet)
- Możliwe że wymaga innego przycisku w Twojej wersji gry
- Spróbuj klawisza Q lub innego

### Problem: Bot się nie rotuje

**Rozwiązanie:**
- Sprawdź czy humanoid_root jest znaleziony
- Może być problem z physics
- Zwiększ ROTATION_SPEED

### Problem: ESP nie wyświetla się

**Rozwiązanie:**
- Sprawdzić czy Drawing API jest dostępny
- Niektóre exploity nie mają Drawing API
- Spróbuj wersji bez ESP

---

## 🎯 Zaawansowane Tweaki

### Dla Szybszych Maszyn

```lua
CONFIG.CHECK_INTERVAL = 0.008  -- 2x szybiej (120 FPS)
CONFIG.PREDICTION_TIME = 0.2    -- Bardziej zaawansowana predykcja
```

### Dla Wolniejszych Maszyn

```lua
CONFIG.CHECK_INTERVAL = 0.033   -- ~30 FPS
CONFIG.PREDICTION_TIME = 0.1    -- Mniej zaawansowana
CONFIG.SHOW_TRAJECTORY = false   -- Mniej ESP
```

### Dla Maksymalnej Precyzji

```lua
CONFIG.ROTATION_SPEED = 0.25     -- Szybsza rotacja
CONFIG.SPIKE_DELAY = 0.15        -- Więcej czasu na przygotowanie
CONFIG.PREDICTION_TIME = 0.25    -- Więcej przewidywania
```

---

## 📊 Kiedy Używać Którego Bota

| Sytuacja | Bot |
|----------|-----|
| Szybki test | AUTOMATED |
| Zwykła gra | AUTOMATED |
| Kompetycja | ADVANCED |
| FPS niska | AUTOMATED |
| Chcesz learning | ADVANCED |
| Chcesz robi modyfikacje | AUTOMATED |

---

## 🔐 Bezpieczeństwo

⚠️ **OSTRZEŻENIE**: Botowanie może być banowalne!

- Bot emuluje input
- Jest detekcywalny przez anti-cheat
- Używaj na własne ryzyko!

---

## 📝 Przykład Custom Bota

Możesz łatwo modyfikować:

```lua
-- 1. Weź SPIKE_BOT_AUTOMATED.lua
-- 2. Zmień CONFIG
local CONFIG = {
    SPIKE_POWER = 2.0,  -- Ultra moc
    SPIKE_REACH = 10.0, -- Bardzo daleko
    JUMP_HEIGHT = 100,  -- Bardzo wysoki skok
}

-- 3. Zmień funkcje
local function PerformSpike()
    -- Custom spike logic
    keypress(0x51)  -- Q zamiast E
    wait(0.1)
    keyrelease(0x51)
end

-- 4. Załaduj
loadstring(...)()
```

---

## 🎓 Nauczanie się

Jeśli chcesz nauczyć się jak działa:

1. Przeczytaj kod SPIKE_BOT_AUTOMATED.lua (ma komentarze)
2. Zmodyfikuj CONFIG
3. Testuj zmiany
4. Przeczytaj SPIKE_BOT_ADVANCED.lua dla zaawansowanych konceptów

---

## 📞 Cheat Sheet

```lua
-- Szukanie piłki
local ball = GetBall()

-- Pozycja piłki
local ball_pos = GetBallPosition()

-- Dystans do piłki
local distance = CalculateDistanceToBall()

-- Kąt do piłki
local angle = CalculateAngleToBall()

-- Rotacja do piłki
RotateCharacterTowardsBall()

-- Skok
JumpTowardsBall()

-- Spike!
PerformSpike()

-- Włącz ESP
BotState.esp_enabled = true

-- Włącz bota
BotState.enabled = true
```

---

## Status

✅ GOTOWE - Oba boty w pełni funkcjonalne!

Wymaga: MATCHA Scripts / Exploit z keypress/Drawing API
