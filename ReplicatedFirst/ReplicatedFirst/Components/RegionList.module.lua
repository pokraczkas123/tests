-- Decompiled game.ReplicatedFirst.Components.RegionList

local v_u_1 = Color3.fromRGB(78, 114, 234)
local v_u_2 = Color3.fromRGB(48, 234, 45)
local v3 = game:GetService("ReplicatedFirst")
local v4 = game:GetService("ReplicatedStorage")
local v_u_5 = nil
local v_u_6 = require(v4.Packages.Knit)
local v_u_7 = require(v4.Packages.Fusion)
local v_u_8 = require(v4.Configuration.Region)
local v_u_9 = require(v3.Components.Button)
return function(p_u_10)
    -- upvalues: (ref) v_u_5, (copy) v_u_6, (copy) v_u_8, (copy) v_u_9, (copy) v_u_7, (copy) v_u_2, (copy) v_u_1
    v_u_5 = v_u_6.GetService("PartyService")
    for v_u_11, v_u_12 in pairs(v_u_8.Type) do
        if v_u_11 ~= "ALL" then
            local v13 = p_u_10.Component.BG.Template:Clone()
            v_u_9(v13)({
                ["Parent"] = p_u_10.Component.BG,
                ["OnActivated"] = function()
                    -- upvalues: (ref) v_u_5, (copy) v_u_11
                    v_u_5:SetMatchmakingRegion(v_u_11)
                end
            })
            v_u_7.Hydrate(v13)({
                ["Visible"] = true,
                ["LayoutOrder"] = tonumber(v_u_12),
                ["ImageColor3"] = v_u_7.Computed(function()
                    -- upvalues: (copy) p_u_10, (copy) v_u_12, (ref) v_u_2, (ref) v_u_1
                    local v14 = p_u_10.ActiveRegion
                    local v15 = v_u_12
                    return tostring(v14:get()) == tostring(v15) and v_u_2 or v_u_1
                end)
            })
            local v16 = v_u_8.Icons[v_u_11]
            v13.TextLabel.Text = ("%* [%*] %*"):format(v16, v_u_11, v_u_8.RegionNames[v_u_11])
        end
    end
end