-- Decompiled game.ReplicatedStorage.Content.Reward

local v_u_1 = game:GetService("ReplicatedFirst")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v_u_2.Tools.Logger).new(script.Name)
local v_u_4 = require(v_u_2.Tools.Number)
require(v_u_2.Tools.Timestamp)
local v_u_5 = {
    ["Type"] = {
        ["Currency"] = "Currency",
        ["SeasonalCurrency"] = "SeasonalCurrency",
        ["SeasonExperience"] = "SeasonalExperience",
        ["PremiumCurrency"] = "PremiumCurrency",
        ["Item"] = "Item",
        ["AbilitySpins"] = "AbilitySpins",
        ["StyleSpins"] = "StyleSpins",
        ["LuckyAbilitySpins"] = "LuckyAbilitySpins",
        ["LuckyStyleSpins"] = "LuckyStyleSpins",
        ["Custom"] = "Custom"
    }
}
v_u_5.Icons = {
    [v_u_5.Type.PremiumCurrency] = "rbxassetid://140161083217291",
    [v_u_5.Type.SeasonExperience] = "rbxassetid://122348510377448",
    [v_u_5.Type.LuckyAbilitySpins] = "rbxassetid://75354333784021",
    [v_u_5.Type.Currency] = "rbxassetid://85819038158646",
    [v_u_5.Type.StyleSpins] = "rbxassetid://75289572541016",
    [v_u_5.Type.LuckyStyleSpins] = "rbxassetid://107354764581233",
    [v_u_5.Type.AbilitySpins] = "rbxassetid://118481582363423",
    [v_u_5.Type.LuckyAbilitySpins] = "rbxassetid://127867934133680"
}
v_u_5.String = {
    [v_u_5.Type.Currency] = "Yen",
    [v_u_5.Type.PremiumCurrency] = "Gems",
    [v_u_5.Type.SeasonExperience] = "XP",
    [v_u_5.Type.Item] = "",
    [v_u_5.Type.AbilitySpins] = "Ability Spins",
    [v_u_5.Type.StyleSpins] = "Style Spins",
    [v_u_5.Type.LuckyAbilitySpins] = "Lucky Ability Spins",
    [v_u_5.Type.LuckyStyleSpins] = "Lucky Style Spins"
}
function v_u_5.new(p6)
    -- upvalues: (copy) v_u_5
    local v7 = type(p6) == "table"
    local v8 = "Expected table for argument 1, got " .. typeof(p6)
    assert(v7, v8)
    local v9 = p6.Type
    local v10 = type(v9) == "string"
    local v11 = p6.Type
    local v12 = "Expected string for Type, got " .. typeof(v11)
    assert(v10, v12)
    local v13 = p6.Value
    local v14
    if type(v13) == "string" then
        v14 = true
    else
        local v15 = p6.Value
        v14 = type(v15) == "number"
    end
    local v16 = p6.Value
    local v17 = "Expected string or number for Value, got " .. typeof(v16)
    assert(v14, v17)
    local v18 = p6.Metadata
    local v19
    if type(v18) == "table" then
        v19 = true
    else
        local v20 = p6.Metadata
        v19 = type(v20) == "nil"
    end
    local v21 = p6.Metadata
    local v22 = "Expected table or nil for Metadata, got " .. typeof(v21)
    assert(v19, v22)
    local v23 = p6.Chance
    local v24
    if type(v23) == "number" then
        v24 = true
    else
        local v25 = p6.Chance
        v24 = type(v25) == "nil"
    end
    local v26 = p6.Chance
    local v27 = "Expected number or nil for Chance, got " .. typeof(v26)
    assert(v24, v27)
    local v28 = p6.Quantity
    local v29
    if type(v28) == "number" then
        v29 = true
    else
        local v30 = p6.Quantity
        v29 = type(v30) == "nil"
    end
    local v31 = p6.Quantity
    local v32 = "Expected number or nil for Quantity, got " .. typeof(v31)
    assert(v29, v32)
    local v33 = p6.Quantity
    if v33 then
        v33 = p6.Type ~= v_u_5.Type.Item
    end
    assert(not v33, "Quantity is only valid for Item type")
    return p6
end
function v_u_5.getIcon(p34)
    -- upvalues: (copy) v_u_5, (copy) v_u_3
    local v35 = v_u_5.Icons[p34.Type]
    if not v35 then
        v_u_3:Warn((("Failed to get icon for reward type: \'%*\'"):format(p34.Type)))
    end
    return v35 or ""
end
function v_u_5.setIcon(p36, p37)
    -- upvalues: (copy) v_u_5, (copy) v_u_1, (copy) v_u_2, (copy) v_u_3
    if p36.Icon then
        p37.Image = p36.Icon
        return p37
    end
    if p36.Type ~= v_u_5.Type.Item then
        if p36.Type == v_u_5.Type.SeasonalCurrency then
            if not v_u_5.Season then
                v_u_5.Season = require(v_u_2.Content.Season).getCurrent()
            end
            if v_u_5.Season then
                p37.Image = v_u_5.Season.Currency.Icon or ""
                return p37
            end
        else
            local v38 = v_u_5.Icons[p36.Type]
            if not v38 then
                v_u_3:Warn((("Failed to get icon for reward type: \'%*\'"):format(p36.Type)))
            end
            p37.Image = v38 or ""
        end
        return p37
    end
    if not v_u_5.DisplayItem then
        v_u_5.DisplayItem = require(v_u_1.Components.DisplayItem)
    end
    p37.Image = ""
    return v_u_5.DisplayItem(p37, p36.Value, true)
end
function v_u_5.getString(p39)
    -- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_3
    if p39.Type == v_u_5.Type.Custom then
        return p39.Value
    end
    if p39.Type == v_u_5.Type.SeasonalCurrency then
        if not v_u_5.Season then
            v_u_5.Season = require(v_u_2.Content.Season).getCurrent()
        end
        if v_u_5.Season then
            return v_u_5.Season.Currency.DisplayName or ""
        end
    end
    if not v_u_5.String[p39.Type] then
        v_u_3:Warn((("Failed to get string for reward type: \'%*\'"):format(p39.Type)))
    end
    local v40 = v_u_5.String[p39.Type] or ""
    if p39.Value == 1 then
        v40 = v40:gsub("s$", "")
    end
    return v40
end
function v_u_5.toString(p41)
    -- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_4
    if p41.Type == v_u_5.Type.Custom then
        return p41.Value
    end
    if p41.Type == v_u_5.Type.Item then
        local v42 = require(v_u_2.Content.Item)
        return ((not p41.Quantity or p41.Quantity <= 1) and "" or ("%* "):format((v_u_4.format(p41.Quantity)))) .. ((v42:Get(p41.Value) or {}).DisplayName or "Item does not exist")
    end
    local v43 = "%* %*"
    local v44 = p41.Value
    local v45
    if typeof(v44) == "number" then
        v45 = v_u_4.format(p41.Value)
    else
        v45 = p41.Value
    end
    return v43:format(v45, (v_u_5.getString(p41)))
end
return v_u_5