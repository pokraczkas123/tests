-- Decompiled game.ReplicatedStorage.Content.Item.CrabRaveEmote

local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = v2.new
local v4 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Crab Rave Dance",
    ["Rarity"] = v2.Rarity.Type.Legendary,
    ["Type"] = v2.Type.Emote,
    ["Description"] = "Dance on a crab to Crab Rave!",
    ["Asset"] = "rbxassetid://103778090790810"
}
local v9 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://107342460864353",
        ["Volume"] = 0.3,
        ["RollOffMaxDistance"] = 50
    },
    ["Looped"] = true,
    ["IsWalkable"] = true,
    ["Callback"] = function(p5, _)
        -- upvalues: (copy) v_u_1
        local v_u_6 = v_u_1.Assets.Misc.Crab:Clone()
        for _, v7 in ipairs(v_u_6.CrabHead:GetChildren()) do
            v7.Part0 = v_u_6.CrabHead
            v7.Part1 = v_u_6:FindFirstChild(v7.Name)
        end
        local v8 = Instance.new("Motor6D")
        v8.Part0 = p5.HumanoidRootPart
        v8.Part1 = v_u_6.PrimaryPart
        v8.C0 = CFrame.new() * CFrame.Angles(0, -1.5707963267948966, 0)
        v8.Parent = v_u_6
        v_u_6.Parent = p5
        return function()
            -- upvalues: (copy) v_u_6
            v_u_6:Destroy()
        end
    end
}
v4.Metadata = v9
return v3(v4)