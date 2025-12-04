-- Decompiled game.ReplicatedStorage.Content.Special.Hakka.UpdateState

local v1 = game:GetService("ReplicatedStorage")
require(script.Parent.Parent)
require(v1.Common.Context)
local v_u_2 = require(v1.Common.SpecialLib.Action)
local v_u_3 = require(v1.Common.State)
return function(p4, p5)
    -- upvalues: (copy) v_u_2, (copy) v_u_3
    if not (p4 and p5 and p5.State and p5.State.Custom) then
        return true
    end
    if not v_u_2.isBallInPlay() then
        return false
    end
    local v6 = v_u_3.get(p5.Player, v_u_3.Id.Mastery, "Level", 0)
    p5.State.Custom.WasSpecialUsed = p5.State.Custom.WasSpecialUsed == true
    p5.State.Custom.PointMultiplier = v6 >= 1 and 1.1 or nil
    p5.State.Custom.CanHaveAdditionalCharge = p4.Metadata.ShowExtraBarAtMasteryLevel <= v6
    local v7 = v_u_2.evaluatePoints(p4, p5)
    local v8 = v_u_2.getRequirement(p4)
    if v_u_2.isServing(p5.Player) and v7 > 0 then
        return false
    end
    if p5.State.Custom.CanHaveAdditionalCharge then
        v8 = v8 * 2
    end
    v_u_2.updateActivationState(p4, p5.Player, v7)
    v_u_2.activateOnCompletion(p4, p5.Player, v7)
    v_u_2.updateCharge(p5.Player, v7, v8)
    return true
end