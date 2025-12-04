-- Decompiled game.ReplicatedStorage.Content.Style.Twin2.Animations

local v_u_1 = game:GetService("ReplicatedStorage")
local v6 = {
    ["Pose"] = {
        ["Id"] = "rbxassetid://121837599223469",
        ["Priority"] = Enum.AnimationPriority.Idle,
        ["Looped"] = true,
        ["Callback"] = function(p2, p3)
            -- upvalues: (copy) v_u_1
            local v4 = v_u_1.Assets.Misc.Ball:Clone()
            local v5 = Instance.new("Motor6D")
            v5.Parent = v4
            v5.Part0 = p2.PrimaryPart
            v5.Part1 = v4
            v4.Parent = p3
        end
    },
    ["Idle"] = {
        ["Id"] = "rbxassetid://70885759462277",
        ["Priority"] = Enum.AnimationPriority.Core,
        ["Looped"] = true
    }
}
return v6