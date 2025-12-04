-- Decompiled game.ReplicatedFirst.Controllers.ShopController.StatesFromServer.Shop

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = nil
local v_u_4 = nil
local v_u_5 = require(v1.Content.Shop)
local v_u_6 = require(v1.Content.ShopBundle)
local v_u_7 = require(v1.Packages.Knit)
local v_u_8 = require(v1.Packages.Fusion)
local v_u_9 = require(v1.Content.Reward)
local v_u_10 = require(v1.Content.Item)
require(script.Parent.Parent.MenuFrame.Types)
return function()
    -- upvalues: (ref) v_u_2, (copy) v_u_7, (ref) v_u_3, (ref) v_u_4, (copy) v_u_8, (copy) v_u_6, (copy) v_u_9, (copy) v_u_10, (copy) v_u_5
    v_u_2 = v_u_2 or v_u_7.GetService("DataService")
    v_u_3 = v_u_3 or v_u_7.GetService("ShopService")
    v_u_4 = v_u_4 or v_u_7.GetController("InterfaceController")
    local v_u_11 = v_u_8.Value(1763849110)
    local v_u_12 = {
        ["Bundles"] = {
            ["Current"] = v_u_8.Value({}),
            ["History"] = v_u_8.Value({})
        },
        ["StockShop"] = {
            ["TimeRemaining"] = v_u_8.Computed(function()
                -- upvalues: (copy) v_u_11, (ref) v_u_4
                return v_u_11:get() - v_u_4.DynamicTimestamp:get()
            end),
            ["Items"] = v_u_8.Value({})
        }
    }
    local v_u_13 = nil
    local function v_u_26(p14)
        -- upvalues: (ref) v_u_6, (copy) v_u_12, (ref) v_u_9, (ref) v_u_10, (ref) v_u_8, (copy) v_u_11, (ref) v_u_13, (ref) v_u_4, (ref) v_u_3, (ref) v_u_5
        local v15 = {}
        for _, v16 in p14.Bundles.Current do
            local v17 = v_u_6:Get(v16)
            if v17 then
                table.insert(v15, v17)
            else
                warn((("ShopController:ShopStatesFromServer: fullUpdate - invalid bundle id %*"):format(v16)))
            end
        end
        v_u_12.Bundles.Current:set(v15)
        v_u_12.Bundles.History:set(p14.Bundles.History)
        local v18 = {}
        for v19, v20 in p14.StockShop.Items do
            local v21 = v_u_9.new
            local v22 = {
                ["Type"] = v20.Type,
                ["Value"] = v20.Value
            }
            local v23
            if v20.Type == v_u_9.Type.Item then
                v23 = v_u_10:Get(v20.Value).Metadata
            else
                v23 = nil
            end
            v22.Metadata = v23
            local v24 = v21(v22)
            v18[v19] = {
                ["Cost"] = v20.Cost,
                ["Discount"] = v20.Discount,
                ["Stock"] = v_u_8.Value(v20.Stock),
                ["TotalStock"] = v20.TotalStock,
                ["Reward"] = v24
            }
        end
        v_u_12.StockShop.Items:set(v18)
        v_u_11:set(p14.StockShop.RefreshTimestamp)
        if v_u_13 then
            task.cancel(v_u_13)
        end
        local v25 = p14.StockShop.RefreshTimestamp - v_u_4.DynamicTimestamp:get()
        v_u_13 = task.delay(v25 + 1, function()
            -- upvalues: (ref) v_u_3, (ref) v_u_5
            v_u_3:Refresh(v_u_5.Source.StockShop)
        end)
    end
    v_u_2.ProfileUpdated:Connect(function(p27, p28)
        -- upvalues: (copy) v_u_26
        if p27 == "Shop" then
            v_u_26(p28)
        end
    end)
    task.defer(function()
        -- upvalues: (copy) v_u_26, (ref) v_u_2
        v_u_26(v_u_2:Get("Shop"):expect())
    end)
    return v_u_12
end