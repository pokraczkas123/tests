-- Decompiled game.ReplicatedStorage.Tools.CharBot

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = require(v1.Packages.Maid)
local v_u_4 = require(v1.Packages.Knit)
local v_u_5 = require(v1.Common.State)
local v_u_6 = require(v1.Configuration.Place)()
local v_u_7 = require(script.MockPlayer)
require(script.Types)
local v_u_8 = {}
local v_u_9 = {}
v_u_9.__index = v_u_9
function v_u_9.fromModel(p10)
    -- upvalues: (copy) v_u_8
    return v_u_8[p10]
end
function v_u_9.new(p11)
    -- upvalues: (copy) v_u_9, (copy) v_u_3, (copy) v_u_7, (copy) v_u_5, (copy) v_u_8
    local v12 = v_u_9
    local v13 = setmetatable({}, v12)
    local v14 = v_u_3.new()
    v13._maid = v14
    local v15 = math.random() * 1e17
    v13.ID = math.floor(v15)
    local v16 = p11.CharRender
    v13.CharRender = v16
    v14:GiveTask(p11.CharRenderCleanup or v16)
    local v_u_17 = v16.Character
    local v18 = v_u_7.new
    local v19 = {
        ["Name"] = p11.Name or ("CharBot_%*"):format(v13.ID),
        ["UserId"] = v13.ID,
        ["Character"] = v_u_17,
        ["SourcePlayer"] = p11.SourcePlayer
    }
    local v20
    if p11.SourcePlayer then
        v20 = p11.SourcePlayer.Team
    else
        v20 = nil
    end
    v19.Team = v20
    local v21 = v18(v19)
    v_u_5.set(v21, v_u_5.Id.Gameplay, "InGame", true)
    v13.MockPlayer = v21
    v14:GiveTask(v21)
    v_u_17:PivotTo(p11.StartCFrame)
    v16.AnimTracks.Idle:Play()
    v_u_17.AutoTilt.Enabled = true
    v14:GiveTask(function()
        -- upvalues: (copy) v_u_17
        v_u_17.AutoTilt.Enabled = false
    end)
    v_u_8[v_u_17] = v13
    return v13
end
function v_u_9.buildPerformParams(p22)
    -- upvalues: (ref) v_u_2, (copy) v_u_4, (copy) v_u_6
    v_u_2 = v_u_2 or v_u_4.GetService("BallService")
    local v23 = p22.MoveId
    local v24 = p22.BallId
    if not v24 then
        local v25 = (p22.Player:GetAttribute("IsMock") or false) and p22.Player.SourcePlayer or p22.Player
        local v26 = v25:GetAttribute("IsMock") == nil
        local v27 = ("player %* must be a player instance to auto-detect ballId, NOT a mock player."):format(v25.UserId)
        assert(v26, v27)
        local v28
        if v_u_6.Current == v_u_6.Training then
            v28 = v_u_2.Spawner.Balls[v25]
        else
            v28 = v_u_2.Spawner.CurrentBall
        end
        local v29 = ("No ball found for player %*"):format(v25.Name)
        assert(v28, v29)
        v24 = v28.ID
    end
    local v30 = p22.Charge or 1
    return {
        ["BallId"] = v24,
        ["MoveId"] = v23,
        ["Charge"] = math.clamp(v30, 0, 1),
        ["TiltDirection"] = p22.TiltDirection
    }
end
function v_u_9.GetSourcePlayer(p31)
    return p31.MockPlayer.SourcePlayer
end
function v_u_9.PerformMove(p32, p33)
    -- upvalues: (ref) v_u_2, (copy) v_u_4
    v_u_2 = v_u_2 or v_u_4.GetService("BallService")
    v_u_2.Interaction.createHitbox(p32.MockPlayer, {
        ["Key"] = nil,
        ["Move"] = p33.MoveId,
        ["BallId"] = p33.BallId,
        ["Charge"] = p33.Charge,
        ["TiltDirection"] = p33.TiltDirection
    })
    local v34 = p32.CharRender.AnimTracks[p33.MoveId]
    if v34 then
        v34:Play()
    end
end
function v_u_9.Destroy(p35)
    -- upvalues: (copy) v_u_8
    p35.IsDead = true
    v_u_8[p35.CharRender.Character] = nil
    p35._maid:Destroy()
end
return v_u_9