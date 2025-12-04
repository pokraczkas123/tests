-- Decompiled game.ReplicatedStorage.Content.ActionBypass.Entities.HakkaMoveset

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent.Parent)
local v_u_3 = require(v1.Common.State)
local v_u_4 = {
    ["JumpSet"] = true,
    ["Spike"] = true,
    ["Block"] = true
}
return v2.new({
    ["Id"] = script.Name,
    ["ProccessClient"] = function(p5)
        -- upvalues: (copy) v_u_4
        if v_u_4[p5.ActionName] then
            return p5.InputState == Enum.UserInputState.Begin and {
                ["ActionName"] = p5.ActionName,
                ["Charge"] = p5.Charge,
                ["TiltDirection"] = p5.TiltDirection
            } or nil
        else
            return nil
        end
    end,
    ["ValidateShared"] = function(p6, p7)
        -- upvalues: (copy) v_u_4, (copy) v_u_3
        if v_u_4[p7.ActionName] then
            if p7.Charge > 1 or p7.Charge < 0 then
                return false
            elseif v_u_3.get(p6.Player, v_u_3.Id.Gameplay, "Style") == "Hakka" then
                return p6.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall
            else
                return false
            end
        else
            return false
        end
    end
})