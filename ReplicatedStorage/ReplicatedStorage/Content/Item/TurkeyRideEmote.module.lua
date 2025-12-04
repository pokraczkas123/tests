-- Decompiled game.ReplicatedStorage.Content.Item.TurkeyRideEmote

local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v_u_3 = require(v_u_1.Packages.Maid)
local v4 = v2.new
local v9 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Ride a Turkey Emote",
    ["Rarity"] = v2.Rarity.Type.Godly,
    ["Type"] = v2.Type.Emote,
    ["Description"] = "Obtained by Rebirthing 5 times in Season 9",
    ["Asset"] = "rbxassetid://134337451655995",
    ["Metadata"] = {
        ["WalkAsset"] = "rbxassetid://125626331883194",
        ["Looped"] = true,
        ["IsWalkable"] = true,
        ["Callback"] = function(p5, _)
            -- upvalues: (copy) v_u_3, (copy) v_u_1
            local v_u_6 = v_u_3.new()
            local v7 = v_u_1.Assets.Misc.EmoteAssets.RideTurkey.Turkey:Clone()
            v7.Parent = p5
            for _, v8 in v7.Motors:GetChildren() do
                v_u_6:GiveTask(v8)
                v8.Part0 = p5.HumanoidRootPart
                v8.Parent = p5.HumanoidRootPart
            end
            v_u_6:GiveTask(v7)
            return function()
                -- upvalues: (copy) v_u_6
                v_u_6:DoCleaning()
            end
        end
    }
}
return v4(v9)