-- Decompiled game.ReplicatedStorage.Content.Season.6.Quests

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Content.Quest)
local v3 = require(v1.Content.Reward)
local v4 = require(v1.Content.Quest.Qualifier)
local v5 = {}
local v6 = v2.new
local v7 = {
    ["Type"] = v2.Type.Gift,
    ["Requirement"] = 1,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 1000
    })
}
local v8 = v6(v7)
local v9 = v2.new
local v10 = {
    ["Type"] = v2.Type.Rank,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 300
    }),
    ["Requirement"] = 1,
    ["Qualifiers"] = { v4.new(v4.Requirement.Rank, {
            ["Rank"] = v4.Field.Rank.Diamond1
        }) }
}
local v11 = v9(v10)
local v12 = v2.new
local v13 = {
    ["Type"] = v2.Type.Wins,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 300
    }),
    ["Requirement"] = 100
}
local v14 = v12(v13)
local v15 = v2.new
local v16 = {
    ["Type"] = v2.Type.Wins,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 250
    }),
    ["Requirement"] = 25,
    ["Qualifiers"] = { v4.new(v4.Requirement.Place, {
            ["Place"] = v4.Field.Place.Seasonal
        }) }
}
local v17 = v15(v16)
local v18 = v2.new
local v19 = {
    ["Type"] = v2.Type.Wins,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 500
    }),
    ["Requirement"] = 100,
    ["Qualifiers"] = { v4.new(v4.Requirement.Place, {
            ["Place"] = v4.Field.Place.Seasonal
        }) }
}
local v20 = v18(v19)
local v21 = v2.new
local v22 = {
    ["Type"] = v2.Type.SeasonalEvent,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 100
    }),
    ["Requirement"] = 100
}
local v23 = v21(v22)
local v24 = v2.new
local v25 = {
    ["Type"] = v2.Type.SeasonalEvent,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 300
    }),
    ["Requirement"] = 500
}
local v26 = v24(v25)
local v27 = v2.new
local v28 = {
    ["Type"] = v2.Type.Time,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 400
    }),
    ["Requirement"] = 1800
}
local v29 = v27(v28)
local v30 = v2.new
local v31 = {
    ["Type"] = v2.Type.Time,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 250
    }),
    ["Requirement"] = 1200
}
local v32 = v30(v31)
local v33 = v2.new
local v34 = {
    ["Type"] = v2.Type.Time,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 200
    }),
    ["Requirement"] = 600
}
local v35 = v33(v34)
local v36 = v2.new
local v37 = {
    ["Type"] = v2.Type.Time,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 50
    }),
    ["Requirement"] = 240
}
local v38 = v36(v37)
local v39 = v2.new
local v40 = {
    ["Type"] = v2.Type.Wins,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 75
    }),
    ["Requirement"] = 10,
    ["Qualifiers"] = {}
}
local v41 = v39(v40)
local v42 = v2.new
local v43 = {
    ["Type"] = v2.Type.Time,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 200
    }),
    ["Requirement"] = 600,
    ["Qualifiers"] = { v4.new(v4.Requirement.Friends) }
}
local v44 = v42(v43)
local v45 = v2.new
local v46 = {
    ["Type"] = v2.Type.Time,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 300
    }),
    ["Requirement"] = 1200,
    ["Qualifiers"] = { v4.new(v4.Requirement.Friends) }
}
local v47 = v45(v46)
local v48 = v2.new
local v49 = {
    ["Type"] = v2.Type.Time,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 400
    }),
    ["Requirement"] = 1600,
    ["Qualifiers"] = { v4.new(v4.Requirement.Friends) }
}
local v50 = v48(v49)
local v51 = v2.new
local v52 = {
    ["Type"] = v2.Type.Career,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 200
    }),
    ["Requirement"] = 250,
    ["Qualifiers"] = { v4.new(v4.Requirement.Career, {
            ["Statistic"] = v4.Field.Statistic.Ace
        }) }
}
__set_list(v5, 1, {v8, v11, v14, v17, v20, v23, v26, v29, v32, v35, v38, v41, v44, v47, v50, (v51(v52))})
local v53 = v2.new
local v54 = {
    ["Type"] = v2.Type.Career,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 150
    }),
    ["Requirement"] = 1000,
    ["Qualifiers"] = { v4.new(v4.Requirement.Career, {
            ["Statistic"] = v4.Field.Statistic.Bump
        }) }
}
local v55 = v53(v54)
local v56 = v2.new
local v57 = {
    ["Type"] = v2.Type.Career,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 100
    }),
    ["Requirement"] = 800,
    ["Qualifiers"] = { v4.new(v4.Requirement.Career, {
            ["Statistic"] = v4.Field.Statistic.Score
        }) }
}
local v58 = v56(v57)
local v59 = v2.new
local v60 = {
    ["Type"] = v2.Type.Jump,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 75
    }),
    ["Requirement"] = 10000
}
local v61 = v59(v60)
local v62 = v2.new
local v63 = {
    ["Type"] = v2.Type.Pack,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 75
    }),
    ["Requirement"] = 50,
    ["Qualifiers"] = { v4.new(v4.Requirement.Pack, {
            ["Pack"] = v4.Field.Pack.Emote1
        }) }
}
local v64 = v62(v63)
local v65 = v2.new
local v66 = {
    ["Type"] = v2.Type.Pack,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 75
    }),
    ["Requirement"] = 50,
    ["Qualifiers"] = { v4.new(v4.Requirement.Pack, {
            ["Pack"] = v4.Field.Pack.Extreme
        }) }
}
local v67 = v65(v66)
local v68 = v2.new
local v69 = {
    ["Type"] = v2.Type.Pack,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 75
    }),
    ["Requirement"] = 50,
    ["Qualifiers"] = { v4.new(v4.Requirement.Pack, {
            ["Pack"] = v4.Field.Pack.ScoreEffect1
        }) }
}
local v70 = v68(v69)
local v71 = v2.new
local v72 = {
    ["Type"] = v2.Type.Wins,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 200
    }),
    ["Requirement"] = 20,
    ["Qualifiers"] = { v4.new(v4.Requirement.Ranked, {
            ["Mode"] = v4.Field.Ranked.Twos
        }) }
}
local v73 = v71(v72)
local v74 = v2.new
local v75 = {
    ["Type"] = v2.Type.Wins,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 200
    }),
    ["Requirement"] = 20,
    ["Qualifiers"] = { v4.new(v4.Requirement.Ranked, {
            ["Mode"] = v4.Field.Ranked.Threes
        }) }
}
local v76 = v74(v75)
local v77 = v2.new
local v78 = {
    ["Type"] = v2.Type.Wins,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 200
    }),
    ["Requirement"] = 20,
    ["Qualifiers"] = { v4.new(v4.Requirement.Ranked, {
            ["Mode"] = v4.Field.Ranked.Fours
        }) }
}
local v79 = v77(v78)
local v80 = v2.new
local v81 = {
    ["Type"] = v2.Type.Wins,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 200
    }),
    ["Requirement"] = 20,
    ["Qualifiers"] = { v4.new(v4.Requirement.Ranked, {
            ["Mode"] = v4.Field.Ranked.Sixes
        }) }
}
local v82 = v80(v81)
local v83 = v2.new
local v84 = {
    ["Type"] = v2.Type.Spin,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 100
    }),
    ["Requirement"] = 10,
    ["Qualifiers"] = { v4.new(v4.Requirement.Spin, {
            ["Type"] = v4.Field.Spin.LuckyStyle
        }) }
}
local v85 = v83(v84)
local v86 = v2.new
local v87 = {
    ["Type"] = v2.Type.Spin,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 100
    }),
    ["Requirement"] = 10,
    ["Qualifiers"] = { v4.new(v4.Requirement.Spin, {
            ["Type"] = v4.Field.Spin.LuckyAbility
        }) }
}
local v88 = v86(v87)
local v89 = v2.new
local v90 = {
    ["Type"] = v2.Type.Pack,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 250
    }),
    ["Requirement"] = 10,
    ["Qualifiers"] = { v4.new(v4.Requirement.Pack, {
            ["Pack"] = v4.Field.Pack.Robux
        }) }
}
local v91 = v89(v90)
local v92 = v2.new
local v93 = {
    ["Type"] = v2.Type.Wins,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 150
    }),
    ["Requirement"] = 10,
    ["Qualifiers"] = { v4.new(v4.Requirement.Style, {
            ["Style"] = v4.Field.Style.Sanu
        }) }
}
local v94 = v92(v93)
local v95 = v2.new
local v96 = {
    ["Type"] = v2.Type.Wins,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 150
    }),
    ["Requirement"] = 10,
    ["Qualifiers"] = { v4.new(v4.Requirement.Style, {
            ["Style"] = v4.Field.Style.Haibo
        }) }
}
local v97 = v95(v96)
local v98 = v2.new
local v99 = {
    ["Type"] = v2.Type.Wins,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 150
    }),
    ["Requirement"] = 10,
    ["Qualifiers"] = { v4.new(v4.Requirement.Style, {
            ["Style"] = v4.Field.Style.Kagayomo
        }) }
}
__set_list(v5, 17, {v55, v58, v61, v64, v67, v70, v73, v76, v79, v82, v85, v88, v91, v94, v97, (v98(v99))})
local v100 = v2.new
local v101 = {
    ["Type"] = v2.Type.Wins,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 150
    }),
    ["Requirement"] = 10,
    ["Qualifiers"] = { v4.new(v4.Requirement.Style, {
            ["Style"] = v4.Field.Style.Butoku
        }) }
}
local v102 = v100(v101)
local v103 = v2.new
local v104 = {
    ["Type"] = v2.Type.Streak,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 50
    }),
    ["Requirement"] = 2,
    ["Qualifiers"] = { v4.new(v4.Requirement.Ranked) }
}
local v105 = v103(v104)
local v106 = v2.new
local v107 = {
    ["Type"] = v2.Type.Streak,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 150
    }),
    ["Requirement"] = 5,
    ["Qualifiers"] = { v4.new(v4.Requirement.Ranked) }
}
local v108 = v106(v107)
local v109 = v2.new
local v110 = {
    ["Type"] = v2.Type.Streak,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 200
    }),
    ["Requirement"] = 10,
    ["Qualifiers"] = { v4.new(v4.Requirement.Ranked) }
}
local v111 = v109(v110)
local v112 = v2.new
local v113 = {
    ["Type"] = v2.Type.Streak,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 500
    }),
    ["Requirement"] = 25,
    ["Qualifiers"] = { v4.new(v4.Requirement.Ranked) }
}
local v114 = v112(v113)
local v115 = v2.new
local v116 = {
    ["Type"] = v2.Type.Streak,
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.SeasonExperience,
        ["Value"] = 1000
    }),
    ["Requirement"] = 50,
    ["Qualifiers"] = { v4.new(v4.Requirement.Ranked) }
}
__set_list(v5, 33, {v102, v105, v108, v111, v114, v115(v116)})
return v5