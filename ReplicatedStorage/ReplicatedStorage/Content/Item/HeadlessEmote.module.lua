-- Decompiled game.ReplicatedStorage.Content.Item.HeadlessEmote

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Headless",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Type"] = v1.Type.Emote,
    ["Description"] = "Obtained by purchasing the Season 8 Bundle",
    ["Asset"] = "rbxassetid://136572412954968"
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://103262351762455",
        ["Volume"] = 0.6
    },
    ["Looped"] = false
}
v3.Metadata = v4
return v2(v3)