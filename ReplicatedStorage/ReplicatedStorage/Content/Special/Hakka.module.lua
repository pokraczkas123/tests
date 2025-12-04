-- Decompiled game.ReplicatedStorage.Content.Special.Hakka

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["Type"] = v1.Type.ActionActivatable,
    ["DisplayName"] = "Clone",
    ["Description"] = { "Jumpset with<font color=\"rgb(44, 250, 106)\"> Clone ON </font>to clone", "DOUBLE CLONE" },
    ["Icon"] = "rbxassetid://124587825606929",
    ["Move"] = v1.Move.All,
    ["ActionMove"] = v1.Move.JumpSet,
    ["Rules"] = {
        ["CanActivateFromRemote"] = true
    },
    ["CanRun"] = require(script.CanRun),
    ["PreAction"] = require(script.PreAction),
    ["Action"] = require(script.Action),
    ["PostAction"] = require(script.PostAction),
    ["UpdateState"] = require(script.UpdateState),
    ["Callback"] = require(script.Callback)
}
return v2(v3)