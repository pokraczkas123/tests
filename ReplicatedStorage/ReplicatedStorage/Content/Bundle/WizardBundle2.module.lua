-- Decompiled game.ReplicatedStorage.Content.Bundle.WizardBundle2

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Reward)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Wizard Bundle",
    ["Group"] = "WizardBundleSeason3",
    ["Image"] = "rbxassetid://130936188041005",
    ["Color"] = Color3.fromRGB(5, 9, 255),
    ["Timestamp"] = {
        ["Start"] = DateTime.fromUniversalTime(2025, 3, 23, 18, 0, 0).UnixTimestamp,
        ["End"] = DateTime.fromUniversalTime(2025, 5, 10, 15, 30, 0).UnixTimestamp
    },
    ["Rewards"] = {
        v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "SaturnBall"
        }),
        v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "FeatherIngredient",
            ["Quantity"] = 5
        }),
        v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "MushroomIngredient",
            ["Quantity"] = 5
        }),
        v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "CosmicSpiralScoreEffect"
        })
    }
}
return v4(v5)