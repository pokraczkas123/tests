-- Decompiled game.ReplicatedStorage.Content.Item.EggThrowEmote

local v_u_1 = game:GetService("Debris")
local v_u_2 = game:GetService("ReplicatedStorage")
local v3 = require(script.Parent)
local v_u_4 = require(v_u_2.Tools.Prop)
local v5 = v3.new
local v10 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Egg Thrower",
    ["Rarity"] = v3.Rarity.Type.Legendary,
    ["Type"] = v3.Type.Emote,
    ["Description"] = "Obtained opening an Easter Egg",
    ["Asset"] = "rbxassetid://95821497316213",
    ["Metadata"] = {
        ["Looped"] = false,
        ["Callback"] = function(p6, p7)
            -- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_4
            local v_u_8 = v_u_2.Assets.Misc.Egg:Clone()
            local v_u_9 = v_u_8.Motor6D
            if not p7 then
                v_u_1:AddItem(v_u_8, 2)
                v_u_1:AddItem(v_u_9, 7)
            end
            v_u_8.Parent = p6
            v_u_9.Parent = p6.HumanoidRootPart
            v_u_9.Part0 = p6.HumanoidRootPart
            v_u_9.Part1 = v_u_8
            if not p7 then
                v_u_4.create({
                    ["Instance"] = v_u_8,
                    ["Time"] = 0.5,
                    ["HasParticle"] = false
                })
            end
            return function()
                -- upvalues: (copy) v_u_8, (copy) v_u_9
                v_u_8:Destroy()
                v_u_9:Destroy()
            end
        end
    }
}
return v5(v10)