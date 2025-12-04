-- Decompiled game.ReplicatedStorage.Assets.WinScreen.JesterWinScreen.Effects.Transition

game:GetService("Debris")
game:GetService("Lighting")
local v_u_1 = game:GetService("TweenService")
return function()
    -- upvalues: (copy) v_u_1
    v_u_1:Create(workspace.Camera, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        ["FieldOfView"] = 30
    }):Play()
    task.delay(0.3, function()
        -- upvalues: (ref) v_u_1
        v_u_1:Create(workspace.Camera, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            ["FieldOfView"] = 60.8
        }):Play()
    end)
end