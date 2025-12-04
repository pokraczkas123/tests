-- Decompiled game.ReplicatedStorage.Content.Monetization

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(script.Strings)
local v_u_3 = require(v1.Tools.Logger).new(script.Name)
local v_u_4 = require(v1.Content.Reward)
local v_u_5 = require(v1.Content.Pack)
local v6 = {
    ["RobuxSymbol"] = utf8.char(57346),
    ["Gamepasses"] = require(script.Gamepasses),
    ["Products"] = require(script.Products),
    ["Type"] = {
        ["Gamepass"] = "Gamepass",
        ["Product"] = "Product"
    }
}
local function v_u_12(p7, p8, p9)
    -- upvalues: (copy) v_u_12
    if typeof(p9) == "table" then
        for _, v10 in pairs(p9) do
            if typeof(v10) == "table" then
                if v10[p7] and v10[p7] == p8 or v10.GiftId and v10.GiftId == p8 then
                    return v10
                end
                local v11 = v_u_12(p7, p8, v10)
                if v11 then
                    return v11
                end
            end
        end
    end
end
function v6.GetDataFromProperty(p13, p14, p15)
    -- upvalues: (copy) v_u_12
    local v16 = v_u_12(p14, p15, p13.Products)
    if v16 then
        return v16, p13.Type.Product
    end
    local v17 = v_u_12(p14, p15, p13.Gamepasses)
    if v17 then
        return v17, p13.Type.Gamepass
    end
end
function v6.GetDataFromId(p18, p19)
    local v20 = tonumber(p19)
    if v20 then
        return p18:GetDataFromProperty("Id", v20)
    end
end
function v6.GetDataFromName(p21, p22)
    local v23 = tostring(p22)
    if v23 then
        return p21:GetDataFromProperty("Name", v23)
    end
end
function v6.getString(p24)
    -- upvalues: (copy) v_u_2, (copy) v_u_3
    if p24.DisplayName then
        return p24.DisplayName
    end
    for v25, v26 in pairs(p24.Product or p24.Gamepass or {}) do
        if v_u_2[v25] then
            return v_u_2[v25](v26)
        end
        v_u_3:Warn((("Failed to get string for product name: \'%*\'"):format(v25)))
    end
    v_u_3:Warn((("Failed to get string for product: %*"):format(p24.Id)))
    return ""
end
function v6.getIcon(p27)
    -- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_3
    if p27.Icon then
        return p27.Icon
    end
    if p27.Product and p27.Product.Reward then
        return v_u_4.getIcon(p27.Product.Reward)
    end
    if p27.Product and p27.Product.Pack then
        return v_u_5:Get(p27.Product.Pack[1]).Image or ""
    end
    if p27.Product and p27.Product.SeasonalTier then
        return "rbxassetid://122348510377448"
    end
    v_u_3:Warn((("Failed to get icon for product: %*"):format(p27.Id)))
    return ""
end
return v6