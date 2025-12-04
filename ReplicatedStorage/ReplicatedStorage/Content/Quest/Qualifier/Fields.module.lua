-- Decompiled game.ReplicatedStorage.Content.Quest.Qualifier.Fields

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Configuration.Ranks)
local v3 = require(v1.Configuration.Place)()
local v4 = require(v1.Content.Rarity)
local v5 = {
    ["Statistic"] = {
        ["Ace"] = "Ace",
        ["Bump"] = "Bump",
        ["Score"] = "Score",
        ["Dive"] = "Dive",
        ["Spike"] = "Spike",
        ["JumpSet"] = "JumpSet",
        ["Set"] = "Set",
        ["Point"] = "Point",
        ["MVP"] = "MVP",
        ["Assist"] = "Assist",
        ["Block"] = "Block",
        ["Save"] = "Save",
        ["Serve"] = "Serve"
    },
    ["Pack"] = {
        ["Emote1"] = "Emote1",
        ["Extreme"] = "Extreme",
        ["Robux"] = "Robux",
        ["ScoreEffect1"] = "ScoreEffect1"
    },
    ["Ranked"] = {
        ["Twos"] = "Twos",
        ["Threes"] = "Threes",
        ["Fours"] = "Fours",
        ["Sixes"] = "Sixes"
    },
    ["Style"] = {
        ["Sanu"] = "Rintaro",
        ["Haibo"] = "Lev",
        ["Kagayomo"] = "Tobio",
        ["Butoku"] = "Kotaru"
    },
    ["Spin"] = {
        ["Style"] = "Style",
        ["LuckyStyle"] = "LuckyStyle",
        ["Ability"] = "Ability",
        ["LuckyAbility"] = "LuckyAbility"
    },
    ["Rank"] = v2.Type,
    ["Place"] = {
        ["Seasonal"] = v3.Seasonal,
        ["Idle"] = v3.Idle,
        ["ClassicPro"] = v3.ClassicPro,
        ["Hardcore"] = v3.Hardcore
    },
    ["Rarity"] = {
        ["Rare"] = v4.Type.Rare,
        ["Legendary"] = v4.Type.Legendary,
        ["Godly"] = v4.Type.Godly,
        ["Secret"] = v4.Type.Secret
    }
}
return v5