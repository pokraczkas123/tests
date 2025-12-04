-- Decompiled game.ReplicatedStorage.Content.Monetization.Products.Seasonal

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Content.Reward)
local v3 = {}
local v4 = {
    ["Name"] = "SeasonalRebirth",
    ["Id"] = 3226689036,
    ["Cost"] = 199,
    ["Product"] = {
        ["SeasonalRebirth"] = true
    }
}
v3.Rebirth = v4
local v5 = {
    ["Name"] = "SeasonalPremium",
    ["DisplayName"] = "Season Premium",
    ["Icon"] = "rbxassetid://137631734530713",
    ["Id"] = 3226072570,
    ["Cost"] = 799,
    ["Product"] = {
        ["SeasonalPremium"] = true
    }
}
v3.Premium = v5
local v6 = {
    ["Name"] = "SeasonalUltra",
    ["DisplayName"] = "Ultra Season Premium",
    ["Icon"] = "rbxassetid://137631734530713",
    ["Id"] = 3239020013,
    ["Cost"] = 1599
}
local v7 = {
    ["SeasonalPremium"] = true,
    ["Rewards"] = { v2.new({
            ["Type"] = v2.Type.SeasonalCurrency,
            ["Value"] = 500
        }), v2.new({
            ["Type"] = v2.Type.LuckyStyleSpins,
            ["Value"] = 10
        }), v2.new({
            ["Type"] = v2.Type.SeasonExperience,
            ["Value"] = 1000
        }) }
}
v6.Product = v7
v3.Ultra = v6
v3.Currency = require(script.Currency)
v3.Tiers = require(script.Tiers)
return v3