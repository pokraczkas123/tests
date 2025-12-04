-- Decompiled game.ReplicatedStorage.Packages._Index.sleitnick_comm@1.0.1.comm.Server

local v_u_1 = require(script.RemoteProperty)
local v_u_2 = require(script.RemoteSignal)
require(script.Parent.Types)
local v_u_3 = require(script.Parent.Util)
local v_u_61 = {
    ["BindFunction"] = function(p4, p5, p_u_6, p_u_7, p_u_8)
        -- upvalues: (copy) v_u_3
        local v9 = v_u_3.IsServer
        assert(v9, "BindFunction must be called from the server")
        local v10 = v_u_3.GetCommSubFolder(p4, "RF"):Expect("Failed to get Comm RF folder")
        local v11 = Instance.new("RemoteFunction")
        v11.Name = p5
        local v12
        if type(p_u_7) == "table" then
            v12 = #p_u_7 > 0
        else
            v12 = false
        end
        local v13
        if type(p_u_8) == "table" then
            v13 = #p_u_8 > 0
        else
            v13 = false
        end
        local function v_u_20(p14, ...)
            -- upvalues: (copy) p_u_8
            local v15 = table.pack(...)
            for _, v16 in ipairs(p_u_8) do
                local v17 = table.pack(v16(p14, v15))
                if not v17[1] then
                    local v18 = v17.n
                    return table.unpack(v17, 2, v18)
                end
                v15.n = #v15
            end
            local v19 = v15.n
            return table.unpack(v15, 1, v19)
        end
        if v12 and v13 then
            function v11.OnServerInvoke(p21, ...)
                -- upvalues: (copy) p_u_7, (copy) v_u_20, (copy) p_u_6
                local v22 = table.pack(...)
                for _, v23 in ipairs(p_u_7) do
                    local v24 = table.pack(v23(p21, v22))
                    if not v24[1] then
                        local v25 = v24.n
                        return table.unpack(v24, 2, v25)
                    end
                    v22.n = #v22
                end
                local v26 = v_u_20
                local v27 = p_u_6
                local v28 = v22.n
                return v26(p21, v27(p21, table.unpack(v22, 1, v28)))
            end
        elseif v12 then
            function v11.OnServerInvoke(p29, ...)
                -- upvalues: (copy) p_u_7, (copy) p_u_6
                local v30 = table.pack(...)
                for _, v31 in ipairs(p_u_7) do
                    local v32 = table.pack(v31(p29, v30))
                    if not v32[1] then
                        local v33 = v32.n
                        return table.unpack(v32, 2, v33)
                    end
                    v30.n = #v30
                end
                local v34 = p_u_6
                local v35 = v30.n
                return v34(p29, table.unpack(v30, 1, v35))
            end
        elseif v13 then
            function v11.OnServerInvoke(p36, ...)
                -- upvalues: (copy) v_u_20, (copy) p_u_6
                return v_u_20(p36, p_u_6(p36, ...))
            end
        else
            v11.OnServerInvoke = p_u_6
        end
        v11.Parent = v10
        return v11
    end,
    ["WrapMethod"] = function(p37, p_u_38, p39, p40, p41)
        -- upvalues: (copy) v_u_3, (copy) v_u_61
        local v42 = v_u_3.IsServer
        assert(v42, "WrapMethod must be called from the server")
        local v_u_43 = p_u_38[p39]
        local v44 = type(v_u_43) == "function"
        local v45 = type(v_u_43)
        local v46 = "Value at index " .. p39 .. " must be a function; got " .. v45
        assert(v44, v46)
        return v_u_61.BindFunction(p37, p39, function(...)
            -- upvalues: (copy) v_u_43, (copy) p_u_38
            return v_u_43(p_u_38, ...)
        end, p40, p41)
    end,
    ["CreateSignal"] = function(p47, p48, p49, p50, p51)
        -- upvalues: (copy) v_u_3, (copy) v_u_2
        local v52 = v_u_3.IsServer
        assert(v52, "CreateSignal must be called from the server")
        local v53 = v_u_3.GetCommSubFolder(p47, "RE"):Expect("Failed to get Comm RE folder")
        return v_u_2.new(v53, p48, p49, p50, p51)
    end,
    ["CreateProperty"] = function(p54, p55, p56, p57, p58)
        -- upvalues: (copy) v_u_3, (copy) v_u_1
        local v59 = v_u_3.IsServer
        assert(v59, "CreateProperty must be called from the server")
        local v60 = v_u_3.GetCommSubFolder(p54, "RP"):Expect("Failed to get Comm RP folder")
        return v_u_1.new(v60, p55, p56, p57, p58)
    end
}
return v_u_61