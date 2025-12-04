-- Decompiled game.ReplicatedStorage.Configuration.OnboardingStages

local v1 = {
    ["NotStarted"] = {
        ["Value"] = 0,
        ["Hint"] = ""
    },
    ["InLobby"] = {
        ["Value"] = 1,
        ["Hint"] = "Head over to the gate to start your first game."
    },
    ["InGame"] = {
        ["Value"] = 2,
        ["Hint"] = "Welcome to Volleyball Legends! Let\'s learn to set.",
        ["Duration"] = 3
    },
    ["LearnSet"] = {
        ["Value"] = 3,
        ["Hint"] = "Press %s to set the ball for your teammate!",
        ["Move"] = "Set"
    },
    ["LearnBump"] = {
        ["Value"] = 4,
        ["Hint"] = "Nice set! Now let\'s try a bump. Press %s to bump the ball and keep it in play!",
        ["Move"] = "Bump"
    },
    ["LearnSpike"] = {
        ["Value"] = 5,
        ["Hint"] = "Awesome bump! Time to spike. Jump and press %s to spike the ball over the net!",
        ["Move"] = "Spike"
    },
    ["LearnBlock"] = {
        ["Value"] = 6,
        ["Hint"] = "Great spike! Now let\'s block. Jump and press %s to block the ball and stop the other team from scoring!",
        ["Move"] = "Block"
    },
    ["LearnServe1"] = {
        ["Value"] = 7,
        ["Hint"] = "Sweet block! Get ready to learn serving when it\'s your turn.",
        ["Duration"] = 5
    },
    ["LearnServe2"] = {
        ["Value"] = 8,
        ["Hint"] = "Now let\'s serve. Tap %s to start your serve!",
        ["Move"] = "Toss",
        ["Duration"] = 5
    },
    ["LearnServe3"] = {
        ["Value"] = 9,
        ["Hint"] = "Now tap %s again to lock in your power.",
        ["Move"] = "Toss",
        ["Duration"] = 5
    },
    ["LearnServe4"] = {
        ["Value"] = 10,
        ["Hint"] = "Nice! Now tap %s at the right moment to hit the ball!",
        ["Move"] = "Bump",
        ["Duration"] = 3
    },
    ["Completed"] = {
        ["Value"] = 11,
        ["Hint"] = "Amazing work! Stay sharp and keep dominating the court!",
        ["Duration"] = 5
    }
}
return v1