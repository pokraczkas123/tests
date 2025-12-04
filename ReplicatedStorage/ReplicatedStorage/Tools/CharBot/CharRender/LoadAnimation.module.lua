-- Decompiled game.ReplicatedStorage.Tools.CharBot.CharRender.LoadAnimation

local v1 = game:GetService("ReplicatedStorage")
require(v1.Content.Animations)
local v_u_16 = {
    ["load"] = function(p2, p3)
        local v4 = Instance.new("Animation")
        v4.AnimationId = p2.Id
        local v5 = p3:LoadAnimation(v4)
        if p2.Priority then
            v5.Priority = p2.Priority
        end
        if p2.Looped then
            v5.Looped = p2.Looped
        end
        return v4, v5
    end,
    ["loadAll"] = function(p6, p7)
        -- upvalues: (copy) v_u_16
        local v_u_8 = {}
        local v_u_9 = {}
        for v10, v11 in p6 do
            local _, v12 = v_u_16.load(v11, p7)
            v_u_8[v10] = v12
        end
        local v_u_13 = nil
        return v_u_8, function()
            -- upvalues: (ref) v_u_13, (copy) v_u_8, (copy) v_u_9
            if not v_u_13 then
                v_u_13 = true
                for _, v14 in v_u_8 do
                    v14:Stop()
                    v14:Destroy()
                end
                for _, v15 in v_u_9 do
                    v15:Destroy()
                end
            end
        end
    end
}
return v_u_16