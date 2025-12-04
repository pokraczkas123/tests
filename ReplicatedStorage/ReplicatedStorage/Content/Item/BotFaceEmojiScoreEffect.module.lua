-- Decompiled game.ReplicatedStorage.Content.Item.BotFaceEmojiScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Bot Emoji Score Effect",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Type"] = v1.Type.ScoreEffect,
    ["Icon"] = "rbxassetid://109998305696797",
    ["Description"] = "Obtained by reaching Mastery Level 2 for Hidari",
    ["Group"] = v1.Group.Mastery
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://124752506861128"
    }
}
v3.Metadata = v4
return v2(v3)