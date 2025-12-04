-- Decompiled game.ReplicatedStorage.Packages._Index.nightcycle_maid@2.2.2.maid.MaidTaskUtils

local v_u_19 = {
    ["isValidTask"] = function(p1)
        local v2
        if type(p1) == "function" or typeof(p1) == "RBXScriptConnection" or typeof(p1) == "Instance" or typeof(p1) == "Object" then
            v2 = true
        elseif type(p1) == "table" then
            local v3 = p1.Destroy
            if type(v3) == "function" then
                v2 = true
            else
                local v4 = p1.Disconnect
                v2 = type(v4) == "function"
            end
        else
            v2 = false
        end
        return v2
    end,
    ["doTask"] = function(p_u_5, p6)
        if type(p_u_5) == "function" then
            p_u_5()
        elseif typeof(p_u_5) == "RBXScriptConnection" then
            p_u_5:Disconnect()
        else
            if typeof(p_u_5) ~= "Instance" and typeof(p_u_5) ~= "Object" then
                if type(p_u_5) == "table" then
                    local v7 = p_u_5.Destroy
                    if type(v7) == "function" then
                        p_u_5:Destroy()
                        goto l3
                    end
                end
                if type(p_u_5) == "table" then
                    local v8 = p_u_5.Disconnect
                    if type(v8) == "function" then
                        p_u_5:Disconnect()
                        goto l3
                    end
                end
                print("Job info:", (typeof(p_u_5)))
                print("Key", p6)
                if typeof(p_u_5) == "table" then
                    for v9, v10 in pairs(p_u_5) do
                        local v11 = print
                        local v12 = tostring(v9)
                        local v13 = tostring(v10)
                        v11("\t" .. v12 .. ": " .. v13)
                    end
                end
                error("Bad job")
                goto l3
            end
            local _, v14 = pcall(function()
                -- upvalues: (copy) p_u_5
                p_u_5.Parent = p_u_5
            end)
            if not v14:match("locked") then
                pcall(function()
                    -- upvalues: (copy) p_u_5
                    p_u_5:Destroy()
                end)
            end
        end
        ::l3::
        return nil
    end,
    ["delayed"] = function(p_u_15, p_u_16)
        -- upvalues: (copy) v_u_19
        local v17 = type(p_u_15) == "number"
        assert(v17, "Bad time")
        local v18 = v_u_19.isValidTask(p_u_16)
        assert(v18, "Bad job")
        return function()
            -- upvalues: (copy) p_u_15, (ref) v_u_19, (copy) p_u_16
            task.delay(p_u_15, function()
                -- upvalues: (ref) v_u_19, (ref) p_u_16
                v_u_19.doTask(p_u_16)
            end)
        end
    end
}
return v_u_19