-- Decompiled game.ReplicatedStorage.Packages._Index.lucasmzreal_fastsignal@10.4.0.fastsignal.Docs

error("This is not supposed to run!")
local v_u_1 = {}
v_u_1.__index = v_u_1
local v2 = {}
v2.__index = v2
function v_u_1.new()
    return {}
end
function v_u_1.Is(_)
    return true
end
function v_u_1.IsActive(_)
    return true
end
function v_u_1.Connect(_, _) end
function v_u_1.Once(_, _) end
function v_u_1.Wait(_) end
function v_u_1.Fire(_, ...) end
function v_u_1.DisconnectAll(_) end
function v_u_1.Destroy(_) end
function v2.Disconnect(_) end
return {
    ["new"] = function()
        -- upvalues: (copy) v_u_1
        return v_u_1.new()
    end,
    ["Is"] = function(_)
        return true
    end
}