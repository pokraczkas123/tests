-- Decompiled game.ReplicatedFirst.Controllers.ConsoleController.Command

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Packages.Fusion)
local v_u_4 = require(v1.Components.Button)
return function(p_u_5)
    -- upvalues: (copy) v_u_4, (copy) v_u_3
    local v6 = p_u_5.Component
    v6.Name = p_u_5.Id
    v6.Visible = true
    local v7 = v_u_4(v6.Header)({
        ["Scale"] = {
            ["Base"] = 1,
            ["Hover"] = 1,
            ["Down"] = 1.1
        },
        ["OnActivated"] = function()
            -- upvalues: (copy) p_u_5
            p_u_5.Selected:set(p_u_5.Selected:get() == p_u_5.Id and "" or p_u_5.Id)
        end
    })
    v_u_3.Hydrate(v7.CaretContainer.Caret)({
        ["Rotation"] = v_u_3.Spring(v_u_3.Computed(function()
            -- upvalues: (copy) p_u_5
            return p_u_5.Selected:get() == p_u_5.Id and 90 or 0
        end), 40, 0.4)
    })
    v7.Command.Text = ("%*%*%* %*"):format(p_u_5.IsLocked and "\240\159\148\146 " or "", p_u_5.Prefix, p_u_5.Aliases[1], (not p_u_5.Arguments or #p_u_5.Arguments <= 0) and "" or table.concat(p_u_5.Arguments, " "))
    local v8 = v_u_3.Hydrate(v6.Body)({
        ["Visible"] = v_u_3.Computed(function()
            -- upvalues: (copy) p_u_5
            return p_u_5.Selected:get() == p_u_5.Id
        end)
    })
    v8.Description.Text = ("\240\159\147\132 %*"):format(p_u_5.Description)
    v8.Aliases.Text = ("\240\159\143\183\239\184\143 %*"):format((table.concat(p_u_5.Aliases, ", ")))
    v8.Aliases.Visible = #p_u_5.Aliases > 1
    v8.Permissions.Text = ("\240\159\148\145 %*"):format((table.concat(p_u_5.Permission, ", ")))
    return v6
end