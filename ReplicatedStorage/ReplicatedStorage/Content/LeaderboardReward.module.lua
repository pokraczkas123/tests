-- Decompiled game.ReplicatedStorage.Content.LeaderboardReward

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Content.Reward)
local v_u_3 = require(v1.Content.Item)
local v_u_4 = require(v1.Tools.Logger).new(script.Name)
local v_u_18 = {
    ["BaseValues"] = { v_u_2.new({
            ["Type"] = v_u_2.Type.LuckyStyleSpins,
            ["Value"] = 20
        }), v_u_2.new({
            ["Type"] = v_u_2.Type.LuckyAbilitySpins,
            ["Value"] = 20
        }), v_u_2.new({
            ["Type"] = v_u_2.Type.Currency,
            ["Value"] = 25000
        }) },
    ["Replacements"] = {
        ["Twos"] = "EloTwos",
        ["Threes"] = "EloThrees",
        ["Fours"] = "EloFours",
        ["Sixes"] = "EloSixes",
        ["Streaks"] = "Streaks",
        ["AverageElo"] = "Elo"
    },
    ["TitleReplacements"] = {
        ["Streaks"] = "RankedStreaks",
        ["EloTwos"] = "Twos",
        ["EloThrees"] = "Threes",
        ["EloFours"] = "Fours",
        ["EloSixes"] = "Sixes",
        ["Elo"] = "AverageElo"
    },
    ["get"] = function(p5, p6)
        -- upvalues: (copy) v_u_4, (copy) v_u_18, (copy) v_u_3, (copy) v_u_2
        if p5 and p6 then
            local v7 = {}
            for v8, v9 in pairs({
                [1] = 2,
                [10] = 1,
                [25] = 0.75,
                [100] = 0.5
            }) do
                local v10 = {}
                local v11 = ("%*Top%*Season%*Title"):format(v_u_18.TitleReplacements[p5] or p5, v8, p6)
                if v_u_3:Get(v11) then
                    local v12 = v_u_2.new
                    local v13 = {
                        ["Type"] = v_u_2.Type.Item,
                        ["Value"] = v11
                    }
                    table.insert(v10, v12(v13))
                else
                    v_u_4:Warn((("Title is missing! Id: %* leaderboard: %*, i: %*, seasonId: %*."):format(v11, p5, v8, p6)))
                end
                for _, v14 in pairs(v_u_18.BaseValues) do
                    local v15 = v_u_2.new
                    local v16 = {
                        ["Type"] = v14.Type
                    }
                    local v17 = v14.Value * v9
                    v16.Value = math.round(v17)
                    table.insert(v10, v15(v16))
                end
                v7[v8] = v10
            end
            return v7
        end
        v_u_4:Warn("Missing leaderboard or seasonId parameters")
    end
}
return v_u_18