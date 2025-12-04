-- Decompiled game.ReplicatedStorage.Content.Item.Classic2PlayerCard

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Classic",
    ["Rarity"] = v1.Rarity.Type.Common,
    ["Type"] = v1.Type.PlayerCard,
    ["Description"] = "The classic player card.",
    ["Asset"] = "rbxassetid://104225834719691"
}
local v4 = {
    ["LayoutOrder"] = 1,
    ["RenderId"] = "DefaultWithTeamColor",
    ["TeamImageMap"] = {
        ["Nekamo"] = "rbxassetid://134431584812161",
        ["Shurikorigawa"] = "rbxassetid://113911952225254",
        ["Fukorunadi"] = "rbxassetid://83647654399917",
        ["Inezariki"] = "rbxassetid://101748831738942",
        ["Kasuramo"] = "rbxassetid://104225834719691"
    },
    ["Color"] = Color3.new(1, 1, 1)
}
v3.Metadata = v4
return v2(v3)