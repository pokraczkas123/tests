-- Decompiled game.ReplicatedStorage.Content.Item.CleanSweepEmote

local v_u_1 = game:GetService("Debris")
local v_u_2 = game:GetService("ReplicatedStorage")
local v3 = require(script.Parent)
local v_u_4 = require(v_u_2.Tools.Prop)
local v5 = v3.new
local v6 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Clean Sweep",
    ["Rarity"] = v3.Rarity.Type.Legendary,
    ["Type"] = v3.Type.Emote,
    ["Description"] = "Obtained by reaching Bronze I in Season 2",
    ["Asset"] = "rbxassetid://75002887986582"
}
local v11 = {
    ["Looped"] = false,
    ["Callback"] = function(p7, p8)
        -- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_4
        local v_u_9 = v_u_2.Assets.Misc.Broom:Clone()
        local v_u_10 = v_u_9.MeshPart
        if not p8 then
            v_u_1:AddItem(v_u_9, 5)
            v_u_1:AddItem(v_u_10, 5)
        end
        v_u_9.Parent = p7
        v_u_9.Name = "MeshPart"
        v_u_10.Parent = p7.HumanoidRootPart
        v_u_10.Part0 = p7.HumanoidRootPart
        v_u_10.Part1 = v_u_9
        if not p8 then
            v_u_4.create({
                ["Instance"] = v_u_9,
                ["Time"] = 1
            })
        end
        return function()
            -- upvalues: (copy) v_u_9, (copy) v_u_10
            v_u_9:Destroy()
            v_u_10:Destroy()
        end
    end,
    ["StockShop"] = {
        ["TotalStock"] = 1,
        ["Weight"] = 1,
        ["Cost"] = NumberRange.new(350, 600)
    }
}
v6.Metadata = v11
return v5(v6)