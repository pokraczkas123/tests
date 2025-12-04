-- Decompiled game.ReplicatedFirst.Controllers.ScoreEffectPreviewController.Group

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Packages.Fusion)
local v_u_4 = require(v1.Components.Button)
require(v2.Content.Item)
return function(p_u_5)
    -- upvalues: (copy) v_u_4, (copy) v_u_3
    local v6 = v_u_4(p_u_5.Header)({
        ["Name"] = ("%*_1"):format(p_u_5.DisplayName),
        ["OnActivated"] = function()
            -- upvalues: (copy) p_u_5
            p_u_5.Visible:set(not p_u_5.Visible:get())
        end,
        ["Visible"] = true,
        ["Parent"] = p_u_5.Parent
    })
    v6.Title.Text = p_u_5.DisplayName
    local v7 = v_u_3.Hydrate(p_u_5.Dropdown)({
        ["Name"] = ("%*_2"):format(p_u_5.DisplayName),
        ["Visible"] = p_u_5.Visible,
        ["Parent"] = p_u_5.Parent
    })
    v6.Icon.Image = p_u_5.RarestEffects[p_u_5.DisplayName].Icon
    return {
        ["Header"] = v6,
        ["Dropdown"] = v7,
        ["Visible"] = p_u_5.Visible
    }
end