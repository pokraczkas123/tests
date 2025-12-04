-- Decompiled game.ReplicatedStorage.Content.Mastery.Entities.Hidari.Level3.Quests

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent.Parent.Common)
local v3 = require(v1.Content.Quest.Qualifier)
local v4 = require(script.Parent.Parent.Parent.Parent.MasteryQuest).new(v2.Name)
local v5 = {}
local v6 = v4.new
local v7 = {
    ["Type"] = v4.Type.Career,
    ["Requirement"] = 300,
    ["Qualifiers"] = { v3.new(v3.Requirement.Career, {
            ["Statistic"] = v3.Field.Statistic.Bump
        }) }
}
local v8 = v6(v7)
local v9 = v4.new
local v10 = {
    ["Type"] = v4.Type.Wins,
    ["Requirement"] = 20,
    ["Qualifiers"] = { v3.new(v3.Requirement.Ranked), v3.new(v3.Requirement.Points, {
            ["Points"] = 20
        }) }
}
local v11 = v9(v10)
local v12 = v4.new
local v13 = {
    ["Type"] = v4.Type.Career,
    ["Requirement"] = 30,
    ["Qualifiers"] = { v3.new(v3.Requirement.Career, {
            ["Statistic"] = v3.Field.Statistic.MVP
        }), v3.new(v3.Requirement.Place, {
            ["Place"] = v3.Field.Place.ClassicPro
        }) }
}
local v14 = v12(v13)
local v15 = v4.new
local v16 = {
    ["Type"] = v4.Type.Career,
    ["Requirement"] = 600,
    ["Qualifiers"] = { v3.new(v3.Requirement.Career, {
            ["Statistic"] = v3.Field.Statistic.Spike
        }), v3.new(v3.Requirement.SpecialActive, {
            ["Active"] = true,
            ["Description"] = v2.SpecialDescription.Enabled
        }) }
}
__set_list(v5, 1, {v8, v11, v14, v15(v16), v4.new({
    ["Type"] = v4.Type.Jump,
    ["Requirement"] = 1000
})})
return v5