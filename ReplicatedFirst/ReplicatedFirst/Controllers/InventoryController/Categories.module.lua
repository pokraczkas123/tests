-- Decompiled game.ReplicatedFirst.Controllers.InventoryController.Categories

local v_u_1 = Color3.fromRGB(255, 180, 6)
local v_u_2 = Color3.fromRGB(54, 0, 93)
local v_u_3 = Color3.fromRGB(212, 0, 255)
local v_u_4 = Color3.fromRGB(162, 0, 255)
local v5 = game:GetService("ReplicatedFirst")
local v6 = game:GetService("ReplicatedStorage")
local v_u_7 = require(v6.Tools.Utility).applyToAllTagged
local v_u_8 = require(script.Parent.SortOrders)
local v_u_9 = require(v5.Components.Button)
local v_u_10 = require(v6.Packages.Fusion)
return function(p_u_11)
    -- upvalues: (copy) v_u_7, (copy) v_u_9, (copy) v_u_10, (copy) v_u_1, (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_8
    v_u_7("InventoryTab", function(p_u_12)
        -- upvalues: (ref) v_u_9, (copy) p_u_11, (ref) v_u_10, (ref) v_u_1, (ref) v_u_2, (ref) v_u_3, (ref) v_u_4
        local v14 = {
            ["OnActivated"] = function()
                -- upvalues: (copy) p_u_12, (ref) p_u_11
                local v13 = p_u_12.Name
                if v13 ~= p_u_11.SelectedPage:get() then
                    p_u_11.SelectedPage:set((("%*"):format(v13)))
                end
            end
        }
        v_u_9(p_u_12)(v14)
        v_u_10.Hydrate(p_u_12.UIStroke)({
            ["Color"] = v_u_10.Computed(function()
                -- upvalues: (copy) p_u_12, (ref) p_u_11, (ref) v_u_1, (ref) v_u_2
                if p_u_12.Name == p_u_11.SelectedPage:get() then
                    return v_u_1
                else
                    return v_u_2
                end
            end)
        })
        v_u_10.Hydrate(p_u_12)({
            ["ImageColor3"] = v_u_10.Computed(function()
                -- upvalues: (copy) p_u_12, (ref) p_u_11, (ref) v_u_3, (ref) v_u_4
                if p_u_12.Name == p_u_11.SelectedPage:get() then
                    return v_u_3
                else
                    return v_u_4
                end
            end)
        })
    end)
    v_u_10.Hydrate(p_u_11.Component.Sort.Title)({
        ["Text"] = v_u_10.Computed(function()
            -- upvalues: (ref) v_u_8, (copy) p_u_11
            return ("Sort: %*"):format(v_u_8.SortModes[p_u_11.SortMode:get()])
        end)
    })
    local v19 = {
        ["OnActivated"] = function()
            -- upvalues: (copy) p_u_11, (ref) v_u_8
            local v15 = p_u_11.SortMode
            local v16 = p_u_11.SortMode:get() + 1
            local v17 = v_u_8.Types
            local v18 = 0
            for _ in pairs(v17) do
                v18 = v18 + 1
            end
            v15:set(v16 % v18 + 1)
        end
    }
    v_u_9(p_u_11.Component.Sort)(v19)
end