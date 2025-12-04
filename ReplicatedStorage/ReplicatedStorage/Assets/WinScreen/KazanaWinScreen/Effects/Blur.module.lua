-- Decompiled game.ReplicatedStorage.Assets.WinScreen.KazanaWinScreen.Effects.Blur

game:GetService("Debris")
local v_u_1 = game:GetService("Lighting")
local v_u_2 = game:GetService("TweenService")
return function()
    -- upvalues: (copy) v_u_1, (copy) v_u_2
    local v3 = Instance.new("DepthOfFieldEffect", v_u_1)
    v3.FocusDistance = 1
    v3.InFocusRadius = 0
    v_u_2:Create(v3, TweenInfo.new(3), {
        ["InFocusRadius"] = 50
    }):Play()
    return v3
end