-- Decompiled game.ReplicatedStorage.Content.Item.LockerRoomPlayerCard

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Common.Objective)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Locker Room",
    ["Rarity"] = v2.Rarity.Type.Common,
    ["Type"] = v2.Type.PlayerCard,
    ["Description"] = "empty",
    ["Asset"] = "rbxassetid://112633972727852"
}
local v6 = {
    ["Objective"] = v3.new({
        ["Type"] = v3.Type.Games,
        ["Value"] = 50
    }),
    ["Color"] = Color3.fromRGB(27, 43, 19)
}
v5.Metadata = v6
return v4(v5)