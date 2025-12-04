-- Decompiled game.ReplicatedFirst.Controllers.BoostController

local v1 = game:GetService("ReplicatedStorage").Packages
local v_u_2 = nil
local v_u_3 = require(script.Boost)
local v_u_4 = require(v1.Knit)
local v_u_5 = require(v1.Fusion)
local v_u_6 = v_u_5.Hydrate
local v_u_7 = v_u_5.Children
local v_u_8 = v_u_5.ForPairs
local v9 = v_u_4.CreateController({
    ["Name"] = "BoostController"
})
function v9.KnitStart(p10)
    -- upvalues: (ref) v_u_2, (copy) v_u_4
    v_u_2 = v_u_4.GetService("BoostService")
    p10.InterfaceController = v_u_4.GetController("InterfaceController")
    p10.Boosts = p10:BindToBoosts()
    p10.Component = p10:LoadComponent()
    v_u_2.Gravity:Connect(function(p11)
        workspace.Gravity = p11
    end)
end
function v9.BindToBoosts(_)
    -- upvalues: (copy) v_u_5, (ref) v_u_2
    local v_u_12 = v_u_5.Value({})
    v_u_2.PlayerBoosts:Observe(function(p13)
        -- upvalues: (copy) v_u_12
        if p13 then
            v_u_12:set(p13)
        end
    end)
    return v_u_12
end
function v9.LoadComponent(p14)
    -- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_3, (copy) v_u_5
    local v15 = p14.InterfaceController.App.Persistant.BoostContainer
    local v_u_16 = v15.Template
    return v_u_6(v15)({
        [v_u_7] = v_u_8(p14.Boosts, function(p17, p18)
            -- upvalues: (ref) v_u_3, (copy) v_u_16
            return p17, v_u_3({
                ["Component"] = v_u_16:Clone(),
                ["BoostId"] = p17,
                ["EndTimestamp"] = p18.EndTimestamp
            })
        end, v_u_5.cleanup)
    })
end
return v9