-- Decompiled game.ReplicatedStorage.Content.Special.TeamCaptain.PostAction

local v_u_1 = NumberRange.new(40, 60)
local v2 = game:GetService("ReplicatedStorage")
require(script.Parent.Parent)
local v_u_3 = require(v2.Common.Physics)
require(v2.Common.Context)
return function(p4, p5)
    -- upvalues: (copy) v_u_3, (copy) v_u_1
    local v6 = p5.Player
    local v7 = v6.Team == nil and 0 or v6.Team:GetAttribute("Index") or 0
    local v8 = ("TeamMultiplier%*%*"):format(p4.Metadata.Action, v7)
    local v9 = p4.Metadata.Multiplier
    local v10 = v_u_3.unit(p5.TiltDirection * Vector3.new(1, 0, 1))
    if v10.Magnitude > 0.1 and p5.Move == "JumpSet" then
        local v11 = p5.Charge or 1
        local v12 = math.clamp(v11, 0, 1)
        local v13 = v_u_3.lerpFromRange(p4.Metadata.TiltMultiplier, v12) * 100
        v9 = math.round(v13) / 100
        local v14 = CFrame.new
        local v15 = p5.State.Ball.Position * Vector3.new(1, 0, 1) + (v6.Character:GetPivot().Position * Vector3.new(1, 0, 1)).Unit
        local v16 = p5.State.Ball.Position.Y + v_u_3.lerp(0.5, 2.5, v12)
        local v17 = v14(v15 + Vector3.new(0, v16, 0) + v10 * v_u_3.lerp(7, 20, v12))
        p5.State.Ball.Target = {
            ["Goal"] = v17,
            ["MaxVelocity"] = v_u_3.lerpFromRange(v_u_1, v12),
            ["MaxAcceleration"] = 110,
            ["ExpireAt"] = 3
        }
    end
    local v18 = p5.Ball
    local v19 = p5.Ball:GetAttribute(v8, 0) + v9
    v18:SetAttribute(v8, (math.min(v19, 2.2)))
    local v20 = v9 < p4.Metadata.TiltMultiplier.Min - 0.05 and "Small" or v9 < p4.Metadata.TiltMultiplier.Max - 0.05 and "Medium" or "Large"
    p5.Ball:SetAttribute("BallStrengthFromTeamCaptain", v20)
    p5.State.Effect.Ball = ("TeamCaptain%*"):format(v20)
    p5.State.Effect.Visual = "TeamCaptainSet"
    p5.State.Events.SpecialActive = v20 == "Large"
    return true
end