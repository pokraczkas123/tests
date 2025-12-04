-- Decompiled game.ReplicatedStorage.Content.Item.TenOutOfTenEmote

local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v_u_3 = require(v_u_1.Tools.Prop)
local v4 = v2.new
local v9 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "10 out of 10",
    ["Rarity"] = v2.Rarity.Type.Rare,
    ["Type"] = v2.Type.Emote,
    ["Description"] = "Obtained in Toxic pack",
    ["Asset"] = "rbxassetid://117965285105587",
    ["Metadata"] = {
        ["Looped"] = false,
        ["Callback"] = function(p5, p6)
            -- upvalues: (copy) v_u_1, (copy) v_u_3
            local v_u_7 = v_u_1.Assets.Misc.Scorecard:Clone()
            local v_u_8 = v_u_7.Scorecard
            v_u_7.Parent = p5
            v_u_8.Part0 = p5.HumanoidRootPart
            v_u_8.Part1 = v_u_7
            v_u_8.Parent = p5.HumanoidRootPart
            if not p6 then
                v_u_3.create({
                    ["Instance"] = v_u_7,
                    ["Time"] = 0.5,
                    ["HasParticle"] = false
                })
            end
            return function()
                -- upvalues: (copy) v_u_8, (copy) v_u_7
                v_u_8:Destroy()
                v_u_7:Destroy()
            end
        end
    }
}
return v4(v9)