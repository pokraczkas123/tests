-- Decompiled game.ReplicatedStorage.Packages._Index.serunite-development_playfab-internal@1.0.4.playfab-internal

local v_u_1 = game:GetService("HttpService")
local v_u_2 = {
    ["titleId"] = "",
    ["secretKey"] = "",
    ["productionUrl"] = ".playfabapi.com",
    ["verticalName"] = nil
}
local v_u_3 = {
    ["sdk"] = "RobloxSdk_undefined"
}
local function v_u_13(p4)
    -- upvalues: (ref) v_u_2, (copy) v_u_3
    local v5 = v_u_2.titleId
    local v6 = v_u_2.productionUrl
    local v7 = "https://" .. v5 .. v6 .. p4
    local v8 = v_u_3
    local v9 = true
    for v10, v11 in pairs(v8) do
        local v12
        if v9 then
            v12 = v7 .. "?"
            v9 = false
        else
            v12 = v7 .. "&"
        end
        v7 = v12 .. v10 .. "=" .. v11
    end
    return v7
end
return {
    ["SetSettings"] = function(p14)
        -- upvalues: (ref) v_u_2
        v_u_2 = table.clone(p14)
    end,
    ["MakeApiCall"] = function(p15, p16, p17, p18)
        -- upvalues: (copy) v_u_13, (copy) v_u_1, (ref) v_u_2
        local v19 = v_u_13(p15)
        local v20 = {
            ["X-ReportErrorAsSuccess"] = "true",
            ["X-PlayFabSDK"] = "RobloxSdk_undefined",
            ["Content-Type"] = "application/json"
        }
        if p17 and p18 ~= "" and p18 then
            if p17 == "X-SecretKey" then
                p18 = v_u_1:GetSecret(p18)
            end
            v20[p17] = p18
        end
        p16.TitleID = v_u_2.titleId
        local v21 = {
            ["Url"] = v19,
            ["Method"] = "POST",
            ["Headers"] = v20,
            ["Body"] = v_u_1:JSONEncode(p16)
        }
        local v22, v23 = pcall(v_u_1.RequestAsync, v_u_1, v21)
        if v22 then
            if v23.Success then
                local v24 = v_u_1:JSONDecode(v23.Body)
                if v24 and v24.code == 200 and v24.data then
                    return v24.data
                end
                error(v23)
            else
                error(v23)
            end
        else
            error((tostring(v23)))
            return
        end
    end
}