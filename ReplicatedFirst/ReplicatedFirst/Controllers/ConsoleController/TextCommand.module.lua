-- Decompiled game.ReplicatedFirst.Controllers.ConsoleController.TextCommand

local v_u_1 = game:GetService("TextChatService")
return function(p_u_2)
    -- upvalues: (copy) v_u_1
    local v3 = typeof(p_u_2) == "table"
    assert(v3, "TextCommand: props must be a table")
    local v4 = p_u_2.Prefix
    local v5 = typeof(v4) == "string"
    assert(v5, "TextCommand: props.Prefix must be a string")
    local v6 = p_u_2.Id
    local v7 = typeof(v6) == "string"
    assert(v7, "TextCommand: props.Id must be a string")
    local v8 = p_u_2.Aliases
    local v9 = typeof(v8) == "table"
    assert(v9, "TextCommand: props.Aliases must be a table")
    local v10 = #p_u_2.Aliases > 0
    assert(v10, "TextCommand: props.Aliases must have at least one alias")
    local v11 = p_u_2.Callback
    local v12 = typeof(v11) == "function"
    assert(v12, "TextCommand: props.Callback must be a function")
    local v13 = Instance.new("TextChatCommand")
    v13.Name = ("CSL%*"):format(p_u_2.Id)
    v13.PrimaryAlias = ("%*%*"):format(p_u_2.Prefix, p_u_2.Aliases[1])
    v13.SecondaryAlias = not p_u_2.Aliases[2] and "" or ("%*%*"):format(p_u_2.Prefix, p_u_2.Aliases[2])
    v13.Triggered:Connect(function(_, p14)
        -- upvalues: (copy) p_u_2
        p_u_2.Callback(p14)
    end)
    v13.Parent = v_u_1:WaitForChild("TextChatCommands")
    return v13
end