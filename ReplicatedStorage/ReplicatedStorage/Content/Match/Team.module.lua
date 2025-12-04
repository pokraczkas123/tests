-- Decompiled game.ReplicatedStorage.Content.Match.Team

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = require(v1.Packages.Knit)
require(v1.Configuration.Matchmaking)
local v_u_4 = require(v1.Tools.Logger).new(script.Name)
return {
    ["new"] = function(p_u_5)
        -- upvalues: (ref) v_u_2, (copy) v_u_3, (copy) v_u_4
        v_u_2 = v_u_3.GetService("RankedService")
        local v_u_6 = {
            ["Name"] = p_u_5.Name,
            ["Points"] = 0,
            ["Elo"] = 0,
            ["Players"] = {}
        }
        for _, v_u_7 in ipairs(p_u_5.Players) do
            local v13, v14 = pcall(function()
                -- upvalues: (ref) v_u_2, (copy) v_u_7, (copy) p_u_5, (copy) v_u_6
                local v8 = v_u_2:GetEloAsync(v_u_7, p_u_5.Type, p_u_5.Season) or 0
                local v9 = v_u_6
                local v10 = v_u_6.Elo
                v9.Elo = math.max(v8, v10)
                local v11 = v_u_6.Players
                local v12 = {
                    ["UserId"] = v_u_7,
                    ["HasLeft"] = false,
                    ["IsBanWaved"] = false,
                    ["Elo"] = v8,
                    ["EloChange"] = 0,
                    ["Stats"] = {
                        ["Points"] = 0,
                        ["Saves"] = 0,
                        ["Sets"] = 0,
                        ["Blocks"] = 0,
                        ["Bumps"] = 0,
                        ["Spikes"] = 0,
                        ["Assists"] = 0,
                        ["Aces"] = 0,
                        ["Rotations"] = 0,
                        ["Faults"] = 0
                    }
                }
                table.insert(v11, v12)
            end)
            if not v13 then
                v_u_4:Warn(v14)
            end
        end
        return v_u_6
    end
}