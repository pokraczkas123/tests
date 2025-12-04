-- Decompiled game.ReplicatedStorage.Configuration.Actions

local v1 = {}
local v2 = {
    ["Keys"] = {
        ["Keyboard"] = Enum.UserInputType.MouseButton1,
        ["Console"] = Enum.KeyCode.ButtonR2
    }
}
v1.Toss = v2
local v3 = {
    ["IsAerial"] = true,
    ["Keys"] = {
        ["Keyboard"] = Enum.UserInputType.MouseButton1,
        ["Console"] = Enum.KeyCode.ButtonR2
    }
}
v1.Spike = v3
local v4 = {
    ["IsAerial"] = false,
    ["Keys"] = {
        ["Keyboard"] = Enum.UserInputType.MouseButton1,
        ["Console"] = Enum.KeyCode.ButtonR2
    }
}
v1.Bump = v4
local v5 = {
    ["IsAerial"] = false,
    ["Keys"] = {
        ["Keyboard"] = Enum.KeyCode.Q,
        ["Console"] = Enum.KeyCode.ButtonL2
    }
}
v1.Set = v5
local v6 = {
    ["IsAerial"] = true,
    ["Keys"] = {
        ["Keyboard"] = Enum.KeyCode.E,
        ["Console"] = Enum.KeyCode.ButtonX
    }
}
v1.JumpSet = v6
local v7 = {
    ["IsAerial"] = true,
    ["Keys"] = {
        ["Keyboard"] = Enum.KeyCode.Q,
        ["Console"] = Enum.KeyCode.ButtonL2
    }
}
v1.Block = v7
local v8 = {
    ["IsAerial"] = false,
    ["Keys"] = {
        ["Keyboard"] = Enum.KeyCode.LeftControl,
        ["Console"] = Enum.KeyCode.ButtonX
    }
}
v1.Dive = v8
local v9 = {
    ["Ignore"] = true,
    ["Keys"] = {
        ["Keyboard"] = Enum.KeyCode.LeftShift,
        ["Console"] = Enum.KeyCode.ButtonY
    }
}
v1.MouseLock = v9
local v10 = {
    ["Ignore"] = true,
    ["Keys"] = {
        ["Keyboard"] = Enum.KeyCode.B,
        ["Console"] = Enum.KeyCode.ButtonB
    }
}
v1.CloseMenu = v10
local v11 = {
    ["Ignore"] = true,
    ["Keys"] = {
        ["Keyboard"] = Enum.KeyCode.A,
        ["Console"] = Enum.KeyCode.DPadLeft
    }
}
v1.StrafeLeft = v11
local v12 = {
    ["Ignore"] = true,
    ["Keys"] = {
        ["Keyboard"] = Enum.KeyCode.D,
        ["Console"] = Enum.KeyCode.Break
    }
}
v1.StrafeRight = v12
local v13 = {
    ["Ignore"] = true,
    ["Keys"] = {
        ["Keyboard"] = Enum.KeyCode.W,
        ["Console"] = Enum.KeyCode.DPadUp
    }
}
v1.Forward = v13
local v14 = {
    ["Ignore"] = true,
    ["Keys"] = {
        ["Keyboard"] = Enum.KeyCode.S,
        ["Console"] = Enum.KeyCode.DPadDown
    }
}
v1.Backward = v14
local v15 = {
    ["Ignore"] = true,
    ["Keys"] = {
        ["Keyboard"] = Enum.KeyCode.B,
        ["Console"] = Enum.KeyCode.DPadDown
    }
}
v1.Emote = v15
local v16 = {
    ["Ignore"] = false,
    ["Keys"] = {
        ["Keyboard"] = Enum.KeyCode.F,
        ["Console"] = Enum.KeyCode.ButtonL3
    }
}
v1.Ultimate = v16
local v17 = {
    ["Ignore"] = true,
    ["Keys"] = {
        ["Keyboard"] = Enum.KeyCode.Tab,
        ["Console"] = Enum.KeyCode.DPadRight
    }
}
v1.Scoreboard = v17
local v18 = {
    ["Ignore"] = false,
    ["Keys"] = {
        ["Keyboard"] = Enum.KeyCode.G,
        ["Console"] = Enum.KeyCode.DPadLeft
    }
}
v1.SpawnBall = v18
local v19 = {
    ["Ignore"] = false,
    ["Keys"] = {
        ["Keyboard"] = Enum.KeyCode.One,
        ["Console"] = Enum.KeyCode.DPadUp
    }
}
v1.SpawnServeBall = v19
local v20 = {
    ["Ignore"] = false,
    ["Keys"] = {
        ["Keyboard"] = Enum.KeyCode.R,
        ["Console"] = Enum.KeyCode.ButtonB
    }
}
v1.Special = v20
return v1