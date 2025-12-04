-- Decompiled game.ReplicatedStorage.Content.Mastery.Entities.Hidari

return require(script.Parent.Parent).new({
    ["Id"] = script.Name,
    ["Levels"] = {
        require(script.Level1),
        require(script.Level2),
        require(script.Level3),
        require(script.Level4),
        require(script.Level5)
    },
    ["OnCompletion"] = require(script.OnCompletion)
})