-- Decompiled game.ReplicatedStorage.Content.Season

local v1 = game:GetService("ReplicatedStorage")
require(v1.Content.Quest)
require(v1.Content.Reward)
local v2 = require(v1.Configuration.Ranks)
require(v1.Content.Crate)
local v_u_3 = require(v1.Tools.Timestamp)
local v_u_4 = {
    ["Ranks"] = v2
}
v_u_4.__index = v_u_4
function v_u_4.new(p5)
    -- upvalues: (copy) v_u_4
    local v6 = type(p5) == "table"
    local v7 = "Expected table for argument 1, got " .. typeof(p5)
    assert(v6, v7)
    local v8 = p5.Id
    local v9 = type(v8) == "string"
    local v10 = p5.Id
    local v11 = "Expected string for Id, got " .. typeof(v10)
    assert(v9, v11)
    local v12 = p5.DisplayName
    local v13 = type(v12) == "string"
    local v14 = p5.DisplayName
    local v15 = "Expected string for DisplayName, got " .. typeof(v14)
    assert(v13, v15)
    local v16 = p5.Currency
    local v17 = type(v16) == "table"
    local v18 = p5.Currency
    local v19 = "Expected table for Currency, got " .. typeof(v18)
    assert(v17, v19)
    local v20 = p5.Currency.DisplayName
    local v21 = type(v20) == "string"
    local v22 = p5.Currency.DisplayName
    local v23 = "Expected string for Currency.DisplayName, got " .. typeof(v22)
    assert(v21, v23)
    local v24 = p5.Currency.Icon
    local v25 = type(v24) == "string"
    local v26 = p5.Currency.Icon
    local v27 = "Expected string for Currency.Icon, got " .. typeof(v26)
    assert(v25, v27)
    local v28 = p5.Timestamp
    local v29 = type(v28) == "table"
    local v30 = p5.Timestamp
    local v31 = "Expected table for Timestamp, got " .. typeof(v30)
    assert(v29, v31)
    local v32 = p5.Timestamp.Start
    local v33 = type(v32) == "number"
    local v34 = p5.Timestamp.Start
    local v35 = "Expected number for Timestamp.Start, got " .. typeof(v34)
    assert(v33, v35)
    local v36 = p5.Timestamp.End
    local v37 = type(v36) == "number"
    local v38 = p5.Timestamp.End
    local v39 = "Expected number for Timestamp.End, got " .. typeof(v38)
    assert(v37, v39)
    local v40 = p5.SeasonPass
    local v41
    if type(v40) == "table" then
        v41 = true
    else
        local v42 = p5.SeasonPass
        v41 = type(v42) == "nil"
    end
    local v43 = p5.SeasonPass
    local v44 = "Expected table or nil for SeasonPass, got " .. typeof(v43)
    assert(v41, v44)
    local v45 = p5.Rewards
    local v46 = type(v45) == "table"
    local v47 = p5.Rewards
    local v48 = "Expected table for Rewards, got " .. typeof(v47)
    assert(v46, v48)
    local v49 = p5.Rewards.Regular
    local v50 = type(v49) == "table"
    local v51 = p5.Rewards.Regular
    local v52 = "Expected table for Rewards.Regular, got " .. typeof(v51)
    assert(v50, v52)
    local v53 = p5.Rewards.Premium
    local v54 = type(v53) == "table"
    local v55 = p5.Rewards.Premium
    local v56 = "Expected table for Rewards.Premium, got " .. typeof(v55)
    assert(v54, v56)
    local v57 = p5.RankedRewards
    local v58 = type(v57) == "table"
    local v59 = p5.RankedRewards
    local v60 = "Expected table for RankedRewards, got " .. typeof(v59)
    assert(v58, v60)
    local v61 = p5.Crate
    local v62 = type(v61) == "table"
    local v63 = p5.Crate
    local v64 = "Expected table for Crate, got " .. typeof(v63)
    assert(v62, v64)
    local v65 = p5.ExperiencePerTier
    local v66 = type(v65) == "number"
    local v67 = p5.ExperiencePerTier
    local v68 = "Expected number for ExperiencePerTier, got " .. typeof(v67)
    assert(v66, v68)
    local v69 = p5.Quests
    local v70 = type(v69) == "table"
    local v71 = p5.Quests
    local v72 = "Expected table for Quests, got " .. typeof(v71)
    assert(v70, v72)
    local v73 = #p5.Rewards.Premium == #p5.Rewards.Regular
    assert(v73, "Expected equal length for Rewards.Premium and Rewards.Regular")
    local v74
    if p5.Rebirth == nil then
        v74 = true
    else
        local v75 = p5.Rebirth
        v74 = type(v75) == "table"
    end
    local v76 = p5.Rebirth
    local v77 = "Expected table or nil for Rebirth, got " .. typeof(v76)
    assert(v74, v77)
    local v78 = v_u_4
    return table.freeze((setmetatable(p5, v78)))
end
function v_u_4.get(p79)
    local v80 = script:FindFirstChild(p79)
    if v80 then
        return require(v80)
    end
end
function v_u_4.getCurrent()
    -- upvalues: (copy) v_u_4
    if v_u_4._current then
        return v_u_4._current
    end
    local v81 = 0
    for _, v82 in ipairs(script:GetChildren()) do
        local v83 = v82.Name
        local v84 = tonumber(v83)
        v81 = math.max(v81, v84)
    end
    v_u_4._current = require(script:FindFirstChild((tostring(v81))))
    return v_u_4._current
end
function v_u_4.GetTierFromExperience(p85, p86, p87)
    local v88 = p85.ExperiencePerTier * #p85.Rewards.Regular
    local v89 = p85:GetExperience(p86, p87)
    local v90 = math.clamp(v89, 0, v88) / p85.ExperiencePerTier
    return math.floor(v90)
end
function v_u_4.GetExperience(p91, p92, p93)
    local v94 = p91.ExperiencePerTier * #p91.Rewards.Regular
    if p93 < 1 then
        return p92
    else
        return p92 - v94 * p93
    end
end
function v_u_4.CanRebirth(p95, p96, p97)
    if p95.Rebirth then
        if p95.Rebirth.Requirement <= p97 then
            return false
        else
            return p95:GetTierFromExperience(p96, p97) >= #p95.Rewards.Regular
        end
    else
        return false
    end
end
function v_u_4.HasStarted(p98)
    -- upvalues: (copy) v_u_3
    return v_u_3.hasStarted(p98.Timestamp)
end
function v_u_4.HasEnded(p99)
    -- upvalues: (copy) v_u_3
    return v_u_3.hasEnded(p99.Timestamp)
end
function v_u_4.IsLive(p100)
    -- upvalues: (copy) v_u_3
    return v_u_3.isActive(p100.Timestamp)
end
return v_u_4