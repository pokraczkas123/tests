-- Decompiled game.ReplicatedStorage.Content.Special.Hakka.PostAction.Orchestator.CharClone.Effects

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = require(v1.Packages.Knit)
return {
    ["playSpawnEffect"] = function(p4, p5)
        -- upvalues: (ref) v_u_2, (copy) v_u_3
        v_u_2 = v_u_2 or v_u_3.GetService("GameService")
        local v6 = p4:GetPivot()
        v_u_2.Client.Effect:FireAll("BundledCloneVFX", {
            ["Position"] = v6.Position
        })
        v_u_2.Client.Effect:Fire(p5, "CloneCamera", {
            ["Clone"] = p4
        })
    end,
    ["playFadeEffect"] = function(p7)
        -- upvalues: (ref) v_u_2, (copy) v_u_3
        v_u_2 = v_u_2 or v_u_3.GetService("GameService")
        local v8 = p7:GetPivot()
        v_u_2.Client.Effect:FireAll("BundledCloneVFX", {
            ["Position"] = v8.Position,
            ["Off"] = true
        })
    end
}