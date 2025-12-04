-- Decompiled game.ReplicatedFirst.Controllers.ScoreEffectPreviewController.PreviewTemplate

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Packages.Fusion)
local v_u_4 = require(v1.Components.Button)
local v_u_5 = require(v2.Content.Item)
return function(p_u_6)
    -- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_4
    local v_u_7 = v_u_5:Get(p_u_6.Item.Id)
    local v8 = v_u_3.Hydrate(p_u_6.Template)({
        ["Visible"] = true,
        ["LayoutOrder"] = v_u_7.Rarity,
        ["Name"] = v_u_7.Id
    })
    local v9 = v_u_4(v8.Button)({
        ["OnActivated"] = function()
            -- upvalues: (copy) v_u_7, (copy) p_u_6
            if v_u_7 then
                p_u_6.ScoreEffect:Preview(v_u_7.Id)
            end
        end,
        ["ImageColor3"] = v_u_5.Rarity.Data[v_u_7.Rarity].Color
    })
    v_u_3.Hydrate(v9.Lock)({
        ["Visible"] = v_u_3.Computed(function()
            -- upvalues: (copy) p_u_6, (copy) v_u_7
            return p_u_6.Inventory:get()[v_u_7.Id] == nil
        end)
    })
    v9.Info.Text = v_u_7.DisplayName
    v_u_3.Hydrate(v9)({
        ["ImageColor3"] = v_u_5.Rarity.Data[v_u_7.Rarity].Color
    })
    v_u_3.Hydrate(v9.ItemDisplay.ImageLabel)({
        ["ImageColor3"] = v_u_3.Computed(function()
            -- upvalues: (copy) p_u_6, (copy) v_u_7
            if p_u_6.Inventory:get()[v_u_7.Id] == nil then
                return Color3.new(0.5, 0.5, 0.5)
            else
                return Color3.new(1, 1, 1)
            end
        end),
        ["Image"] = v_u_7.Icon
    })
    return v8
end