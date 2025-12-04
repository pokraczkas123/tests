-- Decompiled game.ReplicatedStorage.Content.Quest.Daily

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(script.Parent.Qualifier)
local v4 = require(v1.Content.Reward)
local v5 = {}
local v6 = v2.new
local v7 = {
    ["Type"] = v2.Type.Crate,
    ["Reward"] = v4.new({
        ["Type"] = v4.Type.SeasonExperience,
        ["Value"] = 50
    }),
    ["Requirement"] = 1
}
local v8 = v6(v7)
local v9 = v2.new
local v10 = {
    ["Type"] = v2.Type.Crate,
    ["Reward"] = v4.new({
        ["Type"] = v4.Type.SeasonExperience,
        ["Value"] = 80
    }),
    ["Requirement"] = 5
}
local v11 = v9(v10)
local v12 = v2.new
local v13 = {
    ["Type"] = v2.Type.Time,
    ["Reward"] = v4.new({
        ["Type"] = v4.Type.SeasonExperience,
        ["Value"] = 80
    }),
    ["Requirement"] = 60,
    ["Qualifiers"] = { v3.new(v3.Requirement.Place, {
            ["Place"] = v3.Field.Place.Idle
        }) }
}
local v14 = v12(v13)
local v15 = v2.new
local v16 = {
    ["Type"] = v2.Type.Time,
    ["Reward"] = v4.new({
        ["Type"] = v4.Type.SeasonExperience,
        ["Value"] = 120
    }),
    ["Requirement"] = 240,
    ["Qualifiers"] = { v3.new(v3.Requirement.Place, {
            ["Place"] = v3.Field.Place.Idle
        }) }
}
local v17 = v15(v16)
local v18 = v2.new
local v19 = {
    ["Type"] = v2.Type.Spin,
    ["Reward"] = v4.new({
        ["Type"] = v4.Type.SeasonExperience,
        ["Value"] = 150
    }),
    ["Requirement"] = 3,
    ["Qualifiers"] = { v3.new(v3.Requirement.Spin, {
            ["Type"] = v3.Field.Spin.LuckyStyle
        }) }
}
local v20 = v18(v19)
local v21 = v2.new
local v22 = {
    ["Type"] = v2.Type.Spin,
    ["Reward"] = v4.new({
        ["Type"] = v4.Type.SeasonExperience,
        ["Value"] = 120
    }),
    ["Requirement"] = 1,
    ["Qualifiers"] = { v3.new(v3.Requirement.Rarity, {
            ["Rarity"] = v3.Field.Rarity.Godly,
            ["Comparison"] = true
        }) }
}
local v23 = v21(v22)
local v24 = v2.new
local v25 = {
    ["Type"] = v2.Type.Spin,
    ["Reward"] = v4.new({
        ["Type"] = v4.Type.SeasonExperience,
        ["Value"] = 150
    }),
    ["Requirement"] = 3,
    ["Qualifiers"] = { v3.new(v3.Requirement.Spin, {
            ["Type"] = v3.Field.Spin.LuckyStyle
        }) }
}
local v26 = v24(v25)
local v27 = v2.new
local v28 = {
    ["Type"] = v2.Type.Spin,
    ["Reward"] = v4.new({
        ["Type"] = v4.Type.SeasonExperience,
        ["Value"] = 250
    }),
    ["Requirement"] = 5,
    ["Qualifiers"] = { v3.new(v3.Requirement.Spin, {
            ["Type"] = v3.Field.Spin.LuckyStyle
        }) }
}
local v29 = v27(v28)
local v30 = v2.new
local v31 = {
    ["Type"] = v2.Type.Wins,
    ["Reward"] = v4.new({
        ["Type"] = v4.Type.SeasonExperience,
        ["Value"] = 100
    }),
    ["Requirement"] = 3,
    ["Qualifiers"] = { v3.new(v3.Requirement.Place, {
            ["Place"] = v3.Field.Place.Seasonal
        }) }
}
local v32 = v30(v31)
local v33 = v2.new
local v34 = {
    ["Type"] = v2.Type.Wins,
    ["Reward"] = v4.new({
        ["Type"] = v4.Type.SeasonExperience,
        ["Value"] = 175
    }),
    ["Requirement"] = 5,
    ["Qualifiers"] = { v3.new(v3.Requirement.Place, {
            ["Place"] = v3.Field.Place.Seasonal
        }) }
}
local v35 = v33(v34)
local v36 = v2.new
local v37 = {
    ["Type"] = v2.Type.Time,
    ["Reward"] = v4.new({
        ["Type"] = v4.Type.SeasonExperience,
        ["Value"] = 100
    }),
    ["Requirement"] = 30
}
local v38 = v36(v37)
local v39 = v2.new
local v40 = {
    ["Type"] = v2.Type.Time,
    ["Reward"] = v4.new({
        ["Type"] = v4.Type.SeasonExperience,
        ["Value"] = 120
    }),
    ["Requirement"] = 30,
    ["Qualifiers"] = { v3.new(v3.Requirement.Friends) }
}
local v41 = v39(v40)
local v42 = v2.new
local v43 = {
    ["Type"] = v2.Type.Wins,
    ["Reward"] = v4.new({
        ["Type"] = v4.Type.SeasonExperience,
        ["Value"] = 100
    }),
    ["Requirement"] = 4
}
local v44 = v42(v43)
local v45 = v2.new
local v46 = {
    ["Type"] = v2.Type.Wins,
    ["Reward"] = v4.new({
        ["Type"] = v4.Type.SeasonExperience,
        ["Value"] = 75
    }),
    ["Requirement"] = 5,
    ["Qualifiers"] = { v3.new(v3.Requirement.Rarity, {
            ["Rarity"] = v3.Field.Rarity.Secret,
            ["IsWin"] = true
        }) }
}
local v47 = v45(v46)
local v48 = v2.new
local v49 = {
    ["Type"] = v2.Type.Wins,
    ["Reward"] = v4.new({
        ["Type"] = v4.Type.SeasonExperience,
        ["Value"] = 100
    }),
    ["Requirement"] = 5,
    ["Qualifiers"] = { v3.new(v3.Requirement.Rarity, {
            ["Rarity"] = v3.Field.Rarity.Godly,
            ["IsWin"] = true
        }) }
}
local v50 = v48(v49)
local v51 = v2.new
local v52 = {
    ["Type"] = v2.Type.Wins,
    ["Reward"] = v4.new({
        ["Type"] = v4.Type.SeasonExperience,
        ["Value"] = 150
    }),
    ["Requirement"] = 5,
    ["Qualifiers"] = { v3.new(v3.Requirement.Rarity, {
            ["Rarity"] = v3.Field.Rarity.Legendary,
            ["IsWin"] = true
        }) }
}
__set_list(v5, 1, {v8, v11, v14, v17, v20, v23, v26, v29, v32, v35, v38, v41, v44, v47, v50, (v51(v52))})
local v53 = v2.new
local v54 = {
    ["Type"] = v2.Type.Wins,
    ["Reward"] = v4.new({
        ["Type"] = v4.Type.SeasonExperience,
        ["Value"] = 200
    }),
    ["Requirement"] = 5,
    ["Qualifiers"] = { v3.new(v3.Requirement.Rarity, {
            ["Rarity"] = v3.Field.Rarity.Rare,
            ["IsWin"] = true
        }) }
}
local v55 = v53(v54)
local v56 = v2.new
local v57 = {
    ["Type"] = v2.Type.Spin,
    ["Reward"] = v4.new({
        ["Type"] = v4.Type.SeasonExperience,
        ["Value"] = 150
    }),
    ["Requirement"] = 50,
    ["Qualifiers"] = { v3.new(v3.Requirement.Spin, {
            ["Type"] = v3.Field.Spin.Style
        }) }
}
local v58 = v56(v57)
local v59 = v2.new
local v60 = {
    ["Type"] = v2.Type.Spin,
    ["Reward"] = v4.new({
        ["Type"] = v4.Type.SeasonExperience,
        ["Value"] = 150
    }),
    ["Requirement"] = 25,
    ["Qualifiers"] = { v3.new(v3.Requirement.Spin, {
            ["Type"] = v3.Field.Spin.Ability
        }) }
}
local v61 = v59(v60)
local v62 = v2.new
local v63 = {
    ["Type"] = v2.Type.Wins,
    ["Reward"] = v4.new({
        ["Type"] = v4.Type.SeasonExperience,
        ["Value"] = 250
    }),
    ["Requirement"] = 5,
    ["Qualifiers"] = { v3.new(v3.Requirement.Ranked, {
            ["Mode"] = v3.Field.Ranked.Twos
        }) }
}
local v64 = v62(v63)
local v65 = v2.new
local v66 = {
    ["Type"] = v2.Type.Wins,
    ["Reward"] = v4.new({
        ["Type"] = v4.Type.SeasonExperience,
        ["Value"] = 250
    }),
    ["Requirement"] = 5,
    ["Qualifiers"] = { v3.new(v3.Requirement.Ranked, {
            ["Mode"] = v3.Field.Ranked.Threes
        }) }
}
local v67 = v65(v66)
local v68 = v2.new
local v69 = {
    ["Type"] = v2.Type.Wins,
    ["Reward"] = v4.new({
        ["Type"] = v4.Type.SeasonExperience,
        ["Value"] = 250
    }),
    ["Requirement"] = 5,
    ["Qualifiers"] = { v3.new(v3.Requirement.Ranked, {
            ["Mode"] = v3.Field.Ranked.Fours
        }) }
}
local v70 = v68(v69)
local v71 = v2.new
local v72 = {
    ["Type"] = v2.Type.Wins,
    ["Reward"] = v4.new({
        ["Type"] = v4.Type.SeasonExperience,
        ["Value"] = 250
    }),
    ["Requirement"] = 5,
    ["Qualifiers"] = { v3.new(v3.Requirement.Ranked, {
            ["Mode"] = v3.Field.Ranked.Sixes
        }) }
}
__set_list(v5, 17, {v55, v58, v61, v64, v67, v70, v71(v72)})
return v5