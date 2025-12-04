-- Decompiled game.ReplicatedStorage.Configuration.Ranks

local v_u_7 = {
    ["LeaverPenalty"] = 30,
    ["WinEloBound"] = 20,
    ["LoseEloBound"] = 30,
    ["EloPerRank"] = 100,
    ["Type"] = {
        ["Unranked"] = -1,
        ["Bronze1"] = 0,
        ["Bronze2"] = 1,
        ["Bronze3"] = 2,
        ["Silver1"] = 3,
        ["Silver2"] = 4,
        ["Silver3"] = 5,
        ["Gold1"] = 6,
        ["Gold2"] = 7,
        ["Gold3"] = 8,
        ["Diamond1"] = 9,
        ["Diamond2"] = 10,
        ["Diamond3"] = 11,
        ["Pro"] = 12
    },
    ["getRankFromElo"] = function(p1)
        -- upvalues: (copy) v_u_7
        local v2 = p1 / v_u_7.EloPerRank
        local v3 = math.floor(v2)
        local v4 = v_u_7.Type.Pro
        return math.clamp(v3, 0, v4)
    end,
    ["getEloPercentage"] = function(p5)
        -- upvalues: (copy) v_u_7
        if v_u_7.Type.Pro * v_u_7.EloPerRank <= p5 then
            return 1
        end
        if p5 < v_u_7.Type.Bronze2 * v_u_7.EloPerRank then
            return p5 / v_u_7.Type.Bronze2 * v_u_7.EloPerRank
        end
        local v6 = p5 % v_u_7.EloPerRank / v_u_7.EloPerRank
        return math.clamp(v6, 0, 1)
    end
}
local v8 = {
    [v_u_7.Type.Unranked] = {
        ["Name"] = "Unranked",
        ["Icon"] = "rbxassetid://89698552363553",
        ["Color"] = Color3.fromRGB(50, 30, 0)
    },
    [v_u_7.Type.Bronze1] = {
        ["Name"] = "Bronze I",
        ["Icon"] = "rbxassetid://130669320410389",
        ["Color"] = Color3.fromRGB(202, 111, 0)
    },
    [v_u_7.Type.Bronze2] = {
        ["Name"] = "Bronze II",
        ["Icon"] = "rbxassetid://73405992598016",
        ["Color"] = Color3.fromRGB(202, 111, 0)
    },
    [v_u_7.Type.Bronze3] = {
        ["Name"] = "Bronze III",
        ["Icon"] = "rbxassetid://79761745721511",
        ["Color"] = Color3.fromRGB(202, 111, 0)
    },
    [v_u_7.Type.Silver1] = {
        ["Name"] = "Silver I",
        ["Icon"] = "rbxassetid://112572076448761",
        ["Color"] = Color3.fromRGB(217, 255, 249)
    },
    [v_u_7.Type.Silver2] = {
        ["Name"] = "Silver II",
        ["Icon"] = "rbxassetid://76902057539735",
        ["Color"] = Color3.fromRGB(217, 255, 249)
    },
    [v_u_7.Type.Silver3] = {
        ["Name"] = "Silver III",
        ["Icon"] = "rbxassetid://77322857154488",
        ["Color"] = Color3.fromRGB(217, 255, 249)
    },
    [v_u_7.Type.Gold1] = {
        ["Name"] = "Gold I",
        ["Icon"] = "rbxassetid://118586205542281",
        ["Color"] = Color3.fromRGB(255, 234, 0)
    },
    [v_u_7.Type.Gold2] = {
        ["Name"] = "Gold II",
        ["Icon"] = "rbxassetid://92605391652769",
        ["Color"] = Color3.fromRGB(255, 234, 0)
    },
    [v_u_7.Type.Gold3] = {
        ["Name"] = "Gold III",
        ["Icon"] = "rbxassetid://89673506263381",
        ["Color"] = Color3.fromRGB(255, 234, 0)
    },
    [v_u_7.Type.Diamond1] = {
        ["Name"] = "Diamond I",
        ["Icon"] = "rbxassetid://91608173345600",
        ["Color"] = Color3.fromRGB(23, 249, 253)
    },
    [v_u_7.Type.Diamond2] = {
        ["Name"] = "Diamond II",
        ["Icon"] = "rbxassetid://70829728586205",
        ["Color"] = Color3.fromRGB(23, 249, 253)
    },
    [v_u_7.Type.Diamond3] = {
        ["Name"] = "Diamond III",
        ["Icon"] = "rbxassetid://118848539595196",
        ["Color"] = Color3.fromRGB(23, 249, 253)
    },
    [v_u_7.Type.Pro] = {
        ["Name"] = "Pro",
        ["Icon"] = "rbxassetid://101534876440932",
        ["Color"] = Color3.fromRGB(255, 0, 0)
    }
}
v_u_7.Data = v8
return v_u_7