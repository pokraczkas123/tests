-- Decompiled game.ReplicatedStorage.Content.Special.Hakka.PostAction.Orchestator.CharClone.Pool

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("RunService")
if v_u_3:IsClient() then
    return {}
end
require(v2.Tools.CharBot.CharRender)
local v_u_4 = require(v2.Common.State)
local v_u_5 = require(script.Config)
local v_u_6 = require(script.GlobalPool)
local v_u_7 = require(script.PlayerPool)
local v_u_8 = {}
local v_u_9 = {}
function v_u_8.start()
    -- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_1, (copy) v_u_8, (copy) v_u_3, (copy) v_u_4
    v_u_6.makeCheckedInObjects(v_u_5.Constants.START_CHARS)
    v_u_1.PlayerRemoving:Connect(function(p10)
        -- upvalues: (ref) v_u_8
        v_u_8.removePlayer(p10)
    end)
    local v_u_11 = 0
    v_u_3.Heartbeat:Connect(function(p12)
        -- upvalues: (ref) v_u_11, (ref) v_u_5, (ref) v_u_1, (ref) v_u_8
        v_u_11 = v_u_11 + p12
        if v_u_11 >= v_u_5.Constants.CHAR_POOL_REFRESH_TIME then
            v_u_11 = 0
            for _, v13 in v_u_1:GetChildren() do
                v_u_8.refreshRelevantPlayer(v13)
            end
            v_u_8.clean()
        end
    end)
    v_u_1.PlayerAdded:Connect(function(p_u_14)
        -- upvalues: (ref) v_u_5, (ref) v_u_8, (ref) v_u_4
        if v_u_5.isInGame(p_u_14) == true then
            v_u_8.refreshRelevantPlayer(p_u_14)
        end
        v_u_4.onChange(p_u_14, v_u_4.Id.Gameplay, "InGame", function(_)
            -- upvalues: (copy) p_u_14, (ref) v_u_5, (ref) v_u_8
            local v15 = p_u_14
            if v_u_5.isInGame(v15) == true then
                v_u_8.refreshRelevantPlayer(v15)
            end
        end)
    end)
end
function v_u_8.refreshRelevantPlayer(p16)
    -- upvalues: (copy) v_u_5, (copy) v_u_8
    if v_u_5.canPlayerHaveClones(p16) then
        v_u_8.reconcileFromPlayer(p16)
    else
        v_u_8.removePlayer(p16)
    end
end
function v_u_8.clean()
    -- upvalues: (copy) v_u_6, (copy) v_u_5
    v_u_6.Pool:CleanToTargetCount(v_u_5.Constants.START_CHARS)
end
function v_u_8.getPool(p17)
    -- upvalues: (copy) v_u_9
    return v_u_9[p17]
end
function v_u_8.newPool(p18)
    -- upvalues: (copy) v_u_7, (copy) v_u_5
    local v19 = v_u_7.createPool(p18)
    local v20 = v_u_5.computeStartCount(p18)
    v_u_7.preFillPool(v19, v20)
    return v19
end
function v_u_8.reconcileFromPlayer(p21)
    -- upvalues: (copy) v_u_9, (copy) v_u_8
    local v22 = v_u_9[p21]
    if not v22 then
        v22 = v_u_8.newPool(p21)
        v_u_9[p21] = v22
    end
    return v22
end
function v_u_8.removePlayer(p23)
    -- upvalues: (copy) v_u_9
    local v24 = v_u_9[p23]
    if v24 then
        v24:Destroy()
        v_u_9[p23] = nil
    end
end
function v_u_8.checkOut(p25)
    -- upvalues: (copy) v_u_8
    return v_u_8.reconcileFromPlayer(p25):CheckOutOrMake()
end
function v_u_8.checkIn(p26, p27)
    -- upvalues: (copy) v_u_8
    local v28 = v_u_8.getPool(p26)
    if v28 then
        v28:CheckIn(p27)
    end
end
v_u_8.start()
return v_u_8