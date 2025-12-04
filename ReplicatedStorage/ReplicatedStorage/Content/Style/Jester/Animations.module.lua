-- Decompiled game.ReplicatedStorage.Content.Style.Jester.Animations

local v_u_1 = game:GetService("ReplicatedStorage")
local v8 = {
    ["Pose"] = {
        ["Id"] = "rbxassetid://111704224696789",
        ["Priority"] = Enum.AnimationPriority.Idle,
        ["Looped"] = true,
        ["Callback"] = function(p2, p3)
            -- upvalues: (copy) v_u_1
            local v4 = v_u_1.Assets.Misc.JesterBalls:GetChildren()
            for _, v5 in ipairs(v4) do
                local v6 = v5:Clone()
                local v7 = Instance.new("Motor6D")
                v7.Parent = p3
                v7.Part0 = p2.PrimaryPart
                v7.Part1 = v6
                v6.Parent = p3
            end
        end
    }
}
return v8