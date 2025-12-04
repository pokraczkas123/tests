-- Decompiled game.ReplicatedFirst.Controllers.InventoryController

local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedFirst")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = nil
local v_u_5 = nil
local v_u_6 = nil
local v_u_7 = nil
local v_u_8 = require(v3.Packages.Knit)
local v_u_9 = require(v3.Packages.Fusion)
local v_u_10 = require(v2.Components.Button)
local v_u_11 = require(v3.Content.Item)
local v_u_12 = require(script.SortOrders)
local v_u_13 = require(script.Categories)
local v_u_14 = require(script.Inventory)
local v_u_15 = require(script.Info)
local v_u_16 = require(script.Sell)
local v17 = v_u_8.CreateController({
    ["Name"] = "InventoryController",
    ["Player"] = v1.LocalPlayer
})
function v17.KnitInit(_)
    -- upvalues: (ref) v_u_4, (copy) v_u_8, (ref) v_u_5, (ref) v_u_7
    v_u_4 = v_u_8.GetService("DataService")
    v_u_5 = v_u_8.GetService("ItemCountService")
    v_u_7 = v_u_8.GetService("InventoryService")
end
function v17.KnitStart(p18)
    -- upvalues: (ref) v_u_6, (copy) v_u_8, (copy) v_u_9, (copy) v_u_11, (copy) v_u_12, (copy) v_u_15, (copy) v_u_14, (copy) v_u_16, (copy) v_u_13
    v_u_6 = v_u_8.GetController("InterfaceController")
    if not v_u_6.IsMatchmaking then
        p18.Inventory = p18:BindToInventoryAsync()
        p18.ItemCount = p18:BindToItemCountAsync()
        p18.Equipped = p18:BindToEquippedAsync()
        p18.Selected = v_u_9.Value(p18.Equipped:get().Ball or "ClassicBall")
        p18.SelectedPage = v_u_9.Value((("%*"):format(v_u_11.Type.Ball)))
        p18.SortMode = v_u_9.Value(v_u_12.Types.Rarity)
        p18.Component = p18:LoadComponent()
        v_u_15({
            ["Component"] = p18.Component.BGFrame.Body.Default.InfoContainer,
            ["Selected"] = p18.Selected,
            ["ItemCount"] = p18.ItemCount,
            ["Equipped"] = p18.Equipped,
            ["Inventory"] = p18.Inventory
        })
        v_u_14({
            ["Component"] = p18.Component.BGFrame.Body,
            ["Inventory"] = p18.Inventory,
            ["ItemCount"] = p18.ItemCount,
            ["Selected"] = p18.Selected,
            ["Equipped"] = p18.Equipped,
            ["SelectedPage"] = p18.SelectedPage,
            ["SortMode"] = p18.SortMode
        })
        v_u_16({
            ["Component"] = v_u_6.App.Lobby.SellDuplicates,
            ["Selected"] = p18.Selected,
            ["ItemCount"] = p18.ItemCount,
            ["Equipped"] = p18.Equipped,
            ["Inventory"] = p18.Inventory
        })
        v_u_13({
            ["Component"] = p18.Component.Categories,
            ["SelectedPage"] = p18.SelectedPage,
            ["SortMode"] = p18.SortMode
        })
    end
end
function v17.BindToInventoryAsync(p19)
    -- upvalues: (copy) v_u_9, (ref) v_u_4, (ref) v_u_7
    if p19.Inventory then
        return p19.Inventory
    end
    local v_u_20 = v_u_9.Value(v_u_4:Get("Inventory"):expect())
    v_u_7.InventoryChanged:Connect(function(p21, p22)
        -- upvalues: (copy) v_u_20
        local v23 = v_u_20:get() or {}
        v23[p21] = p22
        v_u_20:set(v23)
    end)
    return v_u_20
end
function v17.BindToItemCountAsync(p24)
    -- upvalues: (copy) v_u_9, (ref) v_u_5
    if p24.ItemCount then
        return p24.ItemCount
    end
    local v_u_25 = v_u_9.Value({})
    v_u_5.ItemCounts:Observe(function(p26)
        -- upvalues: (copy) v_u_25
        v_u_25:set(p26)
    end)
    return v_u_25
end
function v17.BindToEquippedAsync(_)
    -- upvalues: (copy) v_u_9, (ref) v_u_4
    local v_u_27 = v_u_9.Value(v_u_4:Get("Equipped"):expect())
    v_u_4.ProfileUpdated:Connect(function(p28, p29)
        -- upvalues: (copy) v_u_27
        if p28 == "Equipped" then
            v_u_27:set(p29)
        end
    end)
    return v_u_27
end
function v17.LoadComponent(_)
    -- upvalues: (ref) v_u_6, (copy) v_u_10
    local v30 = v_u_6.App.Lobby.Inventory
    local v31 = {
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_6
            v_u_6:SelectLobbyMenu("Inventory", true)
        end
    }
    v_u_10(v30.BGFrame.CloseBtn)(v31)
    return v30
end
return v17