-- Decompiled game.ReplicatedStorage.Content.Item.PumpkinDribbleEmote

local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v_u_3 = require(v_u_1.Common.EmoteLib)
local v4 = v2.new
local v10 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Pumpkin Dribble Emote",
    ["Rarity"] = v2.Rarity.Type.Epic,
    ["Type"] = v2.Type.Emote,
    ["Description"] = "Obtained by opening a Crate in Season 9",
    ["Asset"] = "rbxassetid://79391919388386",
    ["Metadata"] = {
        ["Looped"] = true,
        ["Callback"] = function(p5, _)
            -- upvalues: (copy) v_u_3, (copy) v_u_1
            local v6 = v_u_3.applyRigTemplateToCharacter
            local v7 = {
                ["Character"] = p5,
                ["Rig"] = v_u_1.Assets.Misc.EmoteAssets.PumpkinDribble
            }
            local v8 = {
                ["Pumpkin"] = {
                    ["PartName"] = "Cylinder.011"
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