-- Decompiled game.ReplicatedStorage.Content.Monetization.Products.Currency

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Content.Reward)
local v3 = {}
local v4 = {
    ["Id"] = 2681990278,
    ["Cost"] = 199
}
local v5 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.Currency,
        ["Value"] = 1000
    })
}
v4.Product = v5
local v6 = {
    ["Id"] = 2681990272,
    ["Cost"] = 399
}
local v7 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.Currency,
        ["Value"] = 2500
    })
}
v6.Product = v7
local v8 = {
    ["Id"] = 2681990271,
    ["Cost"] = 799
}
local v9 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.Currency,
        ["Value"] = 7500
    })
}
v8.Product = v9
local v10 = {
    ["Id"] = 2681990270,
    ["Cost"] = 1999
}
local v11 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.Currency,
        ["Value"] = 25000
    })
}
v10.Product = v11
__set_list(v3, 1, {v4, v6, v8, v10})
return v3