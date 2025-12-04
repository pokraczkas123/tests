-- Decompiled game.ReplicatedStorage.Content.Special.Kazana

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v_u_3 = require(v1.Tools.Sound)
local v_u_4 = require(v1.Common.State)
local v_u_5 = require(v1.Assets.Effects.KazanaBlue)
local v_u_6 = require(v1.Assets.Effects.KazanaWhite)
return v2.new({
    ["Id"] = script.Name,
    ["Type"] = v2.Type.Activation,
    ["DisplayName"] = "Charge Jump",
    ["Description"] = { "Hold <font color=\"rgb(255,125,0)\">Jump</font> to charge the meter!", "<font color=\"rgb(255,125,0)\">Release</font> to leap much higher than normal!" },
    ["Icon"] = "rbxassetid://115969994343716",
    ["Callback"] = function(p7, p8)
        -- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_5, (copy) v_u_3
        if v_u_4.get(p8, v_u_4.Id.Special, "CooldownTimestamp", 0) <= workspace:GetServerTimeNow() then
            local v9 = not v_u_4.get(p8, v_u_4.Id.Special, "ChargeJumpDisabled", false)
            if v9 then
                v_u_6(p8.Character)
            else
                v_u_5(p8.Character)
            end
            v_u_3.fromName((("Kazana_%*"):format(v9 and "White" or "Blue")))({})
            v_u_4.set(p8, v_u_4.Id.Special, "ChargeJumpDisabled", v9)
            v_u_4.set(p8, v_u_4.Id.Special, "CooldownTimestamp", workspace:GetServerTimeNow() + p7.Metadata.Debounce)
        end
    end
})