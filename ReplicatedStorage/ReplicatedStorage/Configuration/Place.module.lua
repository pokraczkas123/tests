-- Decompiled game.ReplicatedStorage.Configuration.Place

local v1 = game:GetService("RunService")
local v_u_2 = {
    ["Production"] = 6931042565,
    ["Development"] = 7099263384
}
local v_u_3 = {
    ["Pro"] = {
        ["Production"] = 134314141048307,
        ["Development"] = 93507193197337
    },
    ["ClassicPro"] = {
        ["Production"] = 109684591839194,
        ["Development"] = 127230203073079
    },
    ["Beginner"] = {
        ["Production"] = 74691681039273,
        ["Development"] = 70882603136659
    },
    ["Default"] = {
        ["Production"] = 73956553001240,
        ["Development"] = 127978196002690
    },
    ["Training"] = {
        ["Production"] = 96802054849934,
        ["Development"] = 77569554466776
    },
    ["Idle"] = {
        ["Production"] = 86789627188240,
        ["Development"] = 128311527873732
    },
    ["Matchmaking"] = {
        ["Production"] = 122069199001617,
        ["Development"] = 111298128882096
    },
    ["Seasonal"] = {
        ["Production"] = 79136731857959,
        ["Development"] = 80289684342936
    },
    ["Hardcore"] = {
        ["Production"] = 103521881639626,
        ["Development"] = 122273223414774
    },
    ["Sandbox"] = {
        ["Production"] = 117134837736236,
        ["Development"] = 78499094786141
    },
    ["Developmental"] = {
        ["Noah"] = {
            ["Production"] = 73956553001240,
            ["Development"] = 96604744451060
        },
        ["Kareem"] = {
            ["Production"] = 73956553001240,
            ["Development"] = 95445450782680
        },
        ["Happy"] = {
            ["Production"] = 73956553001240,
            ["Development"] = 113692279278298
        },
        ["Protori"] = {
            ["Production"] = 73956553001240,
            ["Development"] = 89903223685466
        },
        ["PineCrumb"] = {
            ["Production"] = 73956553001240,
            ["Development"] = 138064241772208
        }
    },
    ["Current"] = game.PlaceId
}
local v4
if v1:IsServer() then
    v4 = game.PrivateServerId ~= ""
else
    v4 = nil
end
v_u_3.IsPrivateServer = v4
local v5
if v1:IsServer() then
    if game.PrivateServerId == "" then
        v5 = false
    else
        v5 = game.PrivateServerOwnerId ~= nil
    end
else
    v5 = nil
end
v_u_3.IsVipServer = v5
v_u_3.IsMatchmakingServer = false
v_u_3.Experience = game.GameId
v_u_3.Experiences = v_u_2
return function()
    -- upvalues: (copy) v_u_3, (copy) v_u_2
    local v6 = v_u_3.Experience == v_u_2.Production
    local v7 = {}
    for v8, v9 in pairs(v_u_3) do
        if v8 == "Developmental" then
            v7[v8] = {}
            for v10, v11 in pairs(v9) do
                if typeof(v11) == "table" then
                    v7[v8][v10] = v11[v6 and "Production" or "Development"]
                else
                    v7[v8][v10] = v11
                end
            end
        elseif typeof(v9) == "table" and v8 ~= "Experiences" then
            v7[v8] = v9[v6 and "Production" or "Development"]
        else
            v7[v8] = v9
        end
    end
    v7.IsMatchmakingServer = v7.Current == v7.Matchmaking
    local v12
    if v7.Current == v7.Pro then
        v12 = false
    else
        v12 = v7.IsPrivateServer
    end
    v7.IsPrivateServer = v12
    local v13
    if v7.Current == v7.Pro then
        v13 = false
    else
        v13 = v7.IsVipServer
    end
    v7.IsVipServer = v13
    return v7
end