-- Decompiled game.ReplicatedStorage.Content.Boost.Fat

local v1 = require(script.Parent)
return v1.new({
    ["Type"] = v1.Type.Multiplier,
    ["Id"] = script.Name,
    ["DisplayName"] = "Fat Boost",
    ["ItemId"] = "ThickPotionConsumable",
    ["Start"] = function(p2, _)
        repeat
            task.wait(0.5)
        until not p2 or not p2.Parent or p2.Character and p2.Character.Parent
        if p2 and p2.Parent then
            p2:SetAttribute("UpdatedFatScale", 1.5)
            p2.Character.Humanoid.BodyWidthScale.Value = 1.5
            p2.Character.Humanoid.BodyDepthScale.Value = 1.5
        end
    end,
    ["End"] = function(p3)
        p3:SetAttribute("UpdatedFatScale", 1)
        p3.Character.Humanoid.BodyWidthScale.Value = 1
        p3.Character.Humanoid.BodyDepthScale.Value = 1
    end
})