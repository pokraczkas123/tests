-- Decompiled game.ReplicatedStorage.Content.Mastery.Entities.Hidari.Level2.Quests

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent.Parent.Common)
local v3 = require(v1.Content.Quest.Qualifier)
local v4 = require(script.Parent.Parent.Parent.Parent.MasteryQuest).new(v2.Name)
local v5 = {}
local v6 = v4.new
local v7 = {
    ["Type"] = v4.Type.Career,
    ["Requirement"] = 100,
    ["Qualifiers"] = { v3.new(v3.Requirement.Career, {
            ["Statistic"] = v3.Field.Statistic.Score
        }), v3.new(v3.Requirement.SpecialActive, {
            ["Active"] = false,
            ["Description"] = v2.SpecialDescription.Disabled
        }) }
}
local v8 = v6(v7)
local v9 = v4.new
local v10 = {
    ["Type"] = v4.Type.Wins,
    ["Requirement"] = 20,
    ["Qualifiers"] = { v3.new(v3.Requirement.Place, {
            ["Place"] = v3.Field.Place.Hardcore
        }) }
}
local v11 = v9(v10)
local v12 = v4.new
local v13 = {
    ["Type"] = v4.Type.Career,
    ["Requirement"] = 100,
    ["Qualifiers"] = { v3.new(v3.Requirement.Career, {
            ["Statistic"] = v3.Field.Statistic.JumpSet
        }) }
}
local v14 = v12(v13)
local v15 = v4.new({
    ["Type"] = v4.Type.Streak,
    ["Requirement"] = 5,
    ["Qualifiers"] = { v3.new(v3.Requirement.Ranked) }
})
local v16 = v4.new
local v17 = {
    ["Type"] = v4.Type.Career,
    ["Requirement"] = 100,
    ["Qualifiers"] = { v3.new(v3.Requirement.Career, {
            ["Statistic"] = v3.Field.Statistic.Set
        }), v3.new(v3.Requirement.IsReceive, {
            ["Enabled"] = true
        }) }
}
__set_list(v5, 1, {v8, v11, v14, v15, v16(v17)})
return v5