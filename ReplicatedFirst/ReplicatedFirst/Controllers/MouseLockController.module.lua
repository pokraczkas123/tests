-- Decompiled game.ReplicatedFirst.Controllers.MouseLockController

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v3 = require(v2.Packages.Knit)
local v_u_4 = require(v2.Packages.Fusion)
local v5 = v3.CreateController({
    ["Name"] = "MouseLockController",
    ["Player"] = v_u_1.LocalPlayer
})
function v5.KnitInit(p6)
    -- upvalues: (copy) v_u_4, (copy) v_u_1
    p6.Enabled = v_u_4.Value(false)
    p6.MouseLock = require(v_u_1.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"))
end
function v5.Set(p7, p8)
    p7.Enabled:set(p8)
    local v9 = p7.Player.Character or p7.Player.CharacterAdded:Wait()
    p7.MouseLock:ToggleMouseLock(p8)
    v9:WaitForChild("Humanoid").CameraOffset = p8 and Vector3.new(1.75, 0, 0) or Vector3.new(0, 0, 0)
end
function v5.Toggle(p10)
    p10:Set(not p10.Enabled:get())
end
return v5