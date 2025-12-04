-- Decompiled game.ReplicatedStorage.Content.Boost.SecretLuck

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Knit)
local v3 = require(script.Parent)
local v_u_4 = require(v1.Content.Rarity)
local v_u_5 = require(v1.Tools.Utility)
return v3.new({
    ["Type"] = v3.Type.Multiplier,
    ["Id"] = script.Name,
    ["DisplayName"] = "Secret Luck Boost",
    ["ItemId"] = "LuckPotionConsumable",
    ["Start"] = function(p6, p7)
        -- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_4
        local v8 = v_u_2.GetService("RollService")
        local v9 = v_u_5.deepClone(v8.Client.Data:Get() or {})
        for _, v10 in ipairs({
            "",
            "Lucky",
            "Pity",
            "SecretPity"
        }) do
            local v11 = v9[("%*Distribution"):format(v10)]
            if v11 then
                local v12 = v_u_4.Type.Secret
                if (v11[tostring(v12)] or 0) > 0 then
                    local v13 = v_u_4.Type.Godly
                    if (v11[tostring(v13)] or 0) > 0 then
                        local v14 = v_u_4.Type.Secret
                        local v15 = v11[tostring(v14)]
                        local v16 = v15 * p7.Value
                        local v17 = v_u_4.Type.Secret
                        v11[tostring(v17)] = v16
                        local v18 = v_u_4.Type.Godly
                        local v19 = tostring(v18)
                        v11[v19] = v11[v19] - v16 - v15
                    end
                end
            end
        end
        v8.Client.Data:SetFor(p6, v9)
    end,
    ["End"] = function(p20)
        -- upvalues: (copy) v_u_2
        v_u_2.GetService("RollService").Client.Data:ClearFor(p20)
    end
})