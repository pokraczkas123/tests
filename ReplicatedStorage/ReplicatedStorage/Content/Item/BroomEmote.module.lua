-- Decompiled game.ReplicatedStorage.Content.Item.BroomEmote

local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = v2.new
local v7 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Ride a Broom",
    ["Rarity"] = v2.Rarity.Type.Legendary,
    ["Type"] = v2.Type.Emote,
    ["Description"] = "Obtained in the Season 3 Pass",
    ["Asset"] = "rbxassetid://110412699020515",
    ["Metadata"] = {
        ["Looped"] = true,
        ["IsWalkable"] = true,
        ["SpeedMultiplier"] = 0.4,
        ["Callback"] = function(p4, _)
            -- upvalues: (copy) v_u_1
            local v_u_5 = v_u_1.Assets.Misc.WitchBroom:Clone()
            local v_u_6 = Instance.new("Motor6D")
            v_u_5.Parent = p4
            v_u_5.Name = "MeshPart"
            v_u_6.Part0 = p4.HumanoidRootPart
            v_u_6.Part1 = v_u_5
            v_u_6.Parent = p4.HumanoidRootPart
            return function()
                -- upvalues: (copy) v_u_5, (copy) v_u_6
                v_u_5:Destroy()
                v_u_6:Destroy()
            end
        end
    }
}
return v3(v7)