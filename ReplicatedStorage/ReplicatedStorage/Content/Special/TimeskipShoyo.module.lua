-- Decompiled game.ReplicatedStorage.Content.Special.TimeskipShoyo

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v_u_3 = require(v1.Common.Context)
return v2.new({
    ["Id"] = script.Name,
    ["Type"] = v2.Type.Charge,
    ["DisplayName"] = "Super Spike",
    ["Description"] = { "Run to charge a<font color=\"rgb(255,125,0)\"> Super Spike </font> meter!", "Jumping while moving hits a <font color=\"rgb(255,125,0)\">Super Spike!</font>" },
    ["Icon"] = "rbxassetid://75241014394333",
    ["Move"] = v2.Move.Spike,
    ["CanRun"] = function(_, p4)
        -- upvalues: (copy) v_u_3
        return p4.State.Stage == v_u_3.Stage.PostAction and p4.Move == "Spike"
    end,
    ["PostAction"] = function(_, p5)
        if (p5.SpecialCharge or 0) < 0.8 then
            return false
        end
        p5.State.Effect.Sound = "PowerSpike"
        p5.State.Effect.Visual = "SpecialChargeSpikeVFX"
        p5.State.Effect.ReplicateToClient = true
        return true
    end
})