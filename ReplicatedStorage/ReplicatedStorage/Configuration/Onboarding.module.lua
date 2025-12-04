-- Decompiled game.ReplicatedStorage.Configuration.Onboarding

local v1 = {
    ["ServeDebounceBeforeSet"] = 5,
    ["HintDuration"] = 5,
    ["TimeBetweenStages"] = 3,
    ["Order"] = { "Bump", "Set" }
}
local v2 = {
    ["InGame"] = {},
    ["Bump"] = {
        ["Hint"] = "BUMP TO HIT THE BALL",
        ["Action"] = "Bump"
    },
    ["Set"] = {
        ["Hint"] = "SET TO PASS THE BALL",
        ["Action"] = "Set"
    },
    ["Toss"] = {
        ["Hint"] = "TOSS BALL TO SERVE",
        ["Action"] = "Toss"
    },
    ["Power"] = {
        ["Hint"] = "CHOOSE POWER",
        ["Action"] = "Toss"
    },
    ["Finished"] = {
        ["Action"] = "Finished"
    }
}
v1.Stage = v2
return v1