-- Decompiled game.ReplicatedStorage.Content.Item.DigInEmote

local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v_u_3 = require(v_u_1.Common.EmoteLib)
local v4 = v2.new
local v10 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Dig In Emote",
    ["Rarity"] = v2.Rarity.Type.Rare,
    ["Type"] = v2.Type.Emote,
    ["Description"] = "Obtained by reaching Bronze I in Season 9",
    ["Asset"] = "rbxassetid://77650525280767",
    ["Metadata"] = {
        ["Sound"] = "rbxassetid://109472948291167",
        ["Looped"] = false,
        ["Callback"] = function(p5, _)
            -- upvalues: (copy) v_u_3, (copy) v_u_1
            local v6 = v_u_3.applyRigTemplateToCharacter
            local v7 = {
                ["Character"] = p5,
                ["Rig"] = v_u_1.Assets.Misc.EmoteAssets.ForkAndKnife
            }
            local v8 = {
                ["Fork"] = {
                    ["PartName"] = "fork",
                    ["LimbName"] = "RightHand",
                    ["CFrameOffset"] = CFrame.new(0, -0.2, -0.5) * CFrame.fromOrientation(1.5707963267948966, -3.141592653589793, 0)
                },
                ["Knife"] = {
                    ["PartName"] = "knife.001",
                    ["LimbName"] = "LeftHand",
                    ["CFrameOffset"] = CFrame.new(0, -0.2, -0.5) * CFrame.fromOrientation(-1.5707963267948966, 0, 0)
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