-- Decompiled game.ReplicatedStorage.Content.Item.BecomeSpiderEmote

local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v_u_3 = require(v_u_1.Packages.Maid)
local v4 = v2.new
local v11 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Become a Spider",
    ["Rarity"] = v2.Rarity.Type.Godly,
    ["Type"] = v2.Type.Emote,
    ["Description"] = "Obtained by Rebirthing 5 times in Season 8",
    ["Asset"] = "rbxassetid://131564679981855",
    ["Metadata"] = {
        ["WalkAsset"] = "rbxassetid://134780874383533",
        ["IsWalkable"] = true,
        ["Looped"] = true,
        ["SpeedMultiplier"] = 0.8,
        ["Callback"] = function(p5, _)
            -- upvalues: (copy) v_u_3, (copy) v_u_1
            local v_u_6 = v_u_3.new()
            local v7 = {}
            for _, v8 in v_u_1.Assets.Misc.BecomeSpiderAssets:Clone():GetChildren() do
                v_u_6:GiveTask(v8)
                v7[v8.Name] = v8
                local v9 = p5:FindFirstChild((string.gsub(v8.Name, "SPIDER_", "")))
                if v9 then
                    v8.Color = v9.Color
                end
            end
            v7.SPIDER_LeftUpperLeg.LeftHip.Part0 = p5.LowerTorso
            v7.SPIDER_RightUpperLeg.RightHip.Part0 = p5.LowerTorso
            for _, v10 in v7 do
                v10.Parent = p5
            end
            return function()
                -- upvalues: (copy) v_u_6
                v_u_6:DoCleaning()
            end
        end
    }
}
return v4(v11)