-- Decompiled game.ReplicatedStorage.Content.Special.Hakka.PostAction.Orchestator

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = nil
local v_u_4 = nil
local v_u_5 = require(v1.Packages.Knit)
local v_u_6 = require(v1.Packages.Maid)
require(v1.Common.Context)
local v_u_7 = require(script.CharClone)
local v_u_8 = require(v1.Tools.CharBot.MockPlayer)
return {
    ["createClone"] = function(p_u_9)
        -- upvalues: (copy) v_u_7, (ref) v_u_4, (copy) v_u_5
        local v10 = p_u_9.State.Custom
        local v11 = v10.HakkaMaid
        local v12 = v10.HakkaTarget
        local v13 = v_u_7.new({
            ["Player"] = p_u_9.Player,
            ["StartCFrame"] = v12
        })
        v13.CharRender.AnimTracks.SpikeIdle:Play()
        v11:GiveTask(v13)
        task.defer(function()
            -- upvalues: (ref) v_u_4, (ref) v_u_5, (copy) p_u_9
            v_u_4 = v_u_4 or v_u_5.GetService("QuestService")
            v_u_4:IncrementProgress(p_u_9.Player, v_u_4.Quest.Type.Special.Id, 1)
        end)
        v10.HakkaClone = v13
    end,
    ["setupActionPerformance"] = function(p_u_14)
        -- upvalues: (ref) v_u_3, (copy) v_u_5, (copy) v_u_7
        local v_u_15 = p_u_14.State.Custom
        local v_u_16 = v_u_15.HakkaMaid
        local v_u_17 = v_u_15.HakkaClone
        v_u_3 = v_u_3 or v_u_5.GetService("GameService")
        local v_u_18 = false
        local function v_u_21(p19, p20)
            -- upvalues: (copy) v_u_15, (ref) v_u_18, (ref) v_u_7, (copy) p_u_14, (copy) v_u_17, (copy) v_u_16
            if not (v_u_15.HakkaIsDead or v_u_18) then
                v_u_18 = true
                v_u_17:PerformMove((v_u_7.buildPerformParams({
                    ["Player"] = p_u_14.Player,
                    ["MoveId"] = p19,
                    ["TiltDirection"] = p20
                })))
                task.defer(function()
                    -- upvalues: (ref) v_u_15, (ref) v_u_16
                    task.wait(0.25)
                    if not v_u_15.HakkaIsDead then
                        v_u_16:Destroy()
                    end
                end)
            end
        end
        v_u_16:GiveTask(v_u_3.OnActionsBypassed:Connect(function(p22, p23)
            -- upvalues: (copy) v_u_15, (copy) v_u_17, (copy) v_u_21
            if not v_u_15.HakkaIsDead and p22 == v_u_17.MockPlayer.SourcePlayer then
                local v24 = p23.HakkaMoveset
                if v24 then
                    v_u_21(v24.ActionName, v24.TiltDirection)
                end
            end
        end))
    end,
    ["setupCleanup"] = function(p25)
        -- upvalues: (copy) v_u_8, (copy) v_u_6, (copy) v_u_2
        local v_u_26 = p25.State.Custom
        local v_u_27 = v_u_8.getSourcePlayer(p25.Player)
        local v28 = v_u_27.Character
        local v_u_29 = v_u_6.new()
        v_u_26.HakkaMaid = v_u_29
        v_u_26.HakkaIsDead = false
        v_u_29:GiveTask(function()
            -- upvalues: (copy) v_u_26
            v_u_26.HakkaIsDead = true
        end)
        task.delay(2, function()
            -- upvalues: (copy) v_u_26, (copy) v_u_29
            if not v_u_26.HakkaIsDead then
                v_u_29:Destroy()
            end
        end)
        if v28 then
            local v_u_30 = {
                [Enum.HumanoidStateType.Landed] = true,
                [Enum.HumanoidStateType.Running] = true
            }
            v_u_29:GiveTask(v_u_27.Character.Humanoid.StateChanged:Connect(function(_, p31)
                -- upvalues: (copy) v_u_26, (copy) v_u_30, (copy) v_u_29
                if not v_u_26.HakkaIsDead and v_u_30[p31] then
                    v_u_29:Destroy()
                end
            end))
        end
        v_u_29:GiveTask(v_u_2.PlayerRemoving:Connect(function(p32)
            -- upvalues: (copy) v_u_26, (copy) v_u_27, (copy) v_u_29
            if not v_u_26.HakkaIsDead and p32 == v_u_27 then
                v_u_29:Destroy()
            end
        end))
    end
}