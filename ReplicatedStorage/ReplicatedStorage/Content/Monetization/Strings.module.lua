-- Decompiled game.ReplicatedStorage.Content.Monetization.Strings

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Content.Reward)
local v_u_3 = require(v1.Content.Bundle)
local v_u_4 = require(v1.Content.Pack)
return {
    ["Reward"] = function(p5)
        -- upvalues: (copy) v_u_2
        return v_u_2.toString(p5)
    end,
    ["StyleSlot"] = function(p6)
        return "Style Slot " .. p6
    end,
    ["AbilitySlot"] = function(p7)
        return "Ability Slot " .. p7
    end,
    ["SeasonalRebirth"] = function()
        return "Seasonal Rebirth"
    end,
    ["SeasonalPremium"] = function()
        return "Seasonal Premium"
    end,
    ["SeasonalTier"] = function(p8)
        return ("%* Seasonal Tier%*"):format(p8, p8 > 1 and "s" or "")
    end,
    ["Pack"] = function(p9)
        -- upvalues: (copy) v_u_4
        return ("%* %* Pack%*"):format(p9[2] or 1, v_u_4:Get(p9[1]).DisplayName, (p9[2] or 1) > 1 and "s" or "")
    end,
    ["LevelUp"] = function()
        return "Level Up"
    end,
    ["Quest"] = function(p10)
        return p10 < 1 and "Refresh Quests" or ("Skip Quest %*"):format(p10)
    end,
    ["Bundle"] = function(p11)
        -- upvalues: (copy) v_u_3
        return v_u_3:Get(p11).DisplayName
    end
}