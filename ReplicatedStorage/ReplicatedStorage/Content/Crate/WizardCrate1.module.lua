-- Decompiled game.ReplicatedStorage.Content.Crate.WizardCrate1

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Lottery)
local v4 = require(v1.Content.Reward)
local v5 = v2.new
local v6 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Wizard Crate",
    ["Cost"] = 100,
    ["SeasonId"] = "3",
    ["Image"] = "",
    ["Description"] = "",
    ["Content"] = v3.new({
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "DarkBatBall",
            ["Chance"] = 0.3
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "WandEmote",
            ["Chance"] = 0.25
        },
        {
            ["Type"] = v4.Type.SeasonalCurrency,
            ["Value"] = 200,
            ["Chance"] = 0.18
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "RedEyeBall",
            ["Chance"] = 0.1
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "SpellCasterScoreEffect",
            ["Chance"] = 0.01
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "MagicBurstScoreEffect",
            ["Chance"] = 0.04
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "WizardHatBall",
            ["Chance"] = 0.05
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "CauldronSplashScoreEffect",
            ["Chance"] = 0.07
        }
    })
}
return v5(v6)