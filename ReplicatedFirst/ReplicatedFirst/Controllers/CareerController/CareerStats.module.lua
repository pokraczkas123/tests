-- Decompiled game.ReplicatedFirst.Controllers.CareerController.CareerStats

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v1.Components.FitScrollingFrame)
local v_u_4 = require(v2.Packages.Fusion)
local v_u_5 = require(v2.Tools.Number)
local v_u_6 = require(v2.Tools.Time)
local v_u_7 = require(script.Whitelist)
local v_u_8 = v_u_4.Children
return function(p_u_9)
    -- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_6, (copy) v_u_8, (copy) v_u_7, (copy) v_u_5
    v_u_4.Hydrate(p_u_9.Component)({
        ["Visible"] = v_u_4.Computed(function()
            -- upvalues: (copy) p_u_9
            return p_u_9.ActiveTab:get() == script.Name
        end)
    })
    v_u_3(p_u_9.Component)
    local v_u_10 = v_u_4.Value(0)
    local v11 = v_u_4.Hydrate(p_u_9.Component.Template:Clone())({
        ["Parent"] = p_u_9.Component,
        ["Name"] = "___",
        ["Visible"] = true
    })
    task.spawn(function()
        -- upvalues: (copy) v_u_10
        while task.wait(10) do
            v_u_10:set(v_u_10:get() + 10)
        end
    end)
    v11.Key.Text = "Time Played:"
    v_u_4.Hydrate(v11.Value)({
        ["Text"] = v_u_4.Computed(function()
            -- upvalues: (ref) v_u_6, (copy) v_u_10, (copy) p_u_9
            return v_u_6.humanizeHours(v_u_10:get() + p_u_9.Playtime)
        end)
    })
    local v12 = v_u_4.Hydrate(p_u_9.Component.Template:Clone())({
        ["Parent"] = p_u_9.Component,
        ["Name"] = "___A",
        ["Visible"] = true
    })
    v12.Key.Text = "Longest Session:"
    v12.Value.Text = v_u_6.format(p_u_9.LongestSession, "hh:mm:ss")
    v_u_4.Hydrate(p_u_9.Component)({
        [v_u_8] = { v11, v_u_4.ForPairs(p_u_9.Career, function(p13, p14)
                -- upvalues: (ref) v_u_7, (ref) v_u_5, (ref) v_u_4, (copy) p_u_9
                if not v_u_7[p13] then
                    return p13
                end
                local v15 = v_u_5.format(p14)
                local v16 = v_u_4.Hydrate(p_u_9.Component.Template:Clone())({
                    ["Parent"] = p_u_9.Component,
                    ["Visible"] = p13 ~= "Experience",
                    ["Name"] = p13
                })
                v_u_4.Hydrate(v16.Key)({
                    ["Text"] = ("%*:"):format(p13)
                })
                v_u_4.Hydrate(v16.Value)({
                    ["Text"] = v15
                })
                return p13, v16
            end, v_u_4.cleanup) }
    })
end