-- Decompiled game.ReplicatedStorage.Content.Style.Mikage.Animations

local v_u_1 = game:GetService("ReplicatedStorage")
local v6 = {
    ["Pose"] = {
        ["Id"] = "rbxassetid://124044377589580",
        ["Priority"] = Enum.AnimationPriority.Idle,
        ["Looped"] = true,
        ["Callback"] = function(p2, p3)
            -- upvalues: (copy) v_u_1
            local v4 = v_u_1.Assets.Misc.Mikage_Arms:Clone()
            local v5 = Instance.new("Motor6D")
            v5.Name = "Arms"
            v5.Parent = p3
            v5.Part0 = p2.UpperTorso
            v5.Part1 = v4.UpperTorso
            v4.Name = "Arms"
            v4.Parent = p3
        end
    },
    ["BlockRise"] = {
        ["Id"] = "rbxassetid://104392571261902",
        ["Priority"] = Enum.AnimationPriority.Action3
    },
    ["BlockIdle"] = {
        ["Id"] = "rbxassetid://96031730730237",
        ["Priority"] = Enum.AnimationPriority.Action2,
        ["Looped"] = true
    }
}
return v6