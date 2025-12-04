-- Decompiled game.ReplicatedStorage.Content.Mastery.Entities.Hidari.Level4.Quests

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent.Parent.Common)
local v3 = require(v1.Content.Quest.Qualifier)
local v4 = require(script.Parent.Parent.Parent.Parent.MasteryQuest).new(v2.Name)
local v5 = {}
local v6 = v4.new
local v7 = {
    ["Type"] = v4.Type.Career,
    ["Requirement"] = 500,
    ["Qualifiers"] = { v3.new(v3.Requirement.Career, {
            ["Statistic"] = v3.Field.Statistic.Block
        }) }
}
local v8 = v6(v7)
local v9 = v4.new
local v10 = {
    ["Type"] = v4.Type.Career,
    ["Requirement"] = 250,
    ["Qualifiers"] = { v3.new(v3.Requirement.Career, {
            ["Statistic"] = v3.Field.Statistic.Spike
        }), v3.new(v3.Requirement.Backline, {
            ["Enabled"] = true
        }) }
}
local v11 = v9(v10)
local v12 = v4.new({
    ["Type"] = v4.Type.Streak,
    ["Requirement"] = 10,
    ["Qualifiers"] = { v3.new(v3.Requirement.Ranked) }
})
local v13 = v4.new
local v14 = {
    ["Type"] = v4.Type.Career,
    ["Requirement"] = 250,
    ["Qualifiers"] = { v3.new(v3.Requirement.Career, {
            ["Statistic"] = v3.Field.Statistic.Ace
        }) }
}
local v15 = v13(v14)
local v16 = v4.new
local v17 = {
    ["Type"] = v4.Type.Career,
    ["Requirement"] = 450,
    ["Qualifiers"] = { v3.new(v3.Requirement.Career, {
            ["Statistic"] = v3.Field.Statistic.JumpSet
        }) }
}
__set_list(v5, 1, {v8, v11, v12, v15, v16(v17)})
return v5