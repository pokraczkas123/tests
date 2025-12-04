-- Decompiled game.ReplicatedFirst.Controllers.ShopController.Shop.story

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("ReplicatedFirst")
local v_u_3 = game:GetService("ServerScriptService")
local v_u_4 = require(v_u_1.Packages.Maid)
local v_u_5 = require(v_u_1.Packages.Fusion)
local v_u_6 = require(v_u_1.Tools.FusionControls)
local v_u_7 = require(script.Parent.MenuFrame)
local v_u_8 = require(v_u_1.Content.ShopBundle)
return {
    ["name"] = "MainShopFrame",
    ["controls"] = {},
    ["render"] = function(p9)
        -- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_2, (copy) v_u_1, (copy) v_u_3, (copy) v_u_5, (copy) v_u_8, (copy) v_u_7
        local v_u_10 = v_u_4.new()
        local _, v11 = v_u_6(p9)
        v_u_10:GiveTask(v11)
        local v12 = v_u_2.Assets.Interface.Lobby.Shop:Clone()
        v12.Parent = p9.target
        v_u_10:GiveTask(v12)
        local v13 = require(v_u_1.Content.Item)
        local v14 = require(v_u_1.Content.Reward)
        local v15 = require(v_u_3.Services.ShopService.StockShop.GenerateStockItemDatas)
        local v16 = require(v_u_3.Services.ShopService.StockShop.CustomStockRewards)
        local v17 = {}
        for _, v18 in v13:GetAll() do
            if v18.Metadata and v18.Metadata.StockShop then
                local v19 = v14.new({
                    ["Type"] = v14.Type.Item,
                    ["Value"] = v18.Id,
                    ["Metadata"] = v18.Metadata
                })
                table.insert(v17, v19)
            end
        end
        for _, v20 in v16 do
            table.insert(v17, v20)
        end
        local v21 = {}
        for v22, v23 in v15(0.5, 0.5, v17) do
            local v24 = v14.new
            local v25 = {
                ["Type"] = v23.Type,
                ["Value"] = v23.Value
            }
            local v26
            if v23.Type == v14.Type.Item then
                v26 = v13:Get(v23.Value).Metadata
            else
                v26 = nil
            end
            v25.Metadata = v26
            local v27 = v24(v25)
            v21[v22] = {
                ["Cost"] = v23.Cost,
                ["Discount"] = v23.Discount,
                ["Stock"] = v_u_5.Value(v23.Stock),
                ["TotalStock"] = v23.TotalStock,
                ["Reward"] = v27
            }
        end
        local v28 = {
            ["MenuFrame"] = v12
        }
        local v29 = {
            ["Statistics"] = {
                ["PremiumCurrency"] = v_u_5.Value(5000)
            },
            ["Passes"] = {
                ["IdsOwnedSet"] = v_u_5.Value({
                    [1019254559] = true
                })
            }
        }
        local v30 = {
            ["StockShop"] = {
                ["Items"] = v21,
                ["TimeRemaining"] = v_u_5.Value(0)
            },
            ["Bundles"] = {
                ["Current"] = v_u_5.Value({
                    v_u_8:Get("StarterBundle"),
                    v_u_8:Get("ValueBundle"),
                    v_u_8:Get("MasteriesBundle"),
                    v_u_8:Get("ProRankBundle"),
                    v_u_8:Get("SuperAbilityLuckBundle"),
                    v_u_8:Get("SuperStyleLuckBundle")
                }),
                ["History"] = v_u_5.Value({
                    ["ValueBundle"] = 1
                })
            }
        }
        v29.Shop = v30
        v29.Player = {
            ["Level"] = v_u_5.Value(20),
            ["ArePaidRandomItemsRestricted"] = true
        }
        v28.States = v29
        v_u_7.bootstrap(v28)
        return function()
            -- upvalues: (copy) v_u_10
            v_u_10:Destroy()
        end
    end
}