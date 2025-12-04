-- Decompiled game.ReplicatedStorage.Content.Mastery.Entities.TimeskipToru.Level1.Quests

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent.Parent.Common)
local v3 = require(v1.Content.Quest.Qualifier)
local v4 = require(script.Parent.Parent.Parent.Parent.MasteryQuest).new(v2.Name)
local v5 = {}
local v6 = v4.new
local v7 = {
    ["Type"] = v4.Type.Career,
    ["Requirement"] = 25,
    ["Qualifiers"] = { v3.new(v3.Requirement.Career, {
            ["Statistic"] = v3.Field.Statistic.Ace
        }) }
}
local v8 = v6(v7)
local v9 = v4.new
local v10 = {
    ["Type"] = v4.Type.Career,
    ["Requirement"] = 50,
    ["Qualifiers"] = { v3.new(v3.Requirement.Career, {
            ["Statistic"] = v3.Field.Statistic.JumpSet
        }) }
}
local v11 = v9(v10)
local v12 = v4.new
local v13 = {
    ["Type"] = v4.Type.Wins,
    ["Requirement"] = 12,
    ["Qualifiers"] = { v3.new(v3.Requirement.Ranked, {
            ["Mode"] = v3.Field.Ranked.Twos
        }) }
}
local v14 = v12(v13)
local v15 = v4.new({
    ["Type"] = v4.Type.Ability,
    ["Requirement"] = 30
})
local v16 = v4.new
local v17 = {
    ["Type"] = v4.Type.Career,
    ["Requirement"] = 15,
    ["Qualifiers"] = { v3.new(v3.Requirement.Career, {
            ["Statistic"] = v3.Field.Statistic.Save
        }) }
}
__set_list(v5, 1, {v8, v11, v14, v15, v16(v17)})
return v5