-- Decompiled game.ReplicatedStorage.Content.Special.TheTwins.Callback

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = nil
local v_u_4 = require(v1.Packages.Knit)
return function()
    -- upvalues: (ref) v_u_2, (copy) v_u_4, (ref) v_u_3
    v_u_2 = v_u_2 or v_u_4.GetService("StyleService")
    v_u_3 = v_u_3 or v_u_4.GetController("AnimationController")
    v_u_3:StopStyleAnimations("Pose")
    v_u_3:StopStyleAnimations("PoseStart")
    task.spawn(function()
        -- upvalues: (ref) v_u_2, (ref) v_u_3
        if v_u_2:ToggleTwin():expect() then
            v_u_3:StopStyleAnimations("Idle", {
                ["Filter"] = {
                    "Jump",
                    "Set",
                    "Block",
                    "Spike"
                }
            })
            v_u_3:PlayAnimation("Idle")
        end
    end)
end