-- Decompiled game.ReplicatedStorage.Content.Monetization.Products.AbilitySpins

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Content.Reward)
local v3 = {}
local v4 = {}
local v5 = {
    ["Name"] = "AbilityLuckySpin1",
    ["DisplayName"] = "1 Lucky Ability Spin",
    ["Icon"] = "rbxassetid://127867934133680",
    ["Id"] = 2710079987,
    ["Cost"] = 299
}
local v6 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.LuckyAbilitySpins,
        ["Value"] = 1
    })
}
v5.Product = v6
local v7 = {
    ["Name"] = "AbilityLuckySpin5",
    ["DisplayName"] = "5 Lucky Ability Spins",
    ["Icon"] = "rbxassetid://127867934133680",
    ["Id"] = 2710081523,
    ["Cost"] = 799
}
local v8 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.LuckyAbilitySpins,
        ["Value"] = 5
    })
}
v7.Product = v8
local v9 = {
    ["Name"] = "AbilityLuckySpin20",
    ["DisplayName"] = "20 Lucky Ability Spins",
    ["Icon"] = "rbxassetid://127867934133680",
    ["Id"] = 2710082150,
    ["Cost"] = 2799,
    ["Discount"] = 1999
}
local v10 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.LuckyAbilitySpins,
        ["Value"] = 20
    })
}
v9.Product = v10
__set_list(v4, 1, {v5, v7, v9})
v3.Lucky = v4
local v11 = {}
local v12 = {
    ["Name"] = "AbilitySpin10",
    ["DisplayName"] = "10 Ability Spins",
    ["Icon"] = "rbxassetid://118481582363423",
    ["Id"] = 2710086127,
    ["Cost"] = 299
}
local v13 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.AbilitySpins,
        ["Value"] = 10
    })
}
v12.Product = v13
local v14 = {
    ["Name"] = "AbilitySpin25",
    ["DisplayName"] = "25 Ability Spins",
    ["Icon"] = "rbxassetid://118481582363423",
    ["Id"] = 2710086274,
    ["Cost"] = 649
}
local v15 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.AbilitySpins,
        ["Value"] = 25
    })
}
v14.Product = v15
local v16 = {
    ["Name"] = "AbilitySpin50",
    ["DisplayName"] = "50 Ability Spins",
    ["Icon"] = "rbxassetid://118481582363423",
    ["Id"] = 2710086378,
    ["Cost"] = 1299
}
local v17 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.AbilitySpins,
        ["Value"] = 50
    })
}
v16.Product = v17
__set_list(v11, 1, {v12, v14, v16})
v3.Classic = v11
return v3