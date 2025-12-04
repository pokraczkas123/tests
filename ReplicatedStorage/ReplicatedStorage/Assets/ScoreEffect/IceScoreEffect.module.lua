-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.IceScoreEffect

local v_u_1 = game:GetService("Debris")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = Random.new()
return function(p4)
    -- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_2
    local v_u_5 = CFrame.new(p4)
    local v_u_6 = {}
    local v7 = script.Shard:Clone()
    v_u_1:AddItem(v7, 10)
    table.insert(v_u_6, v7)
    for _ = 1, 20 do
        local v8 = script.Shard:Clone()
        v_u_1:AddItem(v8, 10)
        table.insert(v_u_6, v8)
        v8.CFrame = v_u_5
        local v9 = math.random(-360, 360)
        local v10 = math.random(-360, 360)
        local v11 = math.random
        v8.Orientation = Vector3.new(v9, v10, v11(-360, 360))
        v8.Parent = workspace.Effects
        local v12 = v_u_3:NextNumber(1, 3)
        local v13 = v_u_3:NextNumber(10, 40)
        v_u_2:Create(v8, TweenInfo.new(v_u_3:NextNumber(0.125, 0.235), Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            ["Size"] = Vector3.new(v12, v13, v12)
        }):Play()
        task.wait(0.0095)
    end
    task.delay(0.025, function()
        -- upvalues: (copy) v_u_6, (ref) v_u_2, (ref) v_u_3, (ref) v_u_1, (copy) v_u_5
        task.spawn(function()
            -- upvalues: (ref) v_u_6, (ref) v_u_2, (ref) v_u_3
            for _, v14 in pairs(v_u_6) do
                v_u_2:Create(v14, TweenInfo.new(v_u_3:NextNumber(0.1, 0.25), Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                    ["Size"] = Vector3.new(0, 0, 0)
                }):Play()
                game.Debris:AddItem(v14, 0.075)
                task.wait(0.005)
            end
        end)
        task.wait(0.2)
        local v15 = script.Explosion:Clone()
        v_u_1:AddItem(v15, 10)
        v15.CFrame = v_u_5
        v15.Parent = workspace.Effects
        for _, v16 in v15:GetDescendants() do
            if v16:IsA("ParticleEmitter") then
                v16:Emit(v16:GetAttribute("EmitCount"))
            end
        end
    end)
end