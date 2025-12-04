-- Decompiled game.ReplicatedStorage.Content.Item.TongueEmote

local v_u_1 = game:GetService("Debris")
local v_u_2 = game:GetService("ReplicatedStorage")
local v3 = require(script.Parent)
local v4 = v3.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Tongue Taunt",
    ["Rarity"] = v3.Rarity.Type.Rare,
    ["Type"] = v3.Type.Emote,
    ["Description"] = "Obtained by reaching Bronze I in Season 4",
    ["Asset"] = "rbxassetid://114487267538974"
}
local v10 = {
    ["Looped"] = false,
    ["Sound"] = "rbxassetid://87431132101532",
    ["Callback"] = function(p6, p7)
        -- upvalues: (copy) v_u_2, (copy) v_u_1
        local v_u_8 = v_u_2.Assets.Misc.Tongue:Clone()
        local v_u_9 = v_u_8.Motor6D
        v_u_8.Name = "Cube.001"
        if not p7 then
            v_u_1:AddItem(v_u_8, 5)
            v_u_1:AddItem(v_u_9, 5)
        end
        v_u_8.Parent = p6
        v_u_9.Parent = p6.HumanoidRootPart
        v_u_9.Part0 = p6.HumanoidRootPart
        return function()
            -- upvalues: (copy) v_u_8, (copy) v_u_9
            v_u_8:Destroy()
            v_u_9:Destroy()
        end
    end,
    ["StockShop"] = {
        ["TotalStock"] = 1,
        ["Weight"] = 1,
        ["Cost"] = NumberRange.new(1200, 2000)
    }
}
v5.Metadata = v10
return v4(v5)