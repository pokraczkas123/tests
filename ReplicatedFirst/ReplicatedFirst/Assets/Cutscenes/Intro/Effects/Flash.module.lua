-- Decompiled game.ReplicatedFirst.Assets.Cutscenes.Intro.Effects.Flash

game:GetService("Debris")
local v_u_1 = game:GetService("Lighting")
local v_u_2 = game:GetService("TweenService")
return function()
    -- upvalues: (copy) v_u_1, (copy) v_u_2
    local v3 = Instance.new("ColorCorrectionEffect", v_u_1)
    v3.Brightness = 0.3
    v_u_2:Create(v3, TweenInfo.new(1.5), {
        ["Brightness"] = 0
    }):Play()
    return v3
end