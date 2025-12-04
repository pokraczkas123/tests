-- Decompiled game.ReplicatedFirst.Controllers.InventoryController.Sell

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Packages.Fusion)
local v_u_4 = require(v2.Content.Item)
require(v2.Content.Rarity)
local v_u_5 = require(v2.Tools.Number)
local v_u_6 = require(v1.Components.DisplayItem)
local v_u_7 = require(v1.Components.Button)
local v_u_8 = require(v2.Packages.Knit)
return function(p_u_9)
    -- upvalues: (copy) v_u_8, (copy) v_u_3, (copy) v_u_4, (copy) v_u_7, (copy) v_u_5, (copy) v_u_6
    local v_u_10 = v_u_8.GetController("InterfaceController")
    local v_u_11 = v_u_8.GetService("InventoryService")
    local v_u_14 = v_u_3.Computed(function()
        -- upvalues: (copy) p_u_9, (ref) v_u_4
        local v12 = p_u_9.Selected:get()
        if not v12 then
            return {}
        end
        local v13 = v_u_4:Get(v12)
        if v13 then
            return {
                ["Name"] = v13.DisplayName,
                ["Rarity"] = v13.Rarity,
                ["Count"] = (p_u_9.ItemCount:get() or {})[v12] or 0,
                ["Description"] = v13.Description,
                ["BaseCost"] = v13.BaseCost
            }
        end
        warn("Failed to get item. Item \'%s\' does not exist.", v12)
        return {}
    end)
    v_u_7(p_u_9.Component.BGFrame.Body.YesBtn)({
        ["OnActivated"] = function()
            -- upvalues: (copy) v_u_11, (copy) p_u_9, (copy) v_u_10
            v_u_11:SellDuplicates(p_u_9.Selected:get())
            v_u_10:SelectLobbyMenu("Inventory")
        end
    })
    v_u_7(p_u_9.Component.BGFrame.Body.NoBtn)({
        ["OnActivated"] = function()
            -- upvalues: (copy) v_u_10
            v_u_10:SelectLobbyMenu("Inventory")
        end
    })
    v_u_7(p_u_9.Component.BGFrame.CloseBTN)({
        ["OnActivated"] = function()
            -- upvalues: (copy) v_u_10
            v_u_10:SelectLobbyMenu("Inventory")
        end
    })
    v_u_3.Hydrate(p_u_9.Component.BGFrame.Body.YesBtn.Text)({
        ["Text"] = v_u_3.Computed(function()
            -- upvalues: (copy) v_u_14, (ref) v_u_5, (copy) p_u_9, (ref) v_u_4
            return not v_u_14:get().BaseCost and "" or ("SELL FOR %* YEN"):format((v_u_5.format((p_u_9.Inventory:get()[p_u_9.Selected:get()] - 1) * v_u_14:get().BaseCost * v_u_4.Sell[v_u_14:get().Rarity])))
        end)
    })
    v_u_3.Hydrate(p_u_9.Component.BGFrame.Body.OriginalItem.Count)({
        ["Text"] = v_u_3.Computed(function()
            -- upvalues: (copy) v_u_14, (copy) p_u_9
            return not v_u_14:get().BaseCost and "" or ("x %*"):format(p_u_9.Inventory:get()[p_u_9.Selected:get()])
        end)
    })
    v_u_3.Hydrate(p_u_9.Component.BGFrame.Body.OriginalItem.ItemName)({
        ["Text"] = v_u_3.Computed(function()
            -- upvalues: (copy) v_u_14
            return v_u_14:get().Name
        end)
    })
    v_u_3.Hydrate(p_u_9.Component.BGFrame.Body.NewItem.ItemName)({
        ["Text"] = v_u_3.Computed(function()
            -- upvalues: (copy) v_u_14
            return v_u_14:get().Name
        end)
    })
    v_u_3.Hydrate(p_u_9.Component.BGFrame.Body.OriginalItem.Item)({
        [v_u_3.Children] = v_u_3.Computed(function()
            -- upvalues: (ref) v_u_6, (copy) p_u_9
            return v_u_6(p_u_9.Component.BGFrame.Body.OriginalItem.Item, p_u_9.Selected:get())
        end, v_u_3.cleanup)
    })
    v_u_3.Hydrate(p_u_9.Component.BGFrame.Body.NewItem.Item)({
        [v_u_3.Children] = v_u_3.Computed(function()
            -- upvalues: (ref) v_u_6, (copy) p_u_9
            return v_u_6(p_u_9.Component.BGFrame.Body.NewItem.Item, p_u_9.Selected:get())
        end, v_u_3.cleanup)
    })
end