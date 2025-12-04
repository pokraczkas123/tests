-- Decompiled game.ReplicatedStorage.Content.Mastery.Entities.Yogan.Level2.Quests

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent.Parent.Common)
local v3 = require(v1.Content.Quest.Qualifier)
local v4 = require(script.Parent.Parent.Parent.Parent.MasteryQuest).new(v2.Name)
local v5 = {}
local v6 = v4.new
local v7 = {
    ["Type"] = v4.Type.Career,
    ["Requirement"] = 20,
    ["Qualifiers"] = { v3.new(v3.Requirement.Career, {
            ["Statistic"] = v3.Field.Statistic.MVP
        }), v3.new(v3.Requirement.Ranked) }
}
local v8 = v6(v7)
local v9 = v4.new
local v10 = {
    ["Type"] = v4.Type.Career,
    ["Requirement"] = 100,
    ["Qualifiers"] = { v3.new(v3.Requirement.Career, {
            ["Statistic"] = v3.Field.Statistic.Score
        }), v3.new(v3.Requirement.SpecialActive, {
            ["Active"] = true,
            ["Description"] = v2.SpecialDescription.Enabled
        }) }
}
local v11 = v9(v10)
local v12 = v4.new
local v13 = {
    ["Type"] = v4.Type.Career,
    ["Requirement"] = 250,
    ["Qualifiers"] = { v3.new(v3.Requirement.Career, {
            ["Statistic"] = v3.Field.Statistic.JumpSet
        }) }
}
local v14 = v12(v13)
local v15 = v4.new
local v16 = {
    ["Type"] = v4.Type.Wins,
    ["Requirement"] = 25,
    ["Qualifiers"] = { v3.new(v3.Requirement.Ranked, {
            ["Mode"] = v3.Field.Ranked.Fours
        }) }
}
local v17 = v15(v16)
local v18 = v4.new
local v19 = {
    ["Type"] = v4.Type.Career,
    ["Requirement"] = 100,
    ["Qualifiers"] = { v3.new(v3.Requirement.Career, {
            ["Statistic"] = v3.Field.Statistic.Block
        }) }
}
__set_list(v5, 1, {v8, v11, v14, v17, v18(v19)})
return v5