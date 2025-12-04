-- Decompiled game.ReplicatedStorage.Content.Item.EatTurkeyEmote

local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v_u_3 = require(v_u_1.Common.EmoteLib)
local v4 = v2.new
local v10 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Eat Turkey Emote",
    ["Rarity"] = v2.Rarity.Type.Common,
    ["Type"] = v2.Type.Emote,
    ["Description"] = "Obtained by reaching Gold I in Season 9",
    ["Asset"] = "rbxassetid://137820111150114",
    ["Metadata"] = {
        ["Sound"] = "rbxassetid://105192121263997",
        ["Looped"] = false,
        ["Callback"] = function(p5, _)
            -- upvalues: (copy) v_u_3, (copy) v_u_1
            local v6 = v_u_3.applyRigTemplateToCharacter
            local v7 = {
                ["Character"] = p5,
                ["Rig"] = v_u_1.Assets.Misc.EmoteAssets.EatTurkey
            }
            local v8 = {
                ["TurkeyLeg"] = {
                    ["PartName"] = "Plane"
                }
            }
            v7.RigTemplate = v8
            local v_u_9 = v6(v7)
            return function()
                -- upvalues: (copy) v_u_9
                v_u_9()
            end
        end
    }
}
return v4(v10)