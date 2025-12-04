-- Decompiled game.ReplicatedFirst.Controllers.SeasonController.Header

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Packages.Fusion)
local v_u_4 = require(v2.Tools.Logger).new(script.Name)
local v_u_5 = require(v1.Components.Button)
return function(p_u_6)
    -- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_3
    local v_u_7 = {
        ["Crates"] = "Crates",
        ["Quests"] = "Quests",
        ["Main"] = "Season Pass",
        ["CurrencyShop"] = "%s Shop"
    }
    for v_u_8, _ in pairs(v_u_7) do
        local v9 = p_u_6.Component:FindFirstChild(v_u_8)
        if v_u_8 ~= "CurrencyShop" then
            if v9 then
                v_u_5(v9)({
                    ["OnActivated"] = function()
                        -- upvalues: (copy) p_u_6, (copy) v_u_8
                        p_u_6.SelectedMenu:set(v_u_8)
                    end
                })
            else
                v_u_4:Warn((("Button \'%*\' not found!"):format(v_u_8)))
            end
        end
    end
    for _, v10 in ipairs(p_u_6.Header:GetChildren()) do
        if v10:IsA("TextLabel") then
            v_u_3.Hydrate(v10)({
                ["Text"] = v_u_3.Computed(function()
                    -- upvalues: (copy) v_u_7, (copy) p_u_6
                    local v11 = v_u_7[p_u_6.SelectedMenu:get()] or ""
                    if v11 == v_u_7.CurrencyShop then
                        v11 = v11:format(p_u_6.Season.Currency.DisplayName:sub(1, -2))
                    end
                    return v11:upper()
                end)
            })
        end
    end
end