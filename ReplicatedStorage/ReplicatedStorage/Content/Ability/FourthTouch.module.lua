-- Decompiled game.ReplicatedStorage.Content.Ability.FourthTouch

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v3 = require(script.Parent)
local v_u_4 = require(v1.Packages.Knit)
local v_u_5 = require(v1.Common.State)
local v6 = v3.new
local v8 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Extra Touch",
    ["Description"] = "Adds an extra touch to your team\'s play!",
    ["Rarity"] = v3.Rarity.Type.Secret,
    ["Type"] = v3.Type.Activation,
    ["Conditions"] = {
        ["Charge"] = 150,
        ["TimeActive"] = 1
    },
    ["OnActivation"] = function(_, p7)
        -- upvalues: (ref) v_u_2, (copy) v_u_4, (copy) v_u_5
        v_u_2 = v_u_2 or v_u_4.GetService("GameService")
        v_u_5.set(p7, v_u_5.Id.Ability, "FourthTouch", true)
        v_u_2.Client.Effect:FireAll("ExtraTouch", {
            ["Character"] = p7.Character,
            ["IsModuleEffect"] = true,
            ["Props"] = {
                ["Duration"] = 5,
                ["Range"] = 100
            }
        })
    end
}
return v6(v8)