-- Decompiled game.ReplicatedStorage.Content.Special

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = require(v_u_1.Tools.Logger).new(script.Name)
require(v_u_1.Common.Context)
local v20 = {
    ["Type"] = {
        ["Action"] = "Action",
        ["Activation"] = "Activation",
        ["ActionActivatable"] = "ActionActivatable",
        ["Charge"] = "Charge",
        ["None"] = "None",
        ["Arrow"] = "Arrow"
    },
    ["Move"] = require(v_u_1.Common.Move).Type,
    ["new"] = function(p4)
        -- upvalues: (ref) v_u_2, (copy) v_u_1
        v_u_2 = v_u_2 or require(v_u_1.Common.SpecialLib)
        local v5 = p4.Id
        local v6 = type(v5) == "string"
        assert(v6, "Id must be a string")
        local v7 = p4.DisplayName
        local v8 = type(v7) == "string" and true or p4.DisplayName == nil
        assert(v8, "DisplayName must be a string or nil")
        local v9 = p4.Description
        local v10 = type(v9) == "table"
        assert(v10, "Description must be a table of strings")
        local v11 = {
            ["Id"] = p4.Id,
            ["Type"] = p4.Type,
            ["DisplayName"] = p4.DisplayName or p4.Id,
            ["Description"] = p4.Description,
            ["Move"] = p4.Move,
            ["ActionMove"] = p4.ActionMove,
            ["Icon"] = p4.Icon
        }
        local v12
        if p4.Rules then
            v12 = table.clone(p4.Rules)
        else
            v12 = nil
        end
        v11.Rules = v12
        v11.CanRun = p4.CanRun or v_u_2.canRun
        v11.PreAction = p4.PreAction
        v11.Action = p4.Action
        v11.PostAction = p4.PostAction
        v11.UpdateState = p4.UpdateState or v_u_2.updateState
        v11.Callback = p4.Callback
        return v11
    end,
    ["get"] = function(p13, p14)
        -- upvalues: (copy) v_u_3
        local v15 = script:FindFirstChild(p13)
        if v15 then
            local v16 = require(v15)
            local v17 = table.freeze
            local v18 = {
                ["Id"] = v16.Id,
                ["Type"] = v16.Type,
                ["DisplayName"] = v16.DisplayName,
                ["Description"] = v16.Description,
                ["Move"] = v16.Move,
                ["ActionMove"] = v16.ActionMove,
                ["Icon"] = v16.Icon,
                ["Metadata"] = p14 or {}
            }
            local v19
            if v16.Rules then
                v19 = table.clone(v16.Rules)
            else
                v19 = nil
            end
            v18.Rules = v19
            v18.CanRun = v16.CanRun
            v18.PreAction = v16.PreAction
            v18.Action = v16.Action
            v18.PostAction = v16.PostAction
            v18.UpdateState = v16.UpdateState
            v18.Callback = v16.Callback
            return v17(v18)
        end
        v_u_3:Warn((("Failed to get special. Special \'%*\' does not exist."):format(p13)))
    end
}
return v20