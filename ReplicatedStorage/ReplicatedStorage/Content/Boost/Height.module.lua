-- Decompiled game.ReplicatedStorage.Content.Boost.Height

local v1 = require(script.Parent)
return v1.new({
    ["Type"] = v1.Type.Physics,
    ["Id"] = script.Name,
    ["DisplayName"] = "Height Boost",
    ["ItemId"] = "HeightPotionConsumable",
    ["Start"] = function(p2, _)
        repeat
            task.wait(0.5)
        until not p2 or not p2.Parent or p2.Character and p2.Character.Parent
        if p2 and p2.Parent then
            if not p2:GetAttribute("OriginalHeightScale") then
                p2:SetAttribute("OriginalHeightScale", p2.Character:WaitForChild("Humanoid"):WaitForChild("BodyHeightScale").Value)
            end
            p2:SetAttribute("UpdatedHeightScale", 2)
            p2.Character.Humanoid.BodyHeightScale.Value = 2
        end
    end,
    ["End"] = function(p3)
        p3:SetAttribute("UpdatedHeightScale", nil)
        p3.Character.Humanoid.BodyHeightScale.Value = p3:GetAttribute("OriginalHeightScale") or 1
    end
})