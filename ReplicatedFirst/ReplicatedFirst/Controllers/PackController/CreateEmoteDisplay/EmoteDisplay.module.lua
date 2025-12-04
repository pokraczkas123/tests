-- Decompiled game.ReplicatedFirst.Controllers.PackController.CreateEmoteDisplay.EmoteDisplay

local v1 = game:GetService("ReplicatedStorage")
require(v1.Content.Item)
local v_u_2 = require(v1.Tools.Utility)
return function(p3, p4)
    -- upvalues: (copy) v_u_2
    local v5 = v_u_2.getRigTemplateAsync()
    v5.Parent = p4
    v5:PivotTo(p4:GetPivot() + Vector3.new(0, 2.5, 0))
    v5.HumanoidRootPart.CFrame = CFrame.new(v5.HumanoidRootPart.Position) * CFrame.Angles(0, -0.7853981633974483, 0)
    v5.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    local v6 = Instance.new("Animation")
    local v7 = v5:WaitForChild("Humanoid"):WaitForChild("Animator")
    v6.AnimationId = p3.Asset
    v6.Parent = v5
    local v8 = v7:LoadAnimation(v6)
    v8.Looped = true
    v8.Priority = Enum.AnimationPriority.Action4
    if p3.Metadata and p3.Metadata.Callback then
        p3.Metadata.Callback(v5, true)
    end
    v8:Play()
end