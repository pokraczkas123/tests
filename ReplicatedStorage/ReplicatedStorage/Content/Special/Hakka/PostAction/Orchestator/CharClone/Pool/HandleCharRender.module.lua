-- Decompiled game.ReplicatedStorage.Content.Special.Hakka.PostAction.Orchestator.CharClone.Pool.HandleCharRender

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Tools.CharBot.CharRender)
local v_u_3 = require(script.Parent.Config)
local v_u_4 = {
    ["R15"] = v1.Assets.Misc.CharBots.R15
}
local v_u_15 = {
    ["zeroPhysics"] = function(p5)
        p5.Velocity = Vector3.new(0, 0, 0)
        p5.RotVelocity = Vector3.new(0, 0, 0)
        p5.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        p5.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
    end,
    ["removeFromRange"] = function(p6)
        -- upvalues: (copy) v_u_15, (copy) v_u_3
        v_u_15.zeroPhysics(p6.HumanoidRootPart)
        p6.HumanoidRootPart.Anchored = true
        p6.Character:PivotTo(CFrame.new(v_u_3.Constants.OFFSCREEN_POSITION))
    end,
    ["create"] = function(p7)
        -- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_3, (copy) v_u_15
        local v8 = v_u_4.R15:Clone()
        local v9 = v_u_2.new(v8)
        v9.Character.Name = v_u_3.Constants.MODEL_PREFIXES.OFFSCREEN
        v_u_15.removeFromRange(v9)
        v9.Character.Parent = p7
        return v9
    end,
    ["prepForOnscreen"] = function(p10, p11)
        -- upvalues: (copy) v_u_3
        p10.Character.Name = ("%*_%*"):format(v_u_3.Constants.MODEL_PREFIXES.ONSCREEN, p11)
        p10.Character.HumanoidRootPart.Anchored = false
        p10.Character.Parent = workspace
    end,
    ["goOffscreen"] = function(p12, p13, p14)
        -- upvalues: (copy) v_u_3, (copy) v_u_15
        if p14 then
            p12.Character.Name = ("%*_%*"):format(v_u_3.Constants.MODEL_PREFIXES.OFFSCREEN, p14)
        else
            p12.Character.Name = v_u_3.Constants.MODEL_PREFIXES.OFFSCREEN
        end
        p12.Character.Parent = p13
        v_u_15.removeFromRange(p12)
    end
}
return v_u_15