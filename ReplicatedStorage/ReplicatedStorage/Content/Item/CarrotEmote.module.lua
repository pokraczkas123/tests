-- Decompiled game.ReplicatedStorage.Content.Item.CarrotEmote

local v_u_1 = game:GetService("Debris")
local v_u_2 = game:GetService("ReplicatedStorage")
local v3 = require(script.Parent)
local v4 = v3.new
local v9 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Carrot Emote",
    ["Rarity"] = v3.Rarity.Type.Rare,
    ["Type"] = v3.Type.Emote,
    ["Description"] = "Obtained by opening an Easter Crate",
    ["Asset"] = "rbxassetid://76449786642425",
    ["Metadata"] = {
        ["Looped"] = false,
        ["Callback"] = function(p5, p6)
            -- upvalues: (copy) v_u_2, (copy) v_u_1
            local v_u_7 = v_u_2.Assets.Misc.Carrot:Clone()
            local v_u_8 = Instance.new("Motor6D")
            if not p6 then
                v_u_1:AddItem(v_u_7, 5)
                v_u_1:AddItem(v_u_8, 5)
            end
            v_u_7.Parent = p5
            v_u_8.Part0 = p5.HumanoidRootPart
            v_u_8.Part1 = v_u_7
            v_u_8.Parent = p5.HumanoidRootPart
            return function()
                -- upvalues: (copy) v_u_7, (copy) v_u_8
                v_u_7:Destroy()
                v_u_8:Destroy()
            end
        end
    }
}
return v4(v9)