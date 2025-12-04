-- Decompiled game.ReplicatedStorage.Content.Item.FlamethrowerEmote

local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v_u_3 = require(v_u_1.Tools.Prop)
local v_u_4 = require(v_u_1.Tools.Sound)
local v5 = v2.new
local v6 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Flamethrower",
    ["Rarity"] = v2.Rarity.Type.Godly,
    ["Type"] = v2.Type.Emote,
    ["Description"] = "Obtained in the Season 5 Premium Pass",
    ["Asset"] = "rbxassetid://113946301576816"
}
local v11 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://75368972160795",
        ["Volume"] = 1
    },
    ["Looped"] = true,
    ["Callback"] = function(p7, p8)
        -- upvalues: (copy) v_u_1, (copy) v_u_4, (copy) v_u_3
        local v_u_9 = v_u_1.Assets.Misc.Flamethrower:Clone()
        local v_u_10 = Instance.new("Motor6D")
        v_u_9.Name = "Tee Joint.001"
        v_u_9.Parent = p7
        v_u_10.Part0 = p7.HumanoidRootPart
        v_u_10.Part1 = v_u_9
        v_u_10.Parent = p7.HumanoidRootPart
        if not p8 then
            v_u_4.fromName("FlameThrowerIgnite")({
                ["Parent"] = v_u_9
            })
            v_u_3.create({
                ["Instance"] = v_u_9,
                ["Time"] = 1,
                ["HasParticle"] = false
            })
        end
        return function()
            -- upvalues: (copy) v_u_9, (copy) v_u_10
            v_u_9:Destroy()
            v_u_10:Destroy()
        end
    end
}
v6.Metadata = v11
return v5(v6)