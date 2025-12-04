-- Decompiled game.ReplicatedStorage.Content.Special.TeamCaptain

local v1 = require(script.Parent)
return v1.new({
    ["Id"] = script.Name,
    ["Type"] = v1.Type.Action,
    ["DisplayName"] = "Team Captain",
    ["Description"] = { "Set to grant spiker bonus <font color=\"rgb(255,125,0)\">Spike Power!</font>", "Double set to boost spike power even MORE!" },
    ["Icon"] = "rbxassetid://126693771151081",
    ["Move"] = v1.Move.Sets,
    ["PostAction"] = require(script.PostAction)
})