-- Decompiled game.ReplicatedStorage.Content.Style.Kazana.Animations

local v_u_1 = game:GetService("ReplicatedStorage")
local v6 = {
    ["Pose"] = {
        ["Id"] = "rbxassetid://74488161988601",
        ["Priority"] = Enum.AnimationPriority.Idle,
        ["Looped"] = true,
        ["Callback"] = function(p2, p3)
            -- upvalues: (copy) v_u_1
            local v4 = v_u_1.Assets.Misc.Wings:Clone()
            local v5 = Instance.new("Motor6D")
            v5.Name = "Cube.006"
            v5.Parent = p3
            v5.Part0 = p2.UpperTorso
            v5.Part1 = v4
            v5.C0 = CFrame.new(-0.022, 1.029, 0.992)
            v4.Name = "Cube.006"
            v4.Parent = p3
        end
    },
    ["SpikeJump"] = {
        ["Id"] = "rbxassetid://85280218407845",
        ["Priority"] = Enum.AnimationPriority.Action3
    },
    ["SpikeIdle"] = {
        ["Id"] = "rbxassetid://135383895946683",
        ["Priority"] = Enum.AnimationPriority.Action2,
        ["Looped"] = true
    },
    ["Spike"] = {
        ["Id"] = "rbxassetid://108493045925974",
        ["Priority"] = Enum.AnimationPriority.Action3
    },
    ["SpikeHitIdle"] = {
        ["Id"] = "rbxassetid://73505036791651",
        ["Priority"] = Enum.AnimationPriority.Action2,
        ["Looped"] = true
    }
}
return v6