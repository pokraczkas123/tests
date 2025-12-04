-- Decompiled game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.DebrisModule

local v_u_1 = game:GetService("TweenService")
game:GetService("RunService")
local v_u_2 = game:GetService("Debris")
return function(p3, p4)
    -- upvalues: (copy) v_u_2, (copy) v_u_1
    if p3 then
        local v5 = p4 and (p4.Part or "Part") or "Part"
        local v6 = p4 and (p4.Amount or 15) or 15
        local v7 = p4 and (p4.SizeMultiplier or 1) or 1
        local v8 = p4 and p4.Size or Vector3.new(3, 3, 0.8) * v7
        local v9 = p4 and (p4.Velocity or 115) or 115
        local v10 = p4 and (p4.SpreadFactor or 2) or 2
        local _ = p4 and p4.FallSpeed
        local v_u_11
        if p4 then
            v_u_11 = p4.CanCollide
        else
            v_u_11 = p4
        end
        local v12 = p4 and p4.Duration or 4
        local v_u_13 = {}
        for _ = 1, v6 do
            local v_u_14 = Instance.new("Part")
            if typeof(v5) == "Instance" then
                v_u_14 = v5:Clone()
            elseif type(v5) == "string" then
                v_u_14 = script[v5]:Clone()
            end
            v_u_14.Anchored = false
            v_u_14.CanCollide = false
            v_u_14.CanTouch = false
            v_u_14.CanQuery = false
            v_u_14.CFrame = p3.CFrame
            v_u_14.Size = v8
            v_u_14.Material = Enum.Material.Slate
            v_u_14.Color = Color3.fromRGB(42, 43, 56)
            local v15 = math.random(-360, 360)
            local v16 = math.random(-360, 360)
            local v17 = math.random
            v_u_14.Orientation = Vector3.new(v15, v16, v17(-360, 360))
            local v18 = math.random(-v9, v9) / v10
            local v19 = math.random(v9 * 0.5, v9)
            local v20 = math.random(-v9, v9) / v10
            v_u_14.Velocity = Vector3.new(v18, v19, v20)
            v_u_14.Parent = workspace.Effects
            v_u_2:AddItem(v_u_14, v12)
            table.insert(v_u_13, v_u_14)
            task.delay(0.3, function()
                -- upvalues: (copy) v_u_14, (copy) v_u_11
                v_u_14.CanCollide = v_u_11
            end)
            task.delay(v12 / 1.5, function()
                -- upvalues: (ref) v_u_1, (copy) v_u_14
                v_u_1:Create(v_u_14, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    ["Size"] = Vector3.new(0, 0, 0)
                }):Play()
            end)
        end
        task.delay(v12, function()
            -- upvalues: (ref) v_u_13
            v_u_13 = nil
        end)
    end
end