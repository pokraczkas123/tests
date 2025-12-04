-- Decompiled game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.EndOnJump

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Common.State)
local v_u_4 = v_u_1.LocalPlayer
return function(p5, p_u_6)
    -- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_1
    local v_u_7 = nil
    local v_u_8 = nil
    local v_u_9 = false
    local function v_u_10()
        -- upvalues: (ref) v_u_7, (ref) v_u_9, (ref) v_u_8, (copy) p_u_6
        if v_u_7 then
            v_u_7:Disconnect()
        end
        v_u_9 = true
        if v_u_8 and coroutine.status(v_u_8) ~= "dead" then
            pcall(function()
                -- upvalues: (ref) v_u_8
                task.cancel(v_u_8)
            end)
        end
        p_u_6()
    end
    local function v11()
        -- upvalues: (ref) v_u_3, (ref) v_u_4, (copy) v_u_10
        if not v_u_3.get(v_u_4, v_u_3.Id.Debounce, "JumpThrottle") then
            v_u_10()
        end
    end
    if not v_u_3.get(v_u_4, v_u_3.Id.Debounce, "JumpThrottle") then
        v_u_10()
    end
    v_u_7 = v_u_1:GetAttributeChangedSignal(v_u_3.getKey(v_u_3.Id.Debounce, "JumpThrottle")):Connect(v11)
    v_u_8 = task.delay(p5, function()
        -- upvalues: (ref) v_u_9, (copy) v_u_10
        if not v_u_9 then
            v_u_10()
        end
    end)
end