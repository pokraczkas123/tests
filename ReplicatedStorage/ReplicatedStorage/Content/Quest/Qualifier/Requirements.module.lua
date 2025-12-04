-- Decompiled game.ReplicatedStorage.Content.Quest.Qualifier.Requirements

local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = nil
local v_u_4 = require(v_u_2.Packages.Knit)
local v5 = require(script.Parent.Requirement)
local v_u_6 = require(v_u_2.Content.Style)
local v_u_7 = require(v_u_2.Content.Pack)
local v_u_8 = require(v_u_2.Configuration.Ranks)
local v_u_9 = require(v_u_2.Configuration.Matchmaking)
local v_u_10 = require(v_u_2.Configuration.Place)()
local v_u_11 = require(v_u_2.Common.State)
local v_u_12 = require(v_u_2.Tools.Logger).new(script.Name)
local v65 = {
    ["Style"] = v5.new({
        ["Id"] = "Style",
        ["Description"] = function(p13)
            -- upvalues: (copy) v_u_6
            return ("with %*"):format(v_u_6:Get(p13.Style).DisplayName)
        end,
        ["Validator"] = function(p14, p15)
            -- upvalues: (copy) v_u_4
            return v_u_4.GetService("StyleService"):GetStyleName(p14) == p15.Style
        end
    }),
    ["Rarity"] = v5.new({
        ["Id"] = "Rarity",
        ["Description"] = function(p16)
            -- upvalues: (copy) v_u_6
            return ("%*%*%*"):format(p16.IsWin and "with a " or "", p16.Rarity == v_u_6.Rarity.Type.Secret and "Secret" or v_u_6.Rarity.Data[p16.Rarity].Name, p16.Comparison and " or better" or "")
        end,
        ["Validator"] = function(_, p17, p18)
            if p17.Comparison then
                return p18.Rarity <= p17.Rarity
            else
                return p18.Rarity == p17.Rarity
            end
        end
    }),
    ["Pack"] = v5.new({
        ["Id"] = "Pack",
        ["Description"] = function(p19)
            -- upvalues: (copy) v_u_7
            return ("%*"):format(v_u_7:Get(p19.Pack).DisplayName)
        end,
        ["Validator"] = function(_, p20, p21)
            return p20.Pack == p21
        end
    }),
    ["Ranked"] = v5.new({
        ["Id"] = "Ranked",
        ["Description"] = function(p22)
            -- upvalues: (copy) v_u_9
            return not (p22 and p22.Mode) and "in Ranked" or ("in %* Ranked"):format(v_u_9.Data[p22.Mode].DisplayName)
        end,
        ["Validator"] = function(_, p23, p24)
            -- upvalues: (copy) v_u_4
            local v25 = v_u_4.GetService("GameService")
            if typeof(p24) == "table" and p24.Force then
                return true
            end
            if not (p23 and p23.Mode) then
                return v25.Match
            end
            local v26 = v25.Match
            if v26 then
                v26 = v25.Match.Type == p23.Mode
            end
            return v26
        end
    }),
    ["Friends"] = v5.new({
        ["Id"] = "Friends",
        ["Description"] = function()
            return "with friends"
        end,
        ["Validator"] = function(p27, _)
            -- upvalues: (copy) v_u_1
            for _, v28 in ipairs(v_u_1:GetPlayers()) do
                if v28 ~= p27 and p27:IsFriendsWith(v28.UserId) then
                    return true
                end
            end
            return false
        end
    }),
    ["Career"] = v5.new({
        ["Id"] = "Career",
        ["Description"] = function(p29)
            return ("%*"):format(p29.Move)
        end,
        ["Validator"] = function(_, p30, p31)
            return p30.Statistic == p31
        end
    }),
    ["Spin"] = v5.new({
        ["Id"] = "Spin",
        ["Description"] = function(p32)
            return ("a %*"):format((p32.Type:gsub("(%l)(%u)", "%1 %2")))
        end,
        ["Validator"] = function(_, p33, p34)
            if p33.Type:find("Lucky") then
                return p33.Type == p34.Type
            else
                return p33.Type == p34.Type:gsub("Lucky", "")
            end
        end
    }),
    ["Rank"] = v5.new({
        ["Id"] = "Rank",
        ["Description"] = function(p35)
            -- upvalues: (copy) v_u_8
            return ("%*"):format(v_u_8.Data[p35.Rank].Name)
        end,
        ["Validator"] = function(p36, p37)
            return (p36:GetAttribute("CurrentRank") or -1) >= p37.Rank
        end
    }),
    ["Place"] = v5.new({
        ["Id"] = "Place",
        ["Description"] = function(p38)
            -- upvalues: (copy) v_u_10
            return ("in the %*"):format(({
                [v_u_10.Seasonal] = "1v1 Gamemode",
                [v_u_10.Idle] = "AFK Place",
                [v_u_10.Hardcore] = "Hardcore Gamemode",
                [v_u_10.ClassicPro] = "Classic Pro Gamemode"
            })[p38.Place] or "Unknown Gamemode")
        end,
        ["Validator"] = function(_, p39, _)
            -- upvalues: (copy) v_u_10, (copy) v_u_4, (copy) v_u_9
            if p39.Place ~= v_u_10.Seasonal then
                return v_u_10.Current == p39.Place
            end
            local v40 = v_u_4.GetService("GameService")
            local v41
            if v40.Match == nil then
                v41 = false
            else
                v41 = v40.Match.Type == v_u_9.Type.Ones
            end
            return v41
        end
    }),
    ["Mastery"] = v5.new({
        ["Id"] = "Mastery",
        ["Description"] = function(_)
            return ""
        end,
        ["Validator"] = function(p42, p43, _)
            -- upvalues: (copy) v_u_4
            return v_u_4.GetService("MasteryService"):GetMasteryIdFromCurrentStyle(p42) == p43.MasteryId
        end
    }),
    ["SpecialActive"] = v5.new({
        ["Id"] = "SpecialActive",
        ["Description"] = function(p44)
            return p44.Description
        end,
        ["Validator"] = function(p45, p46, _)
            -- upvalues: (copy) v_u_11, (copy) v_u_10
            local v47
            if v_u_11.get(p45, v_u_11.Id.Special, "ActionState") == p46.Active then
                v47 = v_u_10.Current ~= v_u_10.Training
            else
                v47 = false
            end
            return v47
        end
    }),
    ["IsReceive"] = v5.new({
        ["Id"] = "IsReceive",
        ["Description"] = function(_)
            return "while Receiving"
        end,
        ["Validator"] = function(p48, _, _)
            -- upvalues: (copy) v_u_1, (copy) v_u_2
            local v49 = v_u_1:FindFirstChild(v_u_2:GetAttribute("PreviousHitter") or "")
            if v49 then
                return v49.Team ~= p48.Team
            else
                return false
            end
        end
    }),
    ["Backline"] = v5.new({
        ["Id"] = "Backline",
        ["Description"] = function(_)
            return "behind Backline"
        end,
        ["Validator"] = function(p_u_50, _, _)
            -- upvalues: (copy) v_u_12
            local v_u_51 = false
            local v60, v61 = pcall(function()
                -- upvalues: (copy) p_u_50, (ref) v_u_51
                local v52 = p_u_50.Character
                local v53 = game.Workspace.Map
                local v54 = v53.BallCollideOnly.Net
                local v55 = v53.Court
                local v56 = v52:GetPivot().Z > v54.Position.Z
                local v57 = v54.Position.Z
                local v58
                if v56 then
                    v58 = v55.Size.Z / 2 + v54.Size.Z / 2 - 2.5
                else
                    v58 = -v55.Size.Z / 2 - v54.Size.Z / 2 + 2.5
                end
                local v59 = v57 + v58
                if v52:GetPivot().Z >= v59 or not v56 then
                    if v59 < v52:GetPivot().Z then
                        v56 = not v56
                    else
                        v56 = false
                    end
                end
                v_u_51 = not v56
            end)
            if v60 then
                return v_u_51
            end
            v_u_12:Warn(v61)
            return false
        end
    }),
    ["Points"] = v5.new({
        ["Id"] = "Points",
        ["Description"] = function(p62)
            return ("%* points or more"):format(p62.Points)
        end,
        ["Validator"] = function(p63, p64, _)
            -- upvalues: (copy) v_u_11
            return v_u_11.get(p63, v_u_11.Id.Statistics, "Score", 0) >= p64.Points
        end
    })
}
local v71 = {
    ["Id"] = "CompareBall",
    ["Description"] = function(p66)
        return p66.Description
    end,
    ["Validator"] = function(p67, p68)
        -- upvalues: (ref) v_u_3, (copy) v_u_4
        v_u_3 = v_u_3 or v_u_4.GetService("BallService")
        local v69 = v_u_3.Spawner.CurrentBall
        if not v69 then
            return false
        end
        if p68.ValueType ~= "Attribute" then
            warn((("Unknown ValueType %* in CompareBall requirement"):format(p68.ValueType)))
            return false
        end
        local v70 = v69:GetAttribute(p68.ValueId)
        if p68.Value == "<ThisPlayer>" then
            p68.Value = p67
        elseif p68.Value == "<ThisPlayerName>" then
            p68.Value = p67.Name
        end
        if p68.Comparator == "Exists" then
            return v70 ~= nil
        end
        if p68.Comparator == "IsEqual" then
            return v70 == p68.Value
        end
        if p68.Comparator == "IsNotEqual" then
            return v70 ~= p68.Value
        end
        if p68.Comparator == "GreaterThan" then
            return (tonumber(v70) or 0) > p68.Value
        end
        if p68.Comparator == "LessThan" then
            return (tonumber(v70) or 0) < p68.Value
        end
    end
}
v65.CompareBall = v5.new(v71)
return v65