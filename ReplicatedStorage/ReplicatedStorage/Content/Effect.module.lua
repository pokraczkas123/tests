-- Decompiled game.ReplicatedStorage.Content.Effect

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Tools.Logger).new(script.Name)
return {
    ["Cache"] = {},
    ["new"] = function(p3)
        return p3
    end,
    ["Play"] = function(p4, p5)
        -- upvalues: (copy) v_u_2
        local v_u_6 = p4.Cache[p5] or script:FindFirstChild(p5)
        if v_u_6 then
            return function(p7)
                -- upvalues: (copy) v_u_6
                return require(v_u_6):Play(p7)
            end
        end
        v_u_2:Warn((("Effect not found: \'%*\'!"):format(p5)))
    end
}