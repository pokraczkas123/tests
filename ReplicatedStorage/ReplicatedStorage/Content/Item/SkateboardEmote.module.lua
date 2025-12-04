-- Decompiled game.ReplicatedStorage.Content.Item.SkateboardEmote

local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = v2.new
local v7 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Skater",
    ["Rarity"] = v2.Rarity.Type.Godly,
    ["Type"] = v2.Type.Emote,
    ["Description"] = "Obtained by reaching Silver I in Season 5",
    ["Asset"] = "rbxassetid://136874317530219",
    ["Metadata"] = {
        ["WalkAsset"] = "rbxassetid://110236466890382",
        ["WalkSound"] = "rbxassetid://124431936038977",
        ["Looped"] = true,
        ["IsWalkable"] = true,
        ["SpeedMultiplier"] = 0.6,
        ["Callback"] = function(p4, _)
            -- upvalues: (copy) v_u_1
            local v_u_5 = v_u_1.Assets.Misc.Skateboard:Clone()
            local v_u_6 = Instance.new("Motor6D")
            v_u_5.Parent = p4
            v_u_5.Name = "Cube.004"
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