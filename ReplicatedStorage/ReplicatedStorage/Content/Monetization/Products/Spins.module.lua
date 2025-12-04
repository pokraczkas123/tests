-- Decompiled game.ReplicatedStorage.Content.Monetization.Products.Spins

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Content.Reward)
local v3 = {}
local v4 = {}
local v5 = {
    ["Name"] = "LuckySpin1",
    ["DisplayName"] = "1 Lucky Style Spin",
    ["Icon"] = "rbxassetid://107354764581233",
    ["Id"] = 2679266861,
    ["Cost"] = 199
}
local v6 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.LuckyStyleSpins,
        ["Value"] = 1
    })
}
v5.Product = v6
local v7 = {
    ["Name"] = "LuckySpin5",
    ["DisplayName"] = "5 Lucky Style Spins",
    ["Icon"] = "rbxassetid://107354764581233",
    ["Id"] = 2679266860,
    ["Cost"] = 499
}
local v8 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.LuckyStyleSpins,
        ["Value"] = 5
    })
}
v7.Product = v8
local v9 = {
    ["Name"] = "LuckySpin20",
    ["DisplayName"] = "20 Lucky Style Spins",
    ["Icon"] = "rbxassetid://107354764581233",
    ["Id"] = 2679266859,
    ["Cost"] = 1599,
    ["Discount"] = 1999
}
local v10 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.LuckyStyleSpins,
        ["Value"] = 20
    })
}
v9.Product = v10
__set_list(v4, 1, {v5, v7, v9})
v3.Lucky = v4
local v11 = {}
local v12 = {
    ["Name"] = "Spin10",
    ["DisplayName"] = "10 Style Spins",
    ["Icon"] = "rbxassetid://75289572541016",
    ["Id"] = 2679266858,
    ["Cost"] = 149
}
local v13 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.StyleSpins,
        ["Value"] = 10
    })
}
v12.Product = v13
local v14 = {
    ["Name"] = "Spin25",
    ["DisplayName"] = "25 Style Spins",
    ["Icon"] = "rbxassetid://75289572541016",
    ["Id"] = 2679266857,
    ["Cost"] = 249
}
local v15 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.StyleSpins,
        ["Value"] = 25
    })
}
v14.Product = v15
local v16 = {
    ["Name"] = "Spin50",
    ["DisplayName"] = "50 Style Spins",
    ["Icon"] = "rbxassetid://75289572541016",
    ["Id"] = 2679266856,
    ["Cost"] = 449
}
local v17 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.StyleSpins,
        ["Value"] = 50
    })
}
v16.Product = v17
__set_list(v11, 1, {v12, v14, v16})
v3.Classic = v11
return v3