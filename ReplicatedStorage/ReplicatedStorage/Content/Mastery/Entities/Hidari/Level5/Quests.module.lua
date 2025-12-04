-- Decompiled game.ReplicatedStorage.Content.Mastery.Entities.Hidari.Level5.Quests

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent.Parent.Common)
local v3 = require(v1.Content.Quest.Qualifier)
local v4 = require(script.Parent.Parent.Parent.Parent.MasteryQuest).new(v2.Name)
local v5 = {}
local v6 = v4.new({
    ["Type"] = v4.Type.Wins,
    ["Requirement"] = 200,
    ["Qualifiers"] = { v3.new(v3.Requirement.Ranked) }
})
local v7 = v4.new
local v8 = {
    ["Type"] = v4.Type.Career,
    ["Requirement"] = 800,
    ["Qualifiers"] = { v3.new(v3.Requirement.Career, {
            ["Statistic"] = v3.Field.Statistic.Set
        }), v3.new(v3.Requirement.IsReceive, {
            ["Enabled"] = true
        }) }
}
local v9 = v7(v8)
local v10 = v4.new
local v11 = {
    ["Type"] = v4.Type.Career,
    ["Requirement"] = 50,
    ["Qualifiers"] = { v3.new(v3.Requirement.Career, {
            ["Statistic"] = v3.Field.Statistic.MVP
        }), v3.new(v3.Requirement.Ranked, {
            ["Mode"] = v3.Field.Ranked.Fours
        }) }
}
local v12 = v10(v11)
local v13 = v4.new({
    ["Type"] = v4.Type.AceStreak,
    ["Requirement"] = 15
})
local v14 = v4.new
local v15 = {
    ["Type"] = v4.Type.Career,
    ["Requirement"] = 500,
    ["Qualifiers"] = { v3.new(v3.Requirement.Career, {
            ["Statistic"] = v3.Field.Statistic.Save
        }) }
}
__set_list(v5, 1, {v6, v9, v12, v13, v14(v15)})
return v5