-- Decompiled game.ReplicatedStorage.Content.Monetization.Products.PremiumCurrency

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Content.Reward)
local v3 = {}
local v4 = {
    ["Id"] = 3460302665,
    ["Cost"] = 99
}
local v5 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.PremiumCurrency,
        ["Value"] = 250
    })
}
v4.Product = v5
local v6 = {
    ["Id"] = 3460302805,
    ["Cost"] = 399
}
local v7 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.PremiumCurrency,
        ["Value"] = 1100
    })
}
v6.Product = v7
local v8 = {
    ["Id"] = 3460302868,
    ["Cost"] = 999
}
local v9 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.PremiumCurrency,
        ["Value"] = 2900
    })
}
v8.Product = v9
local v10 = {
    ["Id"] = 3460302966,
    ["Cost"] = 1799
}
local v11 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.PremiumCurrency,
        ["Value"] = 5900
    })
}
v10.Product = v11
__set_list(v3, 1, {v4, v6, v8, v10})
return v3