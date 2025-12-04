-- Decompiled game.ReplicatedFirst.Components.Flash

local v_u_1 = Color3.new(1, 1, 1)
local v_u_2 = game:GetService("Debris")
local v_u_3 = game:GetService("Lighting")
local v_u_4 = game:GetService("TweenService")
return function(p5)
    -- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_1, (copy) v_u_4
    local v6 = p5 or {}
    local v7 = Instance.new("ColorCorrectionEffect")
    v_u_2:AddItem(v7, v6.Duration or 0.6)
    v7.Name = "Flash"
    v7.Brightness = 0.5
    v7.Parent = v_u_3
    v7.TintColor = v6.Color or v_u_1
    local v8 = {
        ["Brightness"] = 0,
        ["TintColor"] = v_u_1
    }
    v_u_4:Create(v7, TweenInfo.new(v6.Duration or 0.5), v8):Play()
end