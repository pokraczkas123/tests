-- Decompiled game.ReplicatedStorage.Packages._Index.nightcycle_maid@2.2.2.maid.Maid

local v_u_1 = require(script.Parent:WaitForChild("MaidTaskUtils"))
local v_u_22 = {
    ["ClassName"] = "Maid",
    ["new"] = function()
        -- upvalues: (copy) v_u_22
        local v2 = v_u_22
        return setmetatable({
            ["IsAlive"] = true,
            ["_tasks"] = {}
        }, v2)
    end,
    ["__index"] = function(p3, p4)
        -- upvalues: (copy) v_u_22
        if p4 == "IsAlive" then
            return rawget(p3, "IsAlive")
        elseif v_u_22[p4] then
            return v_u_22[p4]
        else
            return p3._tasks[p4]
        end
    end,
    ["__newindex"] = function(p5, p6, p7)
        -- upvalues: (copy) v_u_22, (copy) v_u_1
        if v_u_22[p6] ~= nil then
            error(("\'%s\' is reserved"):format((tostring(p6))), 2)
        end
        local v8 = p5._tasks
        local v9 = v8[p6]
        if v9 ~= p7 then
            v8[p6] = p7
            if v9 then
                v_u_1.doTask(v9, p6)
            end
        end
    end,
    ["_GiveTask"] = function(p10, p11)
        if not rawget(p10, "IsAlive") then
            error("Maid is dead and cannot accept new tasks", 2)
        end
        if not p11 then
            error("Task cannot be false or nil", 2)
        end
        local v12 = #p10._tasks + 1
        p10[v12] = p11
        if type(p11) == "table" and not p11.Destroy then
            warn("[Maid.GiveTask] - Gave table task without .Destroy\n\n" .. debug.traceback())
        end
        return v12
    end,
    ["GiveTask"] = function(p13, p14)
        p13:_GiveTask(p14)
        return p14
    end,
    ["DoCleaning"] = function(p15)
        -- upvalues: (copy) v_u_1
        local v16 = p15._tasks
        for v17, v18 in pairs(v16) do
            if typeof(v18) == "RBXScriptConnection" then
                v16[v17] = nil
                v18:Disconnect()
            end
        end
        local v19, v20 = next(v16)
        while v20 ~= nil do
            if v19 ~= nil then
                v16[v19] = nil
            end
            v_u_1.doTask(v20, v19)
            v19, v20 = next(v16)
        end
        return nil
    end,
    ["Destroy"] = function(p21)
        if not rawget(p21, "IsAlive") then
            error("Maid is already dead", 2)
        end
        rawset(p21, "IsAlive", false)
        p21:DoCleaning()
    end
}
return v_u_22