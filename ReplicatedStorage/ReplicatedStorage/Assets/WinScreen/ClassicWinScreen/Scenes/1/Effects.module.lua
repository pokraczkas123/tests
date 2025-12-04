-- Decompiled game.ReplicatedStorage.Assets.WinScreen.ClassicWinScreen.Scenes.1.Effects

local v_u_1 = require(game.ReplicatedStorage.Tools.Sound)
return function(p2)
    -- upvalues: (copy) v_u_1
    local v3 = p2.Trophy
    local v4 = p2:FindFirstChild("Player1")
    workspace.CurrentCamera.FieldOfView = 35
    v_u_1.fromName("WinCutscene")({})
    if v4 then
        if not v3.Trophy:FindFirstChild("TrophyHandWeld") then
            local v5 = Instance.new("Motor6D", v3.Trophy)
            v5.Name = "TrophyHandWeld"
            v5.Part0 = v4.RightHand
            v5.Part1 = v3.Trophy
            v5.C0 = CFrame.new(-0.04, -0.231, 0.794) * CFrame.fromOrientation(0.04817108735504349, -3.141592653589793, 0)
        end
    else
        return
    end
end