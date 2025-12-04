-- Decompiled game.ReplicatedStorage.Content.Mastery.MasteryLevel

local v1 = game:GetService("ReplicatedStorage")
require(script.Parent.MasteryQuest)
require(v1.Content.Reward)
return {
    ["new"] = function(p2)
        local v3 = p2.Quests
        assert(v3, "Failed to create Mastery Level. Missing \'Quests\' field.")
        local v4 = p2.Reward
        assert(v4, "Failed to create Mastery Level. Missing \'Reward\' field.")
        return {
            ["Quests"] = p2.Quests,
            ["Reward"] = p2.Reward
        }
    end
}