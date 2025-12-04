-- Decompiled game.ReplicatedFirst.Controllers.MasteryController.Masteries

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Fusion)
require(v1.Content.Mastery)
require(v1.Content.Quest)
local v_u_3 = require(script.DisplayName)
local v_u_4 = require(script.Challenges)
require(script.Parent.Types)
local v_u_5 = require(script.Rewards)
local v_u_6 = require(script.Header)
return function(p_u_7)
    -- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_6, (copy) v_u_5, (copy) v_u_2
    v_u_4({
        ["Component"] = p_u_7.Component.Challenges,
        ["Quests"] = p_u_7.Quests,
        ["RawQuests"] = p_u_7.RawQuests,
        ["CurrentLevel"] = p_u_7.CurrentLevel
    })
    v_u_3({
        ["Component"] = p_u_7.Component.DisplayName
    })
    v_u_6({
        ["Component"] = p_u_7.Component.Header,
        ["PhaseProfile"] = p_u_7.PhaseProfile,
        ["RawQuests"] = p_u_7.RawQuests,
        ["CompletedQuests"] = p_u_7.CompletedQuests
    })
    v_u_5({
        ["Component"] = p_u_7.Component.Rewards,
        ["MasteryEntity"] = p_u_7.MasteryEntity,
        ["CompletedQuests"] = p_u_7.CompletedQuests,
        ["CurrentLevel"] = p_u_7.CurrentLevel
    })
    v_u_2.Hydrate(p_u_7.Component.LevelProgress)({
        ["Text"] = v_u_2.Computed(function()
            -- upvalues: (copy) p_u_7
            local v8 = "LEVEL %* / %*"
            local v9
            if p_u_7.HasCompletedMastery:get() then
                v9 = #p_u_7.MasteryEntity:get().Levels or 0
            else
                local v10 = p_u_7.CurrentLevel:get() - 1
                v9 = math.max(v10, 0)
            end
            return v8:format(v9, #p_u_7.MasteryEntity:get().Levels or 0)
        end)
    })
    return p_u_7.Component
end