-- Decompiled game.ReplicatedStorage.Content.Item.BeachBallEmote

local v_u_1 = game:GetService("Debris")
local v_u_2 = game:GetService("ReplicatedStorage")
local v3 = require(script.Parent)
local v_u_4 = require(v_u_2.Tools.Prop)
local v5 = v3.new
local v10 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Beach Ball Emote",
    ["Rarity"] = v3.Rarity.Type.Rare,
    ["Type"] = v3.Type.Emote,
    ["Description"] = "Obtained in the Season 3 Pass",
    ["Asset"] = "rbxassetid://122099685243756",
    ["Metadata"] = {
        ["Looped"] = false,
        ["Callback"] = function(p6, p7)
            -- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_4
            local v_u_8 = v_u_2.Assets.Misc.BeachBall:Clone()
            local v_u_9 = v_u_8.Motor6D
            v_u_8.Name = "Sphere"
            if not p7 then
                v_u_1:AddItem(v_u_8, 5)
                v_u_1:AddItem(v_u_9, 5)
            end
            v_u_8.Parent = p6
            v_u_9.Parent = p6.HumanoidRootPart
            v_u_9.Part0 = p6.HumanoidRootPart
            if not p7 then
                v_u_4.create({
                    ["Instance"] = v_u_8,
                    ["Time"] = 1,
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