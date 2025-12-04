-- Decompiled game.ReplicatedStorage.Content.Style.TeamCaptain.Animations

local v_u_1 = game:GetService("ReplicatedStorage")
local v9 = {
    ["Pose"] = {
        ["Id"] = "rbxassetid://136715774743374",
        ["Priority"] = Enum.AnimationPriority.Idle,
        ["Looped"] = true,
        ["Callback"] = function(p2, p3)
            -- upvalues: (copy) v_u_1
            for v4 = 1, 2 do
                local v5 = v_u_1.Assets.Misc.Ball:Clone()
                local v6 = Instance.new("Motor6D")
                v6.Parent = v5
                v6.Part0 = p2.PrimaryPart
                v6.Part1 = v5
                v5.Parent = p3
                v5.Name = v4 == 1 and "Ball" or "Ball2"
                local v7 = v_u_1.Assets.Effects:FindFirstChild((("TeamCaptain%*Resized"):format(v4 == 1 and "Large" or "Medium"))):Clone()
                for _, v8 in ipairs(v7:GetChildren()) do
                    v8.Parent = v5
                end
            end
        end
    }
}
return v9