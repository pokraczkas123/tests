-- Decompiled game.ReplicatedStorage.Assets.Effects.MagneticPull

local v_u_1 = game:GetService("Debris")
game:GetService("TweenService")
local v_u_2 = game:GetService("CollectionService")
local v_u_3 = game:GetService("ReplicatedStorage")
local v_u_4 = require(v_u_3.Common.Physics)
function hideParticles(p5)
    for _, v6 in ipairs(p5:GetDescendants()) do
        if v6:IsA("ParticleEmitter") or v6:IsA("Beam") or v6:IsA("BillboardGui") then
            v6.Enabled = false
        end
    end
end
return function(p_u_7, p_u_8)
    -- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_2, (copy) v_u_4
    local v_u_9 = script.VFX.Attachment:Clone()
    v_u_1:AddItem(v_u_9, p_u_8.Duration + 5)
    local v10 = v_u_9:FindFirstChildOfClass("BillboardGui")
    if v10 then
        v10.Enabled = true
    end
    v_u_9.Parent = p_u_7.PrimaryPart
    local v_u_11 = nil
    task.delay(p_u_8.Duration * 0.8, function()
        -- upvalues: (ref) v_u_11, (copy) v_u_9
        if v_u_11 then
            pcall(task.cancel, v_u_11)
        end
        hideParticles(v_u_9)
    end)
    local v_u_12 = Instance.new("Attachment")
    v_u_1:AddItem(v_u_12, p_u_8.Duration + 5)
    for _, v13 in ipairs(v_u_9:GetChildren()) do
        if v13:IsA("Beam") then
            v13.Attachment1 = v_u_12
        end
    end
    local v_u_14 = game.Players:GetPlayerFromCharacter(p_u_7)
    v_u_11 = task.spawn(function()
        -- upvalues: (copy) v_u_9, (copy) v_u_14, (ref) v_u_3, (copy) p_u_7, (copy) v_u_12, (ref) v_u_2, (ref) v_u_4, (copy) p_u_8
        while v_u_9 and v_u_9.Parent and v_u_14 and v_u_14.Parent do
            local v15 = nil
            local v16 = nil
            local v17 = v_u_3:GetAttribute("ServedByPlayer")
            local v18 = v_u_14
            if v18 then
                if v_u_14.Team == nil or v_u_3:GetAttribute("HitBypass") == v_u_14.Name or v_u_3:GetAttribute("LastHitter") ~= v_u_14.Name then
                    v18 = false
                else
                    v18 = #v_u_14.Team:GetPlayers() > 1
                end
            end
            if (v17 == nil or v17 == p_u_7.Name) and v_u_3:GetAttribute("ServedByTeam") == nil and not v18 then
                for _, v19 in ipairs(v_u_2:GetTagged("Ball")) do
                    if v15 then
                        local v20 = (v19:GetPivot().Position - p_u_7:GetPivot().Position).Magnitude
                        if v20 < v16 then
                            v16 = v20
                            v15 = v19
                        end
                    else
                        v16 = (v19:GetPivot().Position - p_u_7:GetPivot().Position).Magnitude
                        v15 = v19
                    end
                end
                if v15 and not v_u_4.isPointOnTeamSide(v_u_14, v15:GetPivot().Position) then
                    v_u_12.Parent = nil
                    task.wait()
                else
                    local v21 = v_u_12
                    local v22
                    if v16 and v16 < p_u_8.Range + 2 then
                        v22 = v15.PrimaryPart
                    else
                        v22 = nil
                    end
                    v21.Parent = v22
                    task.wait()
                end
            else
                v_u_12.Parent = nil
                task.wait()
            end
        end
    end)
end