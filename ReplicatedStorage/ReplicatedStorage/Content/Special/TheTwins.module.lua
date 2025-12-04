-- Decompiled game.ReplicatedStorage.Content.Special.TheTwins

local v1 = require(script.Parent)
return v1.new({
    ["Id"] = script.Name,
    ["Type"] = v1.Type.Activation,
    ["DisplayName"] = "Style Switch",
    ["Description"] = { "Switch between <font color=\"rgb(255,125,0)\">Two Styles!</font>", "<font color=\"rgb(255,125,0)\">Akuto:</font> Backtilt on Serve to <font color=\"rgb(255,125,0)\">Float Serve!</font>" },
    ["Icon"] = "rbxassetid://127024978077107",
    ["Callback"] = require(script.Callback),
    ["CanRun"] = require(script.CanRun),
    ["PostAction"] = require(script.PostAction)
})