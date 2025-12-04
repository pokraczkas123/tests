-- Decompiled game.ReplicatedStorage.Content.Item.GlowStickDanceEmote

local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = v2.new
local v8 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Glow Stick Dance",
    ["Rarity"] = v2.Rarity.Type.Legendary,
    ["Type"] = v2.Type.Emote,
    ["Description"] = "Obtained in the Season 6 Premium Pass",
    ["Asset"] = "rbxassetid://124317486814333",
    ["Metadata"] = {
        ["Looped"] = true,
        ["Callback"] = function(p4, _)
            -- upvalues: (copy) v_u_1
            local v_u_5 = v_u_1.Assets.Misc.Glowsticks:Clone()
            for _, v6 in ipairs(v_u_5:GetChildren()) do
                local v7 = Instance.new("Motor6D")
                v7.Part0 = p4:FindFirstChild((("%*Hand"):format(v6.Name)))
                v7.Part1 = v6
                v7.C0 = CFrame.new(-0.002, -0.173, -0.318) * CFrame.fromOrientation(1.5707963267948966, 3.141592653589793, 0)
                v7.Parent = v_u_5
            end
            v_u_5.Parent = p4
            return function()
                -- upvalues: (copy) v_u_5
                v_u_5:Destroy()
            end
        end
    }
}
return v3(v8)