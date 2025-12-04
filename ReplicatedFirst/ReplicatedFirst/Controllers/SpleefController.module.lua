-- Decompiled game.ReplicatedFirst.Controllers.SpleefController

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("ReplicatedFirst")
local v4 = v2.Packages
local v5 = v2.Tools
local v_u_6 = nil
local v_u_7 = nil
local v_u_8 = require(v2.Assets.Effects.TileBurst)
local v_u_9 = require(v3.Components.Transition)
local v_u_10 = require(v2.Configuration.Game)
local v_u_11 = require(v2.Common.State)
local v_u_12 = require(v4.Fusion)
local v_u_13 = require(v4.Knit)
local v_u_14 = require(v5.Sound)
local v_u_15 = v_u_13.CreateController({
    ["Name"] = "SpleefController",
    ["InteractionCallbacks"] = {}
})
function v_u_15.KnitInit(p16)
    -- upvalues: (ref) v_u_6, (copy) v_u_13, (ref) v_u_7, (copy) v_u_15
    v_u_6 = v_u_13.GetService("SpleefService")
    v_u_7 = v_u_13.GetController("GameController")
    p16.InteractionCallbacks.Break = v_u_15.BreakTile
end
function v_u_15.KnitStart(p_u_17)
    -- upvalues: (ref) v_u_6, (copy) v_u_11, (copy) v_u_1, (copy) v_u_14
    v_u_6.TileInteracted:Connect(function(p18, p19, p20)
        -- upvalues: (copy) p_u_17
        local v21 = p_u_17.InteractionCallbacks[p18]
        if v21 then
            v21(p_u_17, p19, p20)
        end
    end)
    v_u_6.OnSplash:Connect(function(p22)
        -- upvalues: (ref) v_u_11, (ref) v_u_1, (ref) v_u_14
        if v_u_11.get(v_u_1.LocalPlayer, v_u_11.Id.Gameplay, "InGame") then
            v_u_14.fromName("WaterSplash")({
                ["Origin"] = p22.Origin
            })
        end
    end)
    p_u_17.RoundStateValue = p_u_17:BindToRoundState()
    p_u_17:BindToSpectating()
end
function v_u_15.BindToRoundState(_)
    -- upvalues: (copy) v_u_12, (ref) v_u_6
    local v_u_23 = v_u_12.Value(nil)
    v_u_6.RoundState:Observe(function(p24)
        -- upvalues: (copy) v_u_23
        if p24 then
            v_u_23:set(p24)
        end
    end)
    return v_u_23
end
function v_u_15.BindToSpectating(_)
    -- upvalues: (ref) v_u_6, (copy) v_u_9, (ref) v_u_7, (copy) v_u_10
    v_u_6.OnSpectate:Connect(function()
        -- upvalues: (ref) v_u_9, (ref) v_u_7, (ref) v_u_10
        v_u_9({
            ["Duration"] = 1.25,
            ["OnHidden"] = function() end,
            ["OnEnd"] = function() end
        })
        v_u_7:Notify({
            ["Body"] = "You are now spectating!",
            ["Color"] = v_u_10.Notification.Color.Blue
        })
    end)
end
function v_u_15.BreakTile(_, p25, p26)
    -- upvalues: (copy) v_u_11, (copy) v_u_1, (copy) v_u_14, (copy) v_u_8
    local v27 = p26.BreakTimestamp
    if v27 < workspace:GetServerTimeNow() then
        return
    else
        local v28 = v27 - workspace:GetServerTimeNow()
        if v_u_11.get(v_u_1.LocalPlayer, v_u_11.Id.Gameplay, "InGame") then
            v_u_14.fromName("TileBreak")({
                ["Parent"] = p25
            })
            v_u_8(p25, v28)
        end
    end
end
return v_u_15