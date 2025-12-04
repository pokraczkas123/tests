-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.LightShowScoreEffect

local v_u_1 = game:GetService("TweenService")
local v_u_2 = game:GetService("Debris")
return function(p3)
    -- upvalues: (copy) v_u_2, (copy) v_u_1
    local v4 = CFrame.new(p3)
    local v5 = script.FX:Clone()
    v_u_2:AddItem(v5, 7)
    v5:PivotTo(v4)
    v5.Parent = workspace
    for _, v_u_6 in ipairs(v5:GetDescendants()) do
        local v_u_7 = {}
        local v8 = v_u_6:GetAttribute("Size")
        local v9 = v_u_6:GetAttribute("RelativeCFrame")
        if v9 then
            if not v_u_6:IsA("Attachment") then
                v9 = v5:GetPivot():ToWorldSpace(v9)
            end
        else
            v9 = nil
        end
        v_u_7.CFrame = v9
        v_u_7.Size = v8
        if v_u_7.Size or v_u_7.CFrame then
            local v_u_10 = {}
            local v11
            if v_u_7.CFrame then
                v11 = v_u_6.CFrame
            else
                v11 = nil
            end
            v_u_10.CFrame = v11
            v_u_10.Size = v8 and Vector3.new(0, 0, 0) or nil
            v_u_1:Create(v_u_6, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), v_u_7):Play()
            task.delay(0.5, function()
                -- upvalues: (copy) v_u_7, (ref) v_u_1, (copy) v_u_6, (copy) v_u_10
                local v12 = v_u_7
                local v13
                if v_u_7.Size then
                    v13 = v_u_7.Size * 0.8
                else
                    v13 = nil
                end
                v12.Size = v13
                v_u_1:Create(v_u_6, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true), v_u_7):Play()
                task.wait(4.5)
                v_u_1:Create(v_u_6, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), v_u_10):Play()
            end)
        end
        task.delay(5, function()
            -- upvalues: (copy) v_u_6
            if v_u_6:IsA("ParticleEmitter") then
                v_u_6.Enabled = false
            end
        end)
    end
end