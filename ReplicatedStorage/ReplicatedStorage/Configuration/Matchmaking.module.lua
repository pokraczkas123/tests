-- Decompiled game.ReplicatedStorage.Configuration.Matchmaking

local v1 = {
    ["Ones"] = "Ones",
    ["Twos"] = "Twos",
    ["Threes"] = "Threes",
    ["Fours"] = "Fours",
    ["Sixes"] = "Sixes",
    ["Challenges"] = "Challenges"
}
local v2 = {
    [v1.Ones] = {
        ["DisplayName"] = "1v1",
        ["MaxPlayers"] = 1,
        ["PointsToWin"] = 10
    },
    [v1.Twos] = {
        ["DisplayName"] = "2v2",
        ["MaxPlayers"] = 2
    },
    [v1.Threes] = {
        ["DisplayName"] = "3v3",
        ["MaxPlayers"] = 3
    },
    [v1.Fours] = {
        ["DisplayName"] = "4v4",
        ["MaxPlayers"] = 4
    },
    [v1.Sixes] = {
        ["DisplayName"] = "6v6",
        ["MaxPlayers"] = 6
    },
    [v1.Challenges] = {
        ["DisplayName"] = "Challenges",
        ["MaxPlayers"] = 1,
        ["PointsToWin"] = 10
    }
}
local v3 = {
    ["Low"] = "Low",
    ["Medium"] = "Medium",
    ["High"] = "High",
    ["Elite"] = "Elite"
}
local v4 = {
    ["PlacementMatches"] = 5,
    ["MaxMatchesPerMatchmake"] = 20,
    ["MaxPing"] = 150,
    ["MaxHighPingPercent"] = 0.6,
    ["ServerRetryVotePercent"] = 0.5,
    ["State"] = {
        ["Waiting"] = "Waiting",
        ["InProgress"] = "InProgress",
        ["Complete"] = "Complete"
    },
    ["Type"] = v1,
    ["Data"] = v2,
    ["Bracket"] = v3,
    ["BracketTypes"] = {
        [v3.Low] = "1",
        [v3.Medium] = "2",
        [v3.High] = "3",
        [v3.Elite] = "4"
    },
    ["Pod"] = {
        ["IdleTimeout"] = 20,
        ["TeleportTimeout"] = 10
    },
    ["Memory"] = {
        ["ServerExpiration"] = 600
    },
    ["TimeTillRequeue"] = 20,
    ["MaxMatchesCached"] = 5
}
return v4