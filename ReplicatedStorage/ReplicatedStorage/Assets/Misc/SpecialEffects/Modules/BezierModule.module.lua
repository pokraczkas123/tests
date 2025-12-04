-- Decompiled game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.BezierModule

local v_u_1 = game:GetService("RunService")
local v_u_2 = {}
for _, v3 in pairs(script:GetChildren()) do
    v_u_2[v3.Name] = require(v3)
end
local v_u_4 = {}
local v_u_5 = nil
local function v_u_16()
    -- upvalues: (copy) v_u_4, (copy) v_u_1, (ref) v_u_5, (copy) v_u_2
    if #v_u_4 == 0 then
        v_u_1:UnbindFromRenderStep("SarinBezier")
    end
    v_u_5 = os.clock()
    for v6, v7 in next, v_u_4 do
        local v8 = v7.Callback
        local v9 = v_u_2[v7.Eq]
        local v10 = (v_u_5 - v7.Start) / v7.Duration
        local v11 = v7.Points
        local v12 = v9(v10, unpack(v11))
        local v13 = v_u_2[v7.Eq]
        local v14 = (v_u_5 - v7.Start) / v7.Duration + 0.016666666666666666
        local v15 = v7.Points
        if v8(v12, v13(v14, unpack(v15))) or (v_u_5 - v7.Start) / v7.Duration >= 1 then
            table.remove(v_u_4, v6)
        end
    end
end
return function(p17, p18, p19, ...)
    -- upvalues: (copy) v_u_4, (copy) v_u_1, (copy) v_u_16
    v_u_4[#v_u_4 + 1] = {
        ["Eq"] = p17,
        ["Callback"] = p18,
        ["Start"] = os.clock(),
        ["Duration"] = p19,
        ["Points"] = { ... }
    }
    if #v_u_4 == 1 then
        v_u_1:BindToRenderStep("SarinBezier", Enum.RenderPriority.Last.Value, v_u_16)
    end
end