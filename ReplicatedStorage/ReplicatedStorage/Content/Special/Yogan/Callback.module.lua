-- Decompiled game.ReplicatedStorage.Content.Special.Yogan.Callback

local v_u_1 = game:GetService("RunService"):IsClient()
local v_u_2 = Color3.new(0, 1, 1)
local v_u_3 = Color3.new(1, 0, 0)
local v4 = game:GetService("ReplicatedStorage")
local v_u_5 = nil
require(script.Parent.Parent)
local v_u_6 = require(script.Parent.Utility)
local v_u_7 = require(v4.Packages.Knit)
local v_u_8 = require(v4.Common.State)
local v_u_9 = require(v4.Content.Effect)
return function(p10, p11)
    -- upvalues: (copy) v_u_8, (copy) v_u_1, (copy) v_u_2, (copy) v_u_3, (copy) v_u_9, (ref) v_u_5, (copy) v_u_7, (copy) v_u_6
    if v_u_8.get(p11, v_u_8.Id.Special, "ActivationState", false) == true then
        return false
    end
    if v_u_8.get(p11, v_u_8.Id.Special, "Charge", 0) < p10.Metadata.Requirement then
        return false
    end
    if not v_u_1 then
        v_u_8.set(p11, v_u_8.Id.Special, "ActivationState", true)
        v_u_6.applyState(p11, true)
        return true
    end
    local v_u_12 = v_u_8.get(p11, v_u_8.Id.Mastery, "Completed") == "Yogan"
    task.spawn(function()
        -- upvalues: (copy) v_u_12, (ref) v_u_2, (ref) v_u_3, (ref) v_u_9
        local v13 = {
            ["Color"] = v_u_12 and v_u_2 or v_u_3,
            ["Duration"] = 1
        }
        require(game:GetService("ReplicatedFirst").Components.Flash)(v13)
        v_u_9:Play("CameraShake")({
            ["Amplitude"] = 1,
            ["Frequency"] = 5,
            ["FadeInTime"] = 0.1,
            ["FadeOutTime"] = 1,
            ["PositionInfluence"] = Vector3.new(1, 1, 1),
            ["RotationInfluence"] = Vector3.new(1, 1, 1)
        })
    end)
    v_u_5 = v_u_5 or v_u_7.GetService("StyleService")
    v_u_5:RequestSpecialCallback()
    return true
end