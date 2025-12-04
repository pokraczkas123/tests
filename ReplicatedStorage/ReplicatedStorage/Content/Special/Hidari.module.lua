-- Decompiled game.ReplicatedStorage.Content.Special.Hidari

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
require(v1.Common.Context)
local v3 = v2.new
local v7 = {
    ["Id"] = script.Name,
    ["Type"] = v2.Type.Action,
    ["DisplayName"] = "Lefty Spike",
    ["Description"] = { "Spike / Serve on your <font color=\"rgb(255,125,0)\">left</font> side!", "For <font color=\"rgb(255,125,0)\">INSANE</font> Power!" },
    ["Icon"] = "rbxassetid://108966524101396",
    ["Move"] = v2.Move.Spike,
    ["Rules"] = {
        ["CanEvaluateCanRunOnClient"] = true
    },
    ["CanRun"] = require(script.CanRun),
    ["PreAction"] = function(p4, p5)
        p5.SpecialProps.SpikeGravityMultiplier = p4.Metadata.SpikeGravityMultiplier
        p5.SpecialProps.ServeSpikePower = p4.Metadata.ServeSpikePower
        p5.SpecialProps.SpikePower = p4.Metadata.SpikePower
        return true
    end,
    ["PostAction"] = function(_, p6)
        p6.State.Effect.Sound = "PowerSpike"
        p6.State.Effect.Visual = "HidariSpikeVFX"
        return true
    end
}
return v3(v7)