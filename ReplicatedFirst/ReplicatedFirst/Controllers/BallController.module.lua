-- Decompiled game.ReplicatedFirst.Controllers.BallController

local v_u_1 = game:GetService("CollectionService")
local v_u_2 = game:GetService("Debris")
local v_u_3 = game:GetService("Players")
local v_u_4 = game:GetService("ReplicatedStorage")
local v_u_5 = nil
local v_u_6 = require(v_u_4.Packages.Knit)
local v_u_7 = require(script.Network).BallStream
local v_u_8 = require(script.Ball)
local v_u_9 = v_u_4:FindFirstChild("Assets"):FindFirstChild("Ball")
local v_u_10 = require(v_u_4.Tools.Utility).applyToAllTagged
local v_u_11 = require(v_u_4.Configuration.Gamemode)
local v_u_12 = v_u_6.CreateController({
    ["Name"] = "BallController",
    ["ActiveBalls"] = {}
})
function v_u_12.KnitInit(_)
    -- upvalues: (ref) v_u_5, (copy) v_u_6
    v_u_5 = v_u_6.GetService("BallService")
end
function v_u_12.KnitStart(p_u_13)
    -- upvalues: (copy) v_u_10, (copy) v_u_11, (copy) v_u_3, (copy) v_u_4, (copy) v_u_7, (copy) v_u_12, (copy) v_u_9, (copy) v_u_8, (ref) v_u_5, (copy) v_u_1
    v_u_10("HeadBall", function(p14)
        -- upvalues: (ref) v_u_11, (ref) v_u_3, (ref) v_u_4
        if p14:IsDescendantOf(game.Workspace) then
            local v15
            if v_u_11.Current() == v_u_11.Types.Training then
                v15 = v_u_3.LocalPlayer.Name
            else
                v15 = v_u_4:GetAttribute("ServedByPlayer")
            end
            local v16
            if v_u_11.Current() == v_u_11.Types.Training then
                v16 = v_u_3.LocalPlayer
            else
                v16 = v_u_3:FindFirstChild(v15)
            end
            if v16 then
                local v17 = v16.Character
                if v17 then
                    local v18 = v17.Head.face.Texture
                    p14.face.Texture = v18
                    p14.Color = v17.Head.Color
                end
            else
                return
            end
        else
            return
        end
    end)
    task.spawn(function()
        -- upvalues: (ref) v_u_7, (ref) v_u_12, (ref) v_u_9, (ref) v_u_8, (ref) v_u_5
        v_u_7.SetCallback(function(p19)
            -- upvalues: (ref) v_u_12, (ref) v_u_9, (ref) v_u_8
            local v20 = v_u_12.ActiveBalls[p19.ID]
            if v20 or not p19.Skin then
                if not v20 then
                    return
                end
            else
                local v21 = v_u_9:FindFirstChild(p19.Skin)
                if not v21 then
                    warn((("Could not find skin: %*"):format(p19.Skin)))
                    return
                end
                local v22 = v21:Clone()
                for _, v23 in ipairs(v22:GetDescendants()) do
                    if v23:IsA("BasePart") then
                        v23.CastShadow = false
                    end
                end
                v20 = v_u_8.new(v22, p19.cframe, p19.velocity)
                v_u_12.ActiveBalls[p19.ID] = v20
                v20.Ball:SetAttribute("ServerId", p19.ID)
            end
            v20:Update(p19.cframe, p19.velocity)
        end)
        v_u_5:IsReplicateReady()
    end)
    v_u_5.BallEffect:Connect(function(p24, p25)
        -- upvalues: (copy) p_u_13
        p_u_13:DisplayEffect(p24, p25)
    end)
    v_u_5.ClearBallEffects:Connect(function(p26)
        -- upvalues: (copy) p_u_13
        p_u_13:ClearBallEffects(p26)
    end)
    v_u_5.OnBallDestroyed:Connect(function(p27)
        -- upvalues: (ref) v_u_12, (ref) v_u_1
        local v28 = v_u_12.ActiveBalls[p27]
        if v28 then
            v28:Destroy()
            v_u_12.ActiveBalls[p27] = nil
        end
        for _, _ in ipairs(v_u_1:GetTagged("Ball")) do
            if not v_u_12.ActiveBalls[v28:GetAttribute("ServerId")] then
                v28:Destroy()
            end
        end
    end)
end
function v_u_12.ApplyEffects(_, p29, p30)
    for _, v31 in ipairs(p30:GetChildren()) do
        local v32 = v31:Clone()
        v32:AddTag("BallEffect")
        v32.Parent = p29.PrimaryPart
        if v32:IsA("Sound") then
            v32:Play()
        end
    end
end
function v_u_12.DisplayEffect(p33, p34, p35)
    -- upvalues: (copy) v_u_4, (copy) v_u_12
    p33:ClearBallEffects(p35)
    local v36 = v_u_4.Assets.Effects:FindFirstChild(p34)
    if v36 then
        if p35 then
            local v37 = v_u_12.ActiveBalls[p35]
            if v37 and v37.Ball and v37.Ball.Parent then
                p33:ApplyEffects(v37.Ball, v36)
            end
        else
            for _, v38 in pairs(v_u_12.ActiveBalls) do
                p33:ApplyEffects(v38.Ball, v36)
            end
            return
        end
    else
        return
    end
end
function v_u_12.RemoveEffect(_, p39)
    -- upvalues: (copy) v_u_2
    if p39:IsA("ParticleEmitter") or p39:IsA("Trail") then
        p39.Enabled = false
        v_u_2:AddItem(p39, 3)
    elseif p39:IsA("Attachment") then
        v_u_2:AddItem(p39, 3)
    else
        p39:Destroy()
    end
    for _, v40 in ipairs(p39:GetDescendants()) do
        if v40:IsA("ParticleEmitter") or v40:IsA("Trail") then
            v40.Enabled = false
        end
    end
end
function v_u_12.ClearBallEffects(p41, p42)
    -- upvalues: (copy) v_u_1, (copy) v_u_12
    if not p42 then
        for _, v43 in ipairs(v_u_1:GetTagged("BallEffect")) do
            p41:RemoveEffect(v43)
        end
    end
    local v44 = v_u_12.ActiveBalls[p42]
    if v44 and v44.Ball and v44.Ball.Parent then
        for _, v45 in ipairs(v44.Ball.PrimaryPart:GetChildren()) do
            if v45:HasTag("BallEffect") then
                p41:RemoveEffect(v45)
            end
        end
    end
end
return v_u_12