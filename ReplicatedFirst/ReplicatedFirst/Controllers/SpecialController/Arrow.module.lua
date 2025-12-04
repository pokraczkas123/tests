-- Decompiled game.ReplicatedFirst.Controllers.SpecialController.Arrow

local v1 = game:GetService("Players")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("StarterPlayer")
local v_u_5 = game:GetService("TweenService")
local v_u_6 = require(v_u_2.Packages.Fusion)
local v_u_7 = require(v_u_2.Common.State)
local v_u_8 = require(v_u_2.Packages.Knit)
local v_u_9 = {
    ["Player"] = v1.LocalPlayer
}
v_u_9.__index = v_u_9
function v_u_9.new(p10)
    -- upvalues: (copy) v_u_9, (copy) v_u_2, (copy) v_u_8
    local v11 = v_u_9
    local v12 = setmetatable({}, v11)
    v12.Character = v12.Player.Character
    v12.Garbage = {}
    v12.Arrow = v_u_2.Assets.Misc.DirectionArrow:Clone()
    local v13
    if v12.Character then
        v13 = v12.Character:FindFirstChildOfClass("Humanoid")
    else
        v13 = nil
    end
    v12.Humanoid = v13
    v12.Time = 0
    v12.Strength = p10.Power.Min
    v12.GameController = v_u_8.GetController("GameController")
    v12.AnimationController = v_u_8.GetController("AnimationController")
    v12.GameController.IsBusy:set(true)
    local v14 = v12.Garbage
    local v15 = v12.Arrow
    table.insert(v14, v15)
    v12:BindToHeartbeat(p10)
    return v12
end
function v_u_9.BindToHeartbeat(p_u_16, p_u_17)
    -- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_3
    if p_u_16.Humanoid then
        local v18 = p_u_16.Humanoid.MoveDirection
        local v19 = v_u_6.Value
        if v18.Magnitude ~= 1 then
            v18 = p_u_16.Character:GetPivot().LookVector
        end
        p_u_16.Direction = v19(v18)
        p_u_16.Spring = v_u_6.Spring(p_u_16.Direction, p_u_17.Speed, p_u_17.Damping)
        local v20 = p_u_16.Garbage
        local v21 = p_u_16.Direction
        table.insert(v20, v21)
        local v22 = p_u_16.Garbage
        local v23 = p_u_16.Spring
        table.insert(v22, v23)
        local v24 = p_u_16.Humanoid
        v24.WalkSpeed = v24.WalkSpeed * 0.2
        p_u_16.AnimationController:PlayAnimation("ArrowHold")
        local v_u_25 = p_u_16.AnimationController.LoadedAnimations.ArrowWalk
        v_u_25:Play(0.2, 0.001)
        task.spawn(function()
            -- upvalues: (copy) p_u_16, (ref) v_u_5, (copy) p_u_17
            p_u_16.Arrow.SurfaceGui.CanvasGroup.GroupTransparency = 1
            v_u_5:Create(p_u_16.Arrow.SurfaceGui.CanvasGroup, TweenInfo.new(p_u_17.Duration * 0.2), {
                ["GroupTransparency"] = 0
            }):Play()
        end)
        local v_u_26 = Instance.new("Motor6D")
        p_u_16.Arrow.Anchored = false
        p_u_16.Arrow.Size = Vector3.new(4, 0.1, 8) + Vector3.new(0, 0, 1) * p_u_17.Power.Min * 2
        p_u_16.Arrow.Parent = p_u_16.Character
        v_u_26.Part0 = p_u_16.Character.PrimaryPart
        v_u_26.Part1 = p_u_16.Arrow
        v_u_26.C0 = CFrame.new(0, -2.5, 0)
        v_u_26.Parent = p_u_16.Arrow
        local v27 = p_u_16.Garbage
        local v28 = v_u_3.Heartbeat
        table.insert(v27, v28:Connect(function(p29)
            -- upvalues: (copy) p_u_16, (copy) p_u_17, (copy) v_u_25, (copy) v_u_26
            local v30 = p_u_16
            v30.Time = v30.Time + p29
            if p_u_16.Destroy and p_u_16.Character and p_u_16.Character.Parent and p_u_16.Humanoid and p_u_16.Arrow then
                if p_u_16.GameController.IsPlaying:get() then
                    local v31 = p_u_16.Character:GetPivot()
                    local v32 = p_u_16.Time / p_u_17.Duration
                    local v33 = math.clamp(v32, 0, 1)
                    if p_u_16.Humanoid.MoveDirection.Magnitude >= 0.5 then
                        v_u_25:AdjustWeight(1)
                        p_u_16.Direction:set(p_u_16.Humanoid.MoveDirection)
                    elseif p_u_16.Humanoid.MoveDirection.Magnitude == 0 then
                        v_u_25:AdjustWeight(0.001)
                        p_u_16.Direction:set(p_u_16.Character:GetPivot().LookVector)
                    end
                    local v34 = p_u_16
                    local v35 = p_u_17.Power.Min
                    local v36 = p_u_17.Power.Max
                    v34.Strength = math.lerp(v35, v36, v33)
                    p_u_16.Arrow.Size = Vector3.new(4, 0.1, 8) + Vector3.new(0, 0, 1) * p_u_16.Strength * 2
                    v_u_26.C0 = CFrame.new(0, -2.5, 0) * CFrame.new(Vector3.new(0, 0, 0), v31:VectorToObjectSpace(p_u_16.Direction:get()))
                else
                    p_u_16:Destroy()
                end
            else
                if not p_u_16.Destroying and p_u_16.Destroy then
                    p_u_16:Destroy()
                end
                return
            end
        end))
    else
        p_u_16:Destroy()
    end
end
function v_u_9.Destroy(p37)
    -- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_6
    p37.Destroying = true
    local v38 = p37.Spring:get().Unit * p37.Strength
    p37.GameController.IsBusy:set(false)
    p37.AnimationController:StopAnimation("ArrowHold")
    p37.AnimationController:StopAnimation("ArrowWalk")
    if p37.Humanoid then
        p37.Humanoid.WalkSpeed = v_u_7.get(p37.Player, v_u_7.Id.Multiplier, "Speed", 1) * v_u_4.CharacterWalkSpeed
    end
    setmetatable(p37, nil)
    v_u_6.cleanup(p37.Garbage)
    table.clear(p37)
    return v38
end
return v_u_9