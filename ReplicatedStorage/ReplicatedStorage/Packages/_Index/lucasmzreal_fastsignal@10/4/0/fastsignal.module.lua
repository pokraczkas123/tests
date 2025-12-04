-- Decompiled game.ReplicatedStorage.Packages._Index.lucasmzreal_fastsignal@10.4.0.fastsignal

local v1 = Instance.new("BindableEvent")
local v_u_2 = false
v1.Event:Connect(function()
    -- upvalues: (ref) v_u_2
    v_u_2 = true
end)
v1:Fire()
v1:Destroy()
return (v_u_2 == false and true or false) and require(script.Deferred) or require(script.Immediate)