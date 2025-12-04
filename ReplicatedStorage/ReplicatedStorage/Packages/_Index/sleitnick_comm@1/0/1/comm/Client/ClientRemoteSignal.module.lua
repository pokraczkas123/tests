-- Decompiled game.ReplicatedStorage.Packages._Index.sleitnick_comm@1.0.1.comm.Client.ClientRemoteSignal

local v_u_1 = require(script.Parent.Parent.Parent.Signal)
require(script.Parent.Parent.Types)
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.new(p3, p_u_4, p5)
    -- upvalues: (copy) v_u_2, (copy) v_u_1
    local v6 = v_u_2
    local v_u_7 = setmetatable({}, v6)
    v_u_7._re = p3
    if p5 and #p5 > 0 then
        v_u_7._hasOutbound = true
        v_u_7._outbound = p5
    else
        v_u_7._hasOutbound = false
    end
    if not p_u_4 or #p_u_4 <= 0 then
        v_u_7._directConnect = true
        return v_u_7
    end
    v_u_7._directConnect = false
    v_u_7._signal = v_u_1.new()
    v_u_7._reConn = v_u_7._re.OnClientEvent:Connect(function(...)
        -- upvalues: (copy) p_u_4, (copy) v_u_7
        local v8 = table.pack(...)
        for _, v9 in p_u_4 do
            if not table.pack(v9(v8))[1] then
                return
            end
            v8.n = #v8
        end
        local v10 = v_u_7._signal
        local v11 = v8.n
        v10:Fire(table.unpack(v8, 1, v11))
    end)
    return v_u_7
end
function v_u_2._processOutboundMiddleware(p12, ...)
    local v13 = table.pack(...)
    for _, v14 in p12._outbound do
        local v15 = table.pack(v14(v13))
        if not v15[1] then
            local v16 = v15.n
            return table.unpack(v15, 2, v16)
        end
        v13.n = #v13
    end
    local v17 = v13.n
    return table.unpack(v13, 1, v17)
end
function v_u_2.Connect(p18, p19)
    if p18._directConnect then
        return p18._re.OnClientEvent:Connect(p19)
    else
        return p18._signal:Connect(p19)
    end
end
function v_u_2.Fire(p20, ...)
    if p20._hasOutbound then
        p20._re:FireServer(p20:_processOutboundMiddleware(...))
    else
        p20._re:FireServer(...)
    end
end
function v_u_2.Destroy(p21)
    if p21._signal then
        p21._signal:Destroy()
    end
end
return v_u_2