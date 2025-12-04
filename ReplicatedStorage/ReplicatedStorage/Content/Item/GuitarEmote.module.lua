-- Decompiled game.ReplicatedStorage.Content.Item.GuitarEmote

local v_u_1 = game:GetService("Debris")
local v_u_2 = game:GetService("ReplicatedStorage")
local v3 = require(script.Parent)
local v_u_4 = require(v_u_2.Tools.Prop)
local v5 = v3.new
local v6 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Guitar",
    ["Rarity"] = v3.Rarity.Type.Common,
    ["Type"] = v3.Type.Emote,
    ["Asset"] = "rbxassetid://113840100441066",
    ["Description"] = "Obtained in Season 1 Pass"
}
local v10 = {
    ["Sound"] = "rbxassetid://91517673773652",
    ["Looped"] = false,
    ["Callback"] = function(p7, p8)
        -- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_4
        local v_u_9 = v_u_2.Assets.Misc.Guitar:Clone()
        if not p8 then
            v_u_1:AddItem(v_u_9, 5)
        end
        v_u_9.Parent = p7
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
        ["Cost"] = NumberRange.new(1200, 2000)
    }
}
v6.Metadata = v10
return v5(v6)