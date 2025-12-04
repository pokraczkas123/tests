-- Decompiled game.ReplicatedStorage.Content.Effect.BundledCloneVFX

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(script.Parent)
local v_u_3 = require(v1.Tools.Sound)
return v_u_2.new({
    ["Name"] = script.Name,
    ["Play"] = function(_, p4)
        -- upvalues: (copy) v_u_2, (copy) v_u_3
        v_u_2:Play("Particle")({
            ["Name"] = p4.Off == true and "CloneDespawn" or "CloneFX",
            ["Duration"] = 0.5,
            ["Origin"] = CFrame.new(p4.Position)
        })
        v_u_3.fromName(p4.Off == true and "Clone1Destroy" or "Clone1Spawn")({
            ["Origin"] = CFrame.new(p4.Position)
        })
    end
})