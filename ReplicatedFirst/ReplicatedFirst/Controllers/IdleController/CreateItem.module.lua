-- Decompiled game.ReplicatedFirst.Controllers.IdleController.CreateItem

local v_u_1 = Color3.fromRGB(120, 86, 0)
local v2 = game:GetService("ReplicatedFirst")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = require(v3.Packages.Fusion)
local v_u_5 = require(v3.Content.Item)
local v_u_6 = require(v2.Components.DisplayItem)
local v_u_7 = require(v3.Content.IdleRewards)
local v_u_8 = require(v3.Content.Reward)
local v_u_9 = require(v3.Content.Season)
function formatDecimal(p10)
    local v11 = string.format
    local v12 = p10 * 100
    local v13 = v11("%.2f", math.floor(v12) / 100)
    return string.match(v13, "(.-)%.?0*$")
end
return function(p14)
    -- upvalues: (copy) v_u_7, (copy) v_u_5, (copy) v_u_8, (copy) v_u_4, (copy) v_u_1, (copy) v_u_6, (copy) v_u_9
    local v15 = v_u_7[p14.rewardIndex]
    local v16
    if v15.Type == "Item" then
        v16 = v_u_5:Get(v15.Value)
    else
        v16 = nil
    end
    local v17 = v_u_8.toString(v15):upper()
    local v18 = v_u_4.Hydrate(p14.template:Clone())
    local v19 = {
        ["Name"] = v17,
        ["Parent"] = p14.parent,
        ["Visible"] = true
    }
    local v20
    if v16 then
        v20 = v_u_5.Rarity.Data[v16.Rarity].Color
    else
        v20 = v_u_1
    end
    v19.BackgroundColor3 = v20
    local v21 = v18(v19)
    if p14.rewardCount then
        v21.Title.Text = ("%* (x%*)"):format(v17, p14.rewardCount)
    else
        v21.Title.Text = v17
    end
    if p14.rewardInfo then
        v21.Chance.Text = ("%*%%"):format((formatDecimal(v15.Chance * 100)))
    else
        v21.Chance.Visible = false
    end
    if v16 then
        v_u_6(v21.DisplayItem, v16.Id)
        return v21
    end
    local v22 = v_u_9.getCurrent()
    local v23 = v21.Icon
    local v24
    if v15.Type == v_u_8.Type.SeasonalCurrency and v22 then
        v24 = v22.Currency.Icon or ""
    else
        v24 = v_u_8.getIcon(v15)
    end
    v23.Image = v24
    v21.Icon.Visible = true
    return v21
end