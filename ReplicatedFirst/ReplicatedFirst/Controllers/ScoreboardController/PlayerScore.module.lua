-- Decompiled game.ReplicatedFirst.Controllers.ScoreboardController.PlayerScore

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Fusion)
local v_u_3 = require(v1.Configuration.Ranks)
local v_u_4 = require(v1.Content.Ability)
local v_u_5 = require(v1.Tools.Logger).new(script.Name)
local v_u_6 = require(v1.Configuration.Place)()
local v_u_7 = require(v1.Common.State)
return function(p8)
    -- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_7, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6
    local v_u_9 = {}
    local function v20(p_u_10, p_u_11, p_u_12, p_u_13)
        -- upvalues: (ref) v_u_2, (ref) v_u_3, (copy) v_u_9
        local v_u_14 = v_u_2.Value(p_u_10:GetAttribute(p_u_11) or p_u_13 or 0)
        local function v16()
            -- upvalues: (copy) p_u_12, (copy) v_u_14, (copy) p_u_10, (copy) p_u_11, (copy) p_u_13, (ref) v_u_3
            if p_u_12 then
                local v15 = p_u_10:GetAttribute(p_u_11)
                if v_u_3.Data[v15] then
                    v_u_14:set(v_u_3.Data[v15].Icon or "")
                else
                    v_u_14:set("")
                end
            else
                v_u_14:set(p_u_10:GetAttribute(p_u_11) or p_u_13 or 0)
                return
            end
        end
        local v17 = v_u_9
        local v18 = p_u_10:GetAttributeChangedSignal(p_u_11)
        table.insert(v17, v18:Connect(v16))
        local v19 = v_u_9
        table.insert(v19, v_u_14)
        v16()
        return v_u_14
    end
    local v21 = v20(p8.Player, v_u_7.getKey(v_u_7.Id.Statistics, "Score"))
    local v22 = v20(p8.Player, v_u_7.getKey(v_u_7.Id.Statistics, "Assists"))
    local v23 = v20(p8.Player, v_u_7.getKey(v_u_7.Id.Statistics, "Blocks"))
    local v24 = v20(p8.Player, v_u_7.getKey(v_u_7.Id.Statistics, "Sets"))
    local v25 = v20(p8.Player, v_u_7.getKey(v_u_7.Id.Statistics, "Spikes"))
    local v26 = v20(p8.Player, v_u_7.getKey(v_u_7.Id.Statistics, "Bumps"))
    local v27 = v20(p8.Player, v_u_7.getKey(v_u_7.Id.Network, "Ping"))
    local v_u_28 = v20(p8.Player, "CurrentRank", true)
    local v_u_29 = v20(p8.Player, v_u_7.getKey(v_u_7.Id.Gameplay, "Ability"), false, "")
    local v_u_30 = v20(p8.Player, v_u_7.getKey(v_u_7.Id.Ability, "Charge"))
    local v31 = v_u_2.Hydrate(p8.Component)({
        ["Visible"] = true,
        ["LayoutOrder"] = v21,
        ["Parent"] = p8.Parent,
        [v_u_2.Cleanup] = function()
            -- upvalues: (ref) v_u_2, (copy) v_u_9
            v_u_2.cleanup(v_u_9)
        end
    })
    v31.Username.Text = p8.Player.Name
    local v32 = {
        { v31.Points, v21 },
        { v31.Assists, v22 },
        { v31.Blocks, v23 },
        { v31.Sets, v24 },
        { v31.Spikes, v25 },
        { v31.Bumps, v26 },
        { v31.Ping, v27 }
    }
    for _, v_u_33 in ipairs(v32) do
        v_u_2.Hydrate(v_u_33[1])({
            ["Text"] = v_u_2.Computed(function()
                -- upvalues: (copy) v_u_33
                return v_u_33[2]:get()
            end)
        })
    end
    v_u_2.Hydrate(v31.Rank)({
        ["Image"] = v_u_2.Computed(function()
            -- upvalues: (copy) v_u_28
            return v_u_28:get()
        end),
        ["Visible"] = v_u_2.Computed(function()
            -- upvalues: (copy) v_u_28
            return v_u_28:get() ~= ""
        end)
    })
    local v_u_39 = v_u_2.Computed(function()
        -- upvalues: (copy) v_u_29, (ref) v_u_4, (copy) v_u_30, (ref) v_u_5
        local v37, v38 = pcall(function()
            -- upvalues: (ref) v_u_29, (ref) v_u_4, (ref) v_u_30
            local v34 = v_u_29:get()
            local v35
            if v34 then
                v35 = v_u_4:Get(v34)
            else
                v35 = nil
            end
            if not v35 then
                return 0
            end
            local v36 = (v_u_30:get() or 0) / (v35.Conditions.Charge or 1)
            return math.clamp(v36, 0, 1)
        end)
        if v37 then
            return v38
        end
        v_u_5:Warn(v38)
        return 0
    end)
    v_u_2.Hydrate(v31.Username.BGBar)({
        ["Visible"] = v_u_6.Current ~= v_u_6.Hardcore
    })
    v_u_2.Hydrate(v31.Username.BGBar.Bar)({
        ["Size"] = v_u_2.Computed(function()
            -- upvalues: (copy) v_u_39
            return UDim2.fromScale(v_u_39:get(), 1)
        end)
    })
    return v31
end