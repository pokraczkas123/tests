-- Decompiled game.ReplicatedStorage.Packages._Index.lucasmzreal_fastsignal@10.4.0.fastsignal.Immediate

local v1 = require(script.Parent.Deferred)
local v_u_2 = {}
for v3, v4 in pairs(v1) do
    v_u_2[v3] = v4
end
v_u_2.__index = v_u_2
local v_u_5 = nil
local function v_u_8(p6, ...)
    -- upvalues: (ref) v_u_5
    local v7 = v_u_5
    v_u_5 = nil
    p6(...)
    v_u_5 = v7
end
local function v_u_9()
    -- upvalues: (ref) v_u_5, (copy) v_u_8
    v_u_5 = coroutine.running()
    while true do
        v_u_8(coroutine.yield())
    end
end
function v_u_2.new()
    -- upvalues: (copy) v_u_2
    local v10 = v_u_2
    return setmetatable({
        ["_active"] = true,
        ["_head"] = nil
    }, v10)
end
function v_u_2.Is(p11)
    -- upvalues: (copy) v_u_2
    local v12
    if typeof(p11) == "table" then
        v12 = getmetatable(p11) == v_u_2
    else
        v12 = false
    end
    return v12
end
function v_u_2.Fire(p13, ...)
    -- upvalues: (ref) v_u_5, (copy) v_u_9
    local v14 = p13._head
    while v14 ~= nil do
        if v14._connection ~= nil then
            if v_u_5 == nil then
                task.spawn(v_u_9)
            end
            task.spawn(v_u_5, v14._handler, ...)
        end
        v14 = v14._next
    end
end
return v_u_2