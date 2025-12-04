-- Decompiled game.ReplicatedStorage.Content.Ability.RedirectionJump.OnActivation

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Content.Effect)
local v_u_3 = require(v1.Common.State)
return function(_, p_u_4)
    -- upvalues: (copy) v_u_2, (copy) v_u_3
    p_u_4.Character.Humanoid.AutoRotate = true
    local v_u_5 = v_u_2:Play("Particle")({
        ["Name"] = "Redirection",
        ["Parent"] = p_u_4.Character.PrimaryPart,
        ["ManualDisable"] = true
    })
    local v_u_6 = nil
    v_u_6 = p_u_4.Character.Humanoid.StateChanged:Connect(function(_, p7)
        -- upvalues: (copy) p_u_4, (ref) v_u_6, (ref) v_u_3, (copy) v_u_5
        if p7 == Enum.HumanoidStateType.Freefall or p7 == Enum.HumanoidStateType.Jumping or p7 == Enum.HumanoidStateType.Running then
            p_u_4.Character.Humanoid.AutoRotate = true
            v_u_6:Disconnect()
            task.wait(1)
            v_u_3.set(p_u_4, v_u_3.Id.Ability, "EndTimestamp", nil)
            v_u_3.set(p_u_4, v_u_3.Id.Ability, "Current", nil)
            v_u_5()
        end
    end)
end