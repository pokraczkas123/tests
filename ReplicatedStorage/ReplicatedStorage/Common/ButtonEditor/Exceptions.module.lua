-- Decompiled game.ReplicatedStorage.Common.ButtonEditor.Exceptions

local v1 = {}
local v2 = {
    ["ForceKeybinds"] = {
        ["Keyboard"] = Enum.KeyCode.Space.Name,
        ["Console"] = Enum.KeyCode.ButtonA.Name
    }
}
v1.Jump = v2
local v3 = {
    ["ForceKeybinds"] = {
        ["Keyboard"] = Enum.KeyCode.Unknown.Name,
        ["Console"] = Enum.KeyCode.Unknown.Name
    },
    ["IsMobileOnly"] = true,
    ["CustomName"] = "Charge Bar"
}
v1.UltimateCharge = v3
local v4 = {
    ["CustomScale"] = {
        ["Max"] = 3
    }
}
v1.MouseLock = v4
return v1