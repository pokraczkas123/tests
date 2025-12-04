-- Decompiled game.ReplicatedStorage.Content.Item.Classic1PlayerCard

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Classic",
    ["Rarity"] = v1.Rarity.Type.Common,
    ["Type"] = v1.Type.PlayerCard,
    ["Description"] = "The classic player card.",
    ["Asset"] = "rbxassetid://88837527755661"
}
local v4 = {
    ["LayoutOrder"] = 0,
    ["RenderId"] = "DefaultWithTeamColor",
    ["TeamImageMap"] = {
        ["Nekamo"] = "rbxassetid://105531924932870",
        ["Shurikorigawa"] = "rbxassetid://133246210217986",
        ["Fukorunadi"] = "rbxassetid://86416955353959",
        ["Inezariki"] = "rbxassetid://91346037101378",
        ["Kasuramo"] = "rbxassetid://88837527755661"
    },
    ["Color"] = Color3.new(1, 1, 1)
}
v3.Metadata = v4
return v2(v3)