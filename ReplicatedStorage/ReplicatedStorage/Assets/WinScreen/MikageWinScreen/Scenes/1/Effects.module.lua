-- Decompiled game.ReplicatedStorage.Assets.WinScreen.MikageWinScreen.Scenes.1.Effects

local v_u_1 = require(game.ReplicatedStorage.Tools.Sound)
return function(p2)
    -- upvalues: (copy) v_u_1
    workspace.CurrentCamera.FieldOfView = 102
    v_u_1.new({
        ["Id"] = "rbxassetid://106876486698520",
        ["Volume"] = 1.5
    })
    if p2:FindFirstChild("Player1") then
        local v3 = game.ReplicatedStorage.Assets.Misc.MikagePortal:Clone()
        local v_u_4 = v3.Attachment:GetChildren()
        for _, v5 in ipairs(v_u_4) do
            if v5:IsA("ParticleEmitter") then
                v5.Enabled = false
            end
        end
        v3.Parent = p2
        v3.CFrame = p2.ParticleOrigin.CFrame
        task.delay(1.2, function()
            -- upvalues: (copy) v_u_4
            for _, v6 in ipairs(v_u_4) do
                if v6:IsA("ParticleEmitter") then
                    v6.Enabled = true
                end
            end
            task.wait(4)
            for _, v7 in ipairs(v_u_4) do
                if v7:IsA("ParticleEmitter") then
                    v7.Enabled = false
                end
            end
        end)
    end
end