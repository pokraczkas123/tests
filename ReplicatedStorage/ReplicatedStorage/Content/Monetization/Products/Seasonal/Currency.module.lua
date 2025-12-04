-- Decompiled game.ReplicatedStorage.Content.Monetization.Products.Seasonal.Currency

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Content.Reward)
local v3 = {}
local v4 = {
    ["Id"] = 3226043277,
    ["Cost"] = 180
}
local v5 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.SeasonalCurrency,
        ["Value"] = 200
    })
}
v4.Product = v5
local v6 = {
    ["Id"] = 3226043338,
    ["Cost"] = 480
}
local v7 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.SeasonalCurrency,
        ["Value"] = 1000
    })
}
v6.Product = v7
local v8 = {
    ["Id"] = 3226043400,
    ["Cost"] = 900
}
local v9 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.SeasonalCurrency,
        ["Value"] = 3500
    })
}
v8.Product = v9
local v10 = {
    ["Id"] = 3226043462,
    ["Cost"] = 1800
}
local v11 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.SeasonalCurrency,
        ["Value"] = 7000
    })
}
v10.Product = v11
local v12 = {
    ["Id"] = 3226043522,
    ["Cost"] = 3600
}
local v13 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.SeasonalCurrency,
        ["Value"] = 15000
    })
}
v12.Product = v13
__set_list(v3, 1, {v4, v6, v8, v10, v12})
return v3