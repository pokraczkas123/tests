-- Decompiled game.ReplicatedStorage.Content.Item.SleepingEmote

local v1 = require(script.Parent)
local v_u_2 = game:GetService("ReplicatedStorage")
local v3 = v1.new
local v7 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Sleeping",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.Emote,
    ["Description"] = "Obtained in Toxic pack",
    ["Asset"] = "rbxassetid://122831006386563",
    ["Metadata"] = {
        ["Looped"] = false,
        ["Sound"] = "rbxassetid://84797698366544",
        ["Callback"] = function(p4, _)
            -- upvalues: (copy) v_u_2
            local v_u_5 = v_u_2.Assets.Misc.Bed:Clone()
            v_u_5:PivotTo((p4.HumanoidRootPart.CFrame + p4.HumanoidRootPart.CFrame.LookVector * -5 - Vector3.new(0, 2.5, 0)) * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966))
            v_u_5.Parent = p4
            local v6 = Instance.new("Weld")
            v6.Parent = v_u_5
            v6.C0 = p4.HumanoidRootPart.CFrame:Inverse()
            v6.C1 = v_u_5.PrimaryPart.CFrame:Inverse()
            v6.Part0 = p4.HumanoidRootPart
            v6.Part1 = v_u_5.PrimaryPart
            return function()
                -- upvalues: (copy) v_u_5
                v_u_5:Destroy()
            end
        end
    }
}
return v3(v7)