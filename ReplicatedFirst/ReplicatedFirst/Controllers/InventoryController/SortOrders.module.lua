-- Decompiled game.ReplicatedFirst.Controllers.InventoryController.SortOrders

local v1 = {
    ["Rarity"] = 1,
    ["Name"] = 2,
    ["Amount"] = 3
}
local v2 = {
    ["Types"] = v1,
    ["SortModes"] = {
        [v1.Rarity] = "Rarity",
        [v1.Name] = "Name",
        [v1.Amount] = "Amount"
    }
}
return v2