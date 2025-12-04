-- Decompiled game.ReplicatedStorage.Content.Item.SadTromboneEmote

local v_u_1 = game:GetService("Debris")
local v_u_2 = game:GetService("ReplicatedStorage")
local v3 = require(script.Parent)
local v_u_4 = require(v_u_2.Tools.Prop)
local v5 = v3.new
local v6 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Sad Trombone",
    ["Rarity"] = v3.Rarity.Type.Legendary,
    ["Type"] = v3.Type.Emote,
    ["Description"] = "Obtained by reaching Bronze I in Season 0",
    ["Asset"] = "rbxassetid://101251252308358"
}
local v10 = {
    ["Sound"] = "rbxassetid://139437045927497",
    ["Looped"] = false,
    ["Callback"] = function(p7, p8)
        -- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_4
        local v_u_9 = v_u_2.Assets.Misc.Trombone:Clone()
        if not p8 then
            v_u_1:AddItem(v_u_9, 5)
        end
        v_u_9.Parent = p7.LeftHand
        v_u_9.Weld.Part0 = p7.LeftHand
        if not p8 then
            v_u_4.create({
                ["Instance"] = v_u_9,
                ["Time"] = 1
            })
        end
        return function()
            -- upvalues: (copy) v_u_9
            v_u_9:Destroy()
        end
    end,
    ["StockShop"] = {
        ["TotalStock"] = 1,
        ["Weight"] = 1,
        ["Cost"] = NumberRange.new(1000, 2000)
    }
}
v6.Metadata = v10
return v5(v6)