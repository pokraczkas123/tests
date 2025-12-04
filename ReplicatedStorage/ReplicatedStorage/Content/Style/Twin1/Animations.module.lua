-- Decompiled game.ReplicatedStorage.Content.Style.Twin1.Animations

local v_u_1 = game:GetService("ReplicatedStorage")
local v6 = {
    ["Pose"] = {
        ["Id"] = "rbxassetid://105359490382771",
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
        ["Id"] = "rbxassetid://120749033354397",
        ["Priority"] = Enum.AnimationPriority.Core,
        ["Looped"] = true
    },
    ["TossIdle"] = {
        ["Id"] = "rbxassetid://78316912184686",
        ["Priority"] = Enum.AnimationPriority.Idle,
        ["Looped"] = true
    },
    ["Toss"] = {
        ["Id"] = "rbxassetid://80576741405746",
        ["Priority"] = Enum.AnimationPriority.Action3,
        ["AdjustSpeed"] = 1.5
    }
}
return v6