-- Decompiled game.ReplicatedStorage.Packages._Index.sleitnick_comm@1.0.1.comm.Client.ClientRemoteProperty

local v_u_1 = require(script.Parent.Parent.Parent.Promise)
local v_u_2 = require(script.Parent.Parent.Parent.Signal)
local v_u_3 = require(script.Parent.ClientRemoteSignal)
require(script.Parent.Parent.Types)
local v_u_4 = {}
v_u_4.__index = v_u_4
function v_u_4.new(p5, p6, p7)
    -- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_2, (copy) v_u_1
    local v8 = v_u_4
    local v_u_9 = setmetatable({}, v8)
    v_u_9._rs = v_u_3.new(p5, p6, p7)
    v_u_9._ready = false
    v_u_9._value = nil
    v_u_9.Changed = v_u_2.new()
    v_u_9._rs:Fire()
    local v_u_10 = nil
    v_u_9._readyPromise = v_u_1.new(function(p11)
        -- upvalues: (ref) v_u_10
        v_u_10 = p11
    end)
    v_u_9._changed = v_u_9._rs:Connect(function(p12)
        -- upvalues: (copy) v_u_9, (ref) v_u_10
        local v13 = p12 ~= v_u_9._value
        v_u_9._value = p12
        if not v_u_9._ready then
            v_u_9._ready = true
            v_u_10(p12)
        end
        if v13 then
            v_u_9.Changed:Fire(p12)
        end
    end)
    return v_u_9
end
function v_u_4.Get(p14)
    return p14._value
end
function v_u_4.OnReady(p15)
    return p15._readyPromise
end
function v_u_4.IsReady(p16)
    return p16._ready
end
function v_u_4.Observe(p17, p18)
    if p17._ready then
        task.defer(p18, p17._value)
    end
    return p17.Changed:Connect(p18)
end
function v_u_4.Destroy(p19)
    p19._rs:Destroy()
    if p19._readyPromise then
        p19._readyPromise:cancel()
    end
    if p19._changed then
        p19._changed:Disconnect()
    end
    p19.Changed:Destroy()
end
return v_u_4