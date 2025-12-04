-- Decompiled game.ReplicatedStorage.Content.Item.PopcornEmote

local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v_u_3 = require(v_u_1.Tools.Prop)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Popcorn",
    ["Rarity"] = v2.Rarity.Type.Common,
    ["Type"] = v2.Type.Emote,
    ["Description"] = "Obtained in Season 2 Pass",
    ["Asset"] = "rbxassetid://94741755790119"
}
local v10 = {
    ["Looped"] = true,
    ["Callback"] = function(p6, p7)
        -- upvalues: (copy) v_u_1, (copy) v_u_3
        local v_u_8 = v_u_1.Assets.Misc.Popcorn:Clone()
        local v_u_9 = v_u_8.Motor6D
        v_u_8.Parent = p6
        v_u_8.Name = "Handle"
        v_u_9.Parent = p6.HumanoidRootPart
        v_u_9.Part0 = p6.HumanoidRootPart
        v_u_9.Part1 = v_u_8
        if not p7 then
            v_u_3.create({
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
    end,
    ["StockShop"] = {
        ["TotalStock"] = 1,
        ["Weight"] = 1,
        ["Cost"] = NumberRange.new(300, 600)
    }
}
v5.Metadata = v10
return v4(v5)