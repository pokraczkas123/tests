-- Decompiled game.ReplicatedStorage.Content.Item.WolfEmojiScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Wolf Emoji Score Effect",
    ["Group"] = v1.Group.Season8,
    ["Rarity"] = v1.Rarity.Type.Rare,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by opening a Crate in Season 8",
    ["Icon"] = "rbxassetid://140542381111205"
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://136783324891629"
    }
}
v3.Metadata = v4
return v2(v3)