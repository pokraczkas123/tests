-- Decompiled game.ReplicatedStorage.Content.Match

local v_u_1 = game:GetService("HttpService")
local v_u_2 = game:GetService("Players")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = require(v3.Tools.TeamGenerator)
local v_u_5 = require(v3.Configuration.Matchmaking)
local v_u_6 = require(script.Team)
local v_u_7 = {
    ["Type"] = "Match"
}
v_u_7.__index = v_u_7
function v_u_7.new(p8)
    -- upvalues: (copy) v_u_4, (copy) v_u_1, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7
    local v9 = v_u_4.new():ToName()
    local v10 = {
        ["Id"] = v_u_1:GenerateGUID(false),
        ["State"] = v_u_5.State.Waiting,
        ["Timestamp"] = DateTime.now().UnixTimestamp,
        ["Type"] = p8.Type,
        ["Season"] = p8.Season,
        ["ReservedAccessCode"] = p8.ReservedAccessCode or nil,
        ["Teams"] = { v_u_6.new({
                ["Name"] = v9[1],
                ["Players"] = p8.Players[1],
                ["Type"] = p8.Type,
                ["Season"] = p8.Season
            }), v_u_6.new({
                ["Name"] = v9[2],
                ["Players"] = p8.Players[2],
                ["Type"] = p8.Type,
                ["Season"] = p8.Season
            }) },
        ["Parties"] = p8.Parties
    }
    local v11 = v_u_7
    return setmetatable(v10, v11)
end
function v_u_7.fromSerial(p12)
    -- upvalues: (copy) v_u_7
    local v13 = v_u_7
    return setmetatable(p12, v13)
end
function v_u_7.GetPlayers(p14)
    -- upvalues: (copy) v_u_2
    local v15 = {}
    for _, v16 in ipairs(p14.Teams) do
        for _, v17 in ipairs(v16.Players) do
            local v18 = v_u_2:GetPlayerByUserId(v17.UserId)
            if v18 then
                table.insert(v15, v18)
            end
        end
    end
    return v15
end
function v_u_7.GetTeam(p19, p20)
    for _, v21 in ipairs(p19.Teams) do
        for _, v22 in ipairs(v21.Players) do
            if v22.UserId == p20.UserId then
                return v21
            end
        end
    end
end
function v_u_7.GetPlayerData(p23, p24)
    for _, v25 in ipairs(p23.Teams) do
        for _, v26 in ipairs(v25.Players) do
            if v26.UserId == p24.UserId then
                return v26
            end
        end
    end
end
function v_u_7.Serialize(p27)
    return {
        ["Id"] = p27.Id,
        ["Name"] = p27.Name,
        ["Type"] = p27.Type,
        ["State"] = p27.State,
        ["Season"] = p27.Season,
        ["ReservedAccessCode"] = p27.ReservedAccessCode,
        ["Timestamp"] = p27.Timestamp,
        ["Teams"] = p27.Teams,
        ["Parties"] = p27.Parties
    }
end
return v_u_7