-- Decompiled game.ReplicatedStorage.Content.Mastery.Entities.Hakka

return require(script.Parent.Parent).new({
    ["Id"] = script.Name,
    ["DisplayName"] = "Hakka",
    ["Levels"] = {
        require(script.Level1),
        require(script.Level2),
        require(script.Level3),
        require(script.Level4),
        require(script.Level5)
    },
    ["OnAcquired"] = require(script.OnAquired)
})