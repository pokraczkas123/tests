-- Decompiled game.ReplicatedStorage.Content.Quest

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Type)
local v_u_3 = require(script.Qualifier)
require(v1.Content.Reward)
local v_u_4 = {
    ["Type"] = v2,
    ["DailyAmount"] = 5
}
v_u_4.__index = v_u_4
function v_u_4.new(p5)
    if not p5.Type then
        warn(p5)
    end
    local v6 = p5.Type
    local v7 = type(v6) == "table"
    assert(v7, "Quest.new - props.Type must be a table ")
    local v8
    if p5.IgnoreReward == true then
        v8 = true
    else
        local v9 = p5.Reward
        v8 = type(v9) == "table"
    end
    assert(v8, "Quest.new - props.Reward must be a table")
    local v10 = p5.Requirement
    local v11 = type(v10) == "number"
    assert(v11, "Quest.new - props.Requirement must be a number")
    local v12 = p5.Qualifiers
    local v13 = type(v12) == "table" and true or p5.Qualifiers == nil
    assert(v13, "Quest.new - props.Qualifiers must be a table or nil")
    local v14 = {
        ["Id"] = p5.Type.Id,
        ["Icon"] = p5.Type.Icon,
        ["Reward"] = p5.Reward,
        ["IgnoreReward"] = p5.IgnoreReward or nil,
        ["HighestOnly"] = p5.Type.HighestOnly,
        ["Description"] = p5.Type.description(p5.Requirement, p5.Qualifiers),
        ["IgnoreDescriptionForQualifiers"] = p5.Type.IgnoreDescriptionForQualifiers or {},
        ["Requirement"] = p5.Requirement,
        ["Qualifiers"] = p5.Qualifiers or {},
        ["Progress"] = p5.Progress
    }
    if v14.Requirement < 2 then
        v14.Description = v14.Description:gsub("s$", "")
    end
    for v15, v16 in ipairs(v14.Qualifiers) do
        if not table.find(v14.IgnoreDescriptionForQualifiers, v15) then
            v14.Description = v14.Description .. (" %*"):format((v16.description(v16.Params)))
        end
    end
    return v14
end
function v_u_4.serialize(p17, p18)
    -- upvalues: (copy) v_u_3
    local v19 = {}
    for _, v20 in ipairs(p17.Qualifiers) do
        local v21 = v_u_3.serialize
        table.insert(v19, v21(v20))
    end
    return {
        ["Id"] = p17.Id,
        ["Requirement"] = p17.Requirement,
        ["Progress"] = p18 or 0,
        ["Reward"] = p17.Reward,
        ["Qualifiers"] = v19,
        ["IgnoreReward"] = p17.IgnoreReward
    }
end
function v_u_4.deserialize(p22)
    -- upvalues: (copy) v_u_3, (copy) v_u_4
    local v23 = {}
    for _, v24 in ipairs(p22.Qualifiers) do
        local v25 = v_u_3.deserialize
        table.insert(v23, v25(v24))
    end
    return v_u_4.new({
        ["Type"] = v_u_4.Type[p22.Id],
        ["Reward"] = p22.Reward,
        ["Requirement"] = p22.Requirement,
        ["Qualifiers"] = v23,
        ["Progress"] = p22.Progress,
        ["IgnoreReward"] = p22.IgnoreReward
    })
end
function v_u_4.validateFromSerial(p26, p27, ...)
    -- upvalues: (copy) v_u_4
    local v28 = v_u_4.deserialize(p27)
    return v_u_4.validate(p26, v28, ...)
end
function v_u_4.validate(p29, p30, ...)
    for _, v31 in ipairs(p30.Qualifiers) do
        if not v31.validate(p29, v31.Params, ...) then
            return false
        end
    end
    return true
end
function v_u_4.getQualifierString(p32)
    local v33 = {}
    for _, v34 in ipairs(p32.Qualifiers) do
        local v35 = v34.Params
        if typeof(v35) == "table" then
            v35 = ("%*"):format((table.concat(v35, ", ")))
        end
        local v36 = table.concat
        local v37 = { v34.Id, v35 }
        table.insert(v33, v36(v37, ", "))
    end
    return table.concat(v33, ", ")
end
function v_u_4.getDailyQuests()
    return require(script.Daily)
end
return v_u_4