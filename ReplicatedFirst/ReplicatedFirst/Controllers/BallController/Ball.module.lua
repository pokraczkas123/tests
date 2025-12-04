-- Decompiled game.ReplicatedFirst.Controllers.BallController.Ball

local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("RunService")
local v_u_4 = require(v_u_2.Packages.Maid)
local v5 = require(v_u_2.Packages.Jecs)
local v_u_6 = require(v_u_2.Common.Physics)
local v_u_7 = require(v_u_2.Packages.Signal)
local v_u_8 = require(v_u_2.Configuration.Game)
local v_u_9 = v_u_2.Assets.Misc.BallShadowIndicator
local v_u_10 = v5.World.new()
local v_u_11 = v_u_10:component()
local v_u_12 = v_u_10:component()
local v_u_13 = {}
v_u_13.__index = v_u_13
v_u_13.All = {}
function v_u_13.new(p14, p15, p16)
    -- upvalues: (copy) v_u_13, (copy) v_u_4, (copy) v_u_9, (copy) v_u_10, (copy) v_u_7, (copy) v_u_11, (copy) v_u_12
    local v17 = v_u_13
    local v_u_18 = setmetatable({}, v17)
    v_u_18.maid = v_u_4.new()
    v_u_18.Ball = p14
    v_u_18.Ball:AddTag("Ball")
    v_u_18.Ball.Parent = game.Workspace
    v_u_18.Shadow = v_u_9:Clone()
    v_u_18.Shadow.Parent = workspace
    v_u_18.ID = v_u_10:entity()
    v_u_18.Ball:SetAttribute("Id", v_u_18.ID)
    v_u_18.Ball.Name = "CLIENT_BALL_" .. v_u_18.ID
    v_u_18.Orientation = CFrame.new()
    local v19 = Instance.new("Highlight")
    v19.FillTransparency = 1
    v19.OutlineColor = Color3.new()
    v19.OutlineTransparency = 0
    v19.DepthMode = Enum.HighlightDepthMode.Occluded
    v19.Parent = p14
    v_u_18.OnHitBindable = v_u_7.new()
    v_u_18.maid:GiveTask(v_u_18.Ball)
    v_u_18.maid:GiveTask(v_u_18.Shadow)
    v_u_18.maid:GiveTask(v_u_18.OnHitBindable)
    v_u_10:set(v_u_18.ID, v_u_11, p15)
    v_u_10:set(v_u_18.ID, v_u_12, p16)
    v_u_13.All[v_u_18.ID] = v_u_18
    v_u_18.maid:GiveTask(function()
        -- upvalues: (ref) v_u_13, (copy) v_u_18
        v_u_13.All[v_u_18.ID] = nil
    end)
    return v_u_18
end
function v_u_13.Update(p20, p21, p22)
    -- upvalues: (copy) v_u_10, (copy) v_u_11, (copy) v_u_12
    if (p20.Ball:GetPivot().Position - p21.Position).Magnitude > 5 then
        p20.Ball:PivotTo(p21 * p20.Orientation)
    end
    v_u_10:set(p20.ID, v_u_11, p21)
    v_u_10:set(p20.ID, v_u_12, p22)
end
function v_u_13.Destroy(p23)
    -- upvalues: (copy) v_u_10
    p23.maid:DoCleaning()
    v_u_10:delete(p23.ID)
end
function v_u_13.Init(_)
    -- upvalues: (copy) v_u_13, (copy) v_u_3, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12, (copy) v_u_6, (copy) v_u_2, (copy) v_u_8, (copy) v_u_1
    v_u_13.Init = nil
    v_u_3.RenderStepped:Connect(function(p24)
        -- upvalues: (ref) v_u_10, (ref) v_u_11, (ref) v_u_12, (ref) v_u_13, (ref) v_u_6, (ref) v_u_2, (ref) v_u_8, (ref) v_u_1
        for v25, v26, v27 in v_u_10:query(v_u_11, v_u_12) do
            local v28 = v_u_13.All[v25]
            local v29 = v28.Ball
            if not (v29 and v29.PrimaryPart) then
                v28:Destroy()
                return
            end
            local v30 = v29.PrimaryPart
            local v31 = v28.Shadow
            local v32 = v_u_6.calculateBallPhysics(p24, v27, v30.Position, v28)
            local v33 = (v_u_2:GetAttribute("BallRotationOverride") or v_u_8.Ball.RadPerStud) * v27.Magnitude * p24
            local v34 = math.rad(v33)
            v28.Orientation = v28.Orientation * CFrame.fromOrientation(v34, 0, 0)
            local v35 = v_u_1.LocalPlayer:GetNetworkPing() * 2
            if 5 + v27.Magnitude * p24 + v27.Magnitude * v35 < (v26.Position - v29:GetPivot().Position).Magnitude then
                v29:PivotTo(v26 * v28.Orientation)
            end
            if v32.Hit then
                v28.OnHitBindable:Fire(v32.Hit)
            end
            v_u_10:set(v25, v_u_12, v27)
            if v32.Goal then
                v29:PivotTo(v29:GetPivot():Lerp(v26 * v28.Orientation + v32.Goal, 0.3))
                v_u_10:set(v25, v_u_11, v26 + v32.Goal)
                local v36 = v_u_6.calculateFloorHeight(v30.Position)
                if v36 then
                    local v37 = (v30.Position.Y - v36) / v_u_8.Ball.MaxShadowDistance
                    local v38 = math.clamp(v37, 0, 1)
                    local v39 = v_u_8.Ball.MaxShadowDistance * v38
                    local v40 = v_u_8.Ball.ShadowSize.Min
                    local v41 = v_u_8.Ball.ShadowSize.Max
                    local v42 = math.clamp(v39, v40, v41)
                    v31.CFrame = CFrame.new(v30.Position.X, v36 - v31.Size.Y / 2 + 0.15, v30.Position.Z)
                    local v43 = v31.Size.Y
                    v31.Size = Vector3.new(v42, v43, v42)
                end
            end
        end
    end)
end
return v_u_13, v_u_13:Init()
