-- Decompiled game.ReplicatedStorage.Content.Special.Hakka.PostAction.Orchestator.CharClone

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Tools.CharBot)
local v_u_3 = require(v1.Tools.CharBot.MockPlayer)
local v_u_4 = require(script.Effects)
local v_u_5 = require(script.Attributes)
local v_u_6 = require(script.Gravity)
local v_u_7 = require(script.Pool)
local v_u_8 = setmetatable({}, v_u_2)
v_u_8.__index = v_u_8
function v_u_8.new(p_u_9)
    -- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_2, (copy) v_u_8, (copy) v_u_5, (copy) v_u_6
    local v10 = p_u_9.Player
    local v_u_11 = v10.Character
    local v_u_12 = v_u_3.getSourcePlayer(v10)
    p_u_9.SourcePlayer = v_u_12
    p_u_9.Name = v_u_12.Name
    p_u_9.Team = p_u_9.Player.Team
    local v13 = v_u_7.checkOut(v_u_12)
    p_u_9.CharRender = v13
    function p_u_9.CharRenderCleanup()
        -- upvalues: (ref) v_u_7, (copy) v_u_12, (copy) p_u_9
        v_u_7.checkIn(v_u_12, p_u_9.CharRender)
    end
    local v14 = v_u_2.new(p_u_9)
    local v15 = v_u_8
    local v16 = setmetatable(v14, v15)
    v_u_5.bindAttributesToSourcePlayer(v16.MockPlayer, v_u_12)
    v13:ForAllParts(function(p17)
        -- upvalues: (copy) v_u_11
        p17.CollisionGroup = v_u_11.PrimaryPart.CollisionGroup
    end)
    v_u_6.applyGravityControl(v13.Character, v16._maid, 0.8, true)
    v_u_6.applyGravityControl(v_u_12.Character, v16._maid, 0.98)
    v16:PlaySpawnEffect()
    return v16
end
function v_u_8.Destroy(p18)
    -- upvalues: (copy) v_u_2
    p18:PlayFadeEffect()
    v_u_2.Destroy(p18)
end
function v_u_8.PlaySpawnEffect(p19)
    -- upvalues: (copy) v_u_4
    v_u_4.playSpawnEffect(p19.CharRender.Character, p19.MockPlayer.SourcePlayer)
end
function v_u_8.PlayFadeEffect(p20)
    -- upvalues: (copy) v_u_4
    v_u_4.playFadeEffect(p20.CharRender.Character)
end
return v_u_8