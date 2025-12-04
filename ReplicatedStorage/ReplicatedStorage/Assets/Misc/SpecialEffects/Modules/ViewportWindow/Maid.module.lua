-- Decompiled game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.ViewportWindow.Maid

local v_u_5 = {
    ["function"] = function(p1)
        p1()
    end,
    ["RBXScriptConnection"] = function(p2)
        p2:Disconnect()
    end,
    ["Instance"] = function(p3)
        p3:Destroy()
    end,
    ["table"] = function(p4)
        p4:Destroy()
    end
}
local v_u_6 = {}
v_u_6.__index = v_u_6
v_u_6.ClassName = "Maid"
function v_u_6.new(...)
    -- upvalues: (copy) v_u_6
    local v7 = v_u_6
    local v8 = setmetatable({}, v7)
    v8.Trash = {}
    for _, v9 in pairs({ ... }) do
        v8:Mark(v9)
    end
    return v8
end
function v_u_6.Mark(p10, p11)
    -- upvalues: (copy) v_u_5
    local v12 = typeof(p11)
    if v_u_5[v12] then
        p10.Trash[p11] = v12
    else
        error(("Maid does not support type \"%s\""):format(v12), 2)
    end
end
function v_u_6.Unmark(p13, p14)
    if p14 then
        p13.Trash[p14] = nil
    else
        p13.Trash = {}
    end
end
function v_u_6.Sweep(p15)
    -- upvalues: (copy) v_u_5
    for v16, v17 in pairs(p15.Trash) do
        v_u_5[v17](v16)
    end
    p15.Trash = {}
end
v_u_6.Destroy = v_u_6.Sweep
return v_u_6