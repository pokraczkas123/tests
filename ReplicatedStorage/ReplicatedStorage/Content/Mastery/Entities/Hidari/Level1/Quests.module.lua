-- Decompiled game.ReplicatedStorage.Content.Mastery.Entities.Hidari.Level1.Quests

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent.Parent.Common)
local v3 = require(v1.Content.Quest.Qualifier)
local v4 = require(script.Parent.Parent.Parent.Parent.MasteryQuest).new(v2.Name)
local v5 = {}
local v6 = v4.new({
    ["Type"] = v4.Type.AceStreak,
    ["Requirement"] = 10
})
local v7 = v4.new
local v8 = {
    ["Type"] = v4.Type.Career,
    ["Requirement"] = 50,
    ["Qualifiers"] = { v3.new(v3.Requirement.Career, {
            ["Statistic"] = v3.Field.Statistic.Score
        }), v3.new(v3.Requirement.SpecialActive, {
            ["Active"] = true,
            ["Description"] = v2.SpecialDescription.Enabled
        }) }
}
local v9 = v7(v8)
local v10 = v4.new
local v11 = {
    ["Type"] = v4.Type.Career,
    ["Requirement"] = 8,
    ["Qualifiers"] = { v3.new(v3.Requirement.Career, {
            ["Statistic"] = v3.Field.Statistic.MVP
        }), v3.new(v3.Requirement.Ranked) }
}
local v12 = v10(v11)
local v13 = v4.new
local v14 = {
    ["Type"] = v4.Type.Career,
    ["Requirement"] = 75,
    ["Qualifiers"] = { v3.new(v3.Requirement.Career, {
            ["Statistic"] = v3.Field.Statistic.Bump
        }) }
}
local v15 = v13(v14)
local v16 = v4.new
local v17 = {
    ["Type"] = v4.Type.Career,
    ["Requirement"] = 50,
    ["Qualifiers"] = { v3.new(v3.Requirement.Career, {
            ["Statistic"] = v3.Field.Statistic.Assist
        }) }
}
__set_list(v5, 1, {v6, v9, v12, v15, v16(v17)})
return v5