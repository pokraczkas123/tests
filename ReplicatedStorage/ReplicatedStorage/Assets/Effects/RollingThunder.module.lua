-- Decompiled game.ReplicatedStorage.Assets.Effects.RollingThunder

game:GetService("TweenService")
game:GetService("Debris")
return function(p1)
    local v2 = script.VFX
    local v3 = v2["Meteor-VFX"]:Clone()
    local v4 = v2["Rubber-Trail"]:Clone()
    local v5 = v2["Shard-Trail"]:Clone()
    local v_u_6 = { v3, v4, v5 }
    local v7 = p1.HumanoidRootPart
    v3.Connector.Part1 = v7
    v4.Connector.Part1 = v7
    v5.Connector.Part1 = v7
    v3.Parent = v7
    v4.Parent = v7
    v5.Parent = v7
    task.delay(1, function()
        -- upvalues: (copy) v_u_6
        for _, v8 in ipairs(v_u_6) do
            v8:Destroy()
        end
    end)
end