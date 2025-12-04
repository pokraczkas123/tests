-- Decompiled game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.ScreenShakeModule.ScreenShakePresets

local v_u_1 = require(script.Parent.ScreenShakeInstance)
local v_u_13 = {
    ["Vibration"] = function()
        -- upvalues: (copy) v_u_1
        local v2 = v_u_1.new(2.5, 25, 0.5, 0.5)
        v2.PositionInfluence = Vector3.new(0.25, 0.25, 0.25)
        v2.RotationInfluence = Vector3.new(0.5, 0.5, 0.5)
        return v2
    end,
    ["SoftVibration"] = function()
        -- upvalues: (copy) v_u_1
        local v3 = v_u_1.new(1.25, 15, 0.15, 0.75)
        v3.PositionInfluence = Vector3.new(0.175, 0.175, 0.175)
        v3.RotationInfluence = Vector3.new(0.4, 0.4, 0.4)
        return v3
    end,
    ["SofterVibration"] = function()
        -- upvalues: (copy) v_u_1
        local v4 = v_u_1.new(1, 15, 0.15, 1)
        v4.PositionInfluence = Vector3.new(0.1, 0.1, 0.1)
        v4.RotationInfluence = Vector3.new(0.3, 0.3, 0.3)
        return v4
    end,
    ["MidExplosion"] = function()
        -- upvalues: (copy) v_u_1
        local v5 = v_u_1.new(5, 10, 0.05, 0.5)
        v5.PositionInfluence = Vector3.new(0.75, 0.75, 0.75)
        v5.RotationInfluence = Vector3.new(1, 1, 1)
        return v5
    end,
    ["BigExplosion"] = function()
        -- upvalues: (copy) v_u_1
        local v6 = v_u_1.new(5, 20, 0.05, 1)
        v6.PositionInfluence = Vector3.new(1, 1, 1)
        v6.RotationInfluence = Vector3.new(1.25, 1.25, 1.25)
        return v6
    end,
    ["BiggerExplosion"] = function()
        -- upvalues: (copy) v_u_1
        local v7 = v_u_1.new(2, 30, 0.05, 3)
        v7.PositionInfluence = Vector3.new(1, 1, 1)
        v7.RotationInfluence = Vector3.new(1.25, 1.25, 1.25)
        return v7
    end,
    ["SoftExplosion"] = function()
        -- upvalues: (copy) v_u_1
        local v8 = v_u_1.new(3, 7.5, 0.05, 0.25)
        v8.PositionInfluence = Vector3.new(0.75, 0.75, 0.75)
        v8.RotationInfluence = Vector3.new(1, 1, 1)
        return v8
    end,
    ["SofterExplosion"] = function()
        -- upvalues: (copy) v_u_1
        local v9 = v_u_1.new(3, 10, 0.05, 0.25)
        v9.PositionInfluence = Vector3.new(0.25, 0.25, 0.25)
        v9.RotationInfluence = Vector3.new(0.5, 0.5, 0.5)
        return v9
    end,
    ["SmallExplosion"] = function()
        -- upvalues: (copy) v_u_1
        local v10 = v_u_1.new(4, 10, 0.05, 0.35)
        v10.PositionInfluence = Vector3.new(0.75, 0.75, 0.75)
        v10.RotationInfluence = Vector3.new(1, 1, 1)
        return v10
    end,
    ["RepeatVibration"] = function()
        -- upvalues: (copy) v_u_1
        local v11 = v_u_1.new(5, 7.5, 0.05, 0.2)
        v11.PositionInfluence = Vector3.new(0.1, 0.1, 0.1)
        v11.RotationInfluence = Vector3.new(0.1, 0.1, 0.1)
        return v11
    end,
    ["ShakyExplosion"] = function()
        -- upvalues: (copy) v_u_1
        local v12 = v_u_1.new(1.5, 4, 0.05, 0.5)
        v12.PositionInfluence = Vector3.new(1, 1, 1)
        v12.RotationInfluence = Vector3.new(1.5, 1.5, 1.5)
        return v12
    end
}
return setmetatable({}, {
    ["__index"] = function(_, p14)
        -- upvalues: (copy) v_u_13
        local v15 = v_u_13[p14]
        if type(v15) == "function" then
            return v15()
        end
        error("No preset found with index \"" .. p14 .. "\"")
    end
})