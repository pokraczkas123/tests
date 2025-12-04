-- Decompiled game.ReplicatedStorage.Packages._Index.sleitnick_comm@1.0.1.comm.Client

local v_u_1 = require(script.Parent.Util)
require(script.Parent.Types)
local v_u_2 = require(script.Parent.Parent.Promise)
local v_u_3 = require(script.ClientRemoteSignal)
local v_u_4 = require(script.ClientRemoteProperty)
return {
    ["GetFunction"] = function(p5, p6, p7, p_u_8, p_u_9)
        -- upvalues: (copy) v_u_1, (copy) v_u_2
        local v10 = not v_u_1.IsServer
        assert(v10, "GetFunction must be called from the client")
        local v_u_11 = v_u_1.GetCommSubFolder(p5, "RF"):Expect("Failed to get Comm RF folder"):WaitForChild(p6, v_u_1.WaitForChildTimeout)
        local v12 = v_u_11 ~= nil
        local v13 = "Failed to find RemoteFunction: " .. p6
        assert(v12, v13)
        local v14
        if type(p_u_8) == "table" then
            v14 = #p_u_8 > 0
        else
            v14 = false
        end
        local v_u_15
        if type(p_u_9) == "table" then
            v_u_15 = #p_u_9 > 0
        else
            v_u_15 = false
        end
        local function v_u_21(p16)
            -- upvalues: (copy) p_u_9
            for _, v17 in ipairs(p_u_9) do
                local v18 = table.pack(v17(p16))
                if not v18[1] then
                    local v19 = v18.n
                    return table.unpack(v18, 2, v19)
                end
                p16.n = #p16
            end
            local v20 = p16.n
            return table.unpack(p16, 1, v20)
        end
        return v14 and (p7 and function(...)
            -- upvalues: (ref) v_u_2, (copy) v_u_15, (copy) v_u_11, (copy) v_u_21, (copy) p_u_8
            local v_u_22 = table.pack(...)
            return v_u_2.new(function(p23, p24)
                -- upvalues: (ref) v_u_15, (ref) v_u_11, (ref) v_u_21, (copy) v_u_22, (ref) p_u_8
                local v29, v30 = pcall(function()
                    -- upvalues: (ref) v_u_15, (ref) v_u_11, (ref) v_u_21, (ref) v_u_22
                    if v_u_15 then
                        return table.pack(v_u_11:InvokeServer(v_u_21(v_u_22)))
                    end
                    local v25 = table.pack
                    local v26 = v_u_11
                    local v27 = v_u_22
                    local v28 = v_u_22.n
                    return v25(v26:InvokeServer(table.unpack(v27, 1, v28)))
                end)
                if v29 then
                    for _, v31 in ipairs(p_u_8) do
                        local v32 = table.pack(v31(v30))
                        if not v32[1] then
                            local v33 = v32.n
                            return table.unpack(v32, 2, v33)
                        end
                        v30.n = #v30
                    end
                    local v34 = v30.n
                    p23(table.unpack(v30, 1, v34))
                else
                    p24(v30)
                end
            end)
        end or function(...)
            -- upvalues: (copy) v_u_15, (copy) v_u_11, (copy) v_u_21, (copy) p_u_8
            local v35
            if v_u_15 then
                v35 = table.pack(v_u_11:InvokeServer(v_u_21(table.pack(...))))
            else
                v35 = table.pack(v_u_11:InvokeServer(...))
            end
            for _, v36 in ipairs(p_u_8) do
                local v37 = table.pack(v36(v35))
                if not v37[1] then
                    local v38 = v37.n
                    return table.unpack(v37, 2, v38)
                end
                v35.n = #v35
            end
            local v39 = v35.n
            return table.unpack(v35, 1, v39)
        end) or p7 and function(...)
            -- upvalues: (ref) v_u_2, (copy) v_u_15, (copy) v_u_11, (copy) v_u_21
            local v_u_40 = table.pack(...)
            return v_u_2.new(function(p41, p42)
                -- upvalues: (ref) v_u_15, (ref) v_u_11, (ref) v_u_21, (copy) v_u_40
                local v47, v48 = pcall(function()
                    -- upvalues: (ref) v_u_15, (ref) v_u_11, (ref) v_u_21, (ref) v_u_40
                    if v_u_15 then
                        return table.pack(v_u_11:InvokeServer(v_u_21(v_u_40)))
                    end
                    local v43 = table.pack
                    local v44 = v_u_11
                    local v45 = v_u_40
                    local v46 = v_u_40.n
                    return v43(v44:InvokeServer(table.unpack(v45, 1, v46)))
                end)
                if v47 then
                    local v49 = v48.n
                    p41(table.unpack(v48, 1, v49))
                else
                    p42(v48)
                end
            end)
        end or v_u_15 and function(...)
            -- upvalues: (copy) v_u_11, (copy) v_u_21
            return v_u_11:InvokeServer(v_u_21(table.pack(...)))
        end or function(...)
            -- upvalues: (copy) v_u_11
            return v_u_11:InvokeServer(...)
        end
    end,
    ["GetSignal"] = function(p50, p51, p52, p53)
        -- upvalues: (copy) v_u_1, (copy) v_u_3
        local v54 = not v_u_1.IsServer
        assert(v54, "GetSignal must be called from the client")
        local v55 = v_u_1.GetCommSubFolder(p50, "RE"):Expect("Failed to get Comm RE folder"):WaitForChild(p51, v_u_1.WaitForChildTimeout)
        local v56 = v55 ~= nil
        local v57 = "Failed to find RemoteEvent: " .. p51
        assert(v56, v57)
        return v_u_3.new(v55, p52, p53)
    end,
    ["GetProperty"] = function(p58, p59, p60, p61)
        -- upvalues: (copy) v_u_1, (copy) v_u_4
        local v62 = not v_u_1.IsServer
        assert(v62, "GetProperty must be called from the client")
        local v63 = v_u_1.GetCommSubFolder(p58, "RP"):Expect("Failed to get Comm RP folder"):WaitForChild(p59, v_u_1.WaitForChildTimeout)
        local v64 = v63 ~= nil
        local v65 = "Failed to find RemoteEvent for RemoteProperty: " .. p59
        assert(v64, v65)
        return v_u_4.new(v63, p60, p61)
    end
}