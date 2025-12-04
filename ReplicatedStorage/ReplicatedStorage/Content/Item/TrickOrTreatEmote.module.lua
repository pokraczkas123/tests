-- Decompiled game.ReplicatedStorage.Content.Item.TrickOrTreatEmote

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Debris")
local v3 = require(script.Parent)
local v_u_4 = require(v_u_1.Tools.Sound)
local v_u_5 = require(v_u_1.Tools.Prop)
local v6 = v3.new
local v7 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Trick Or Treat",
    ["Rarity"] = v3.Rarity.Type.Rare,
    ["Type"] = v3.Type.Emote,
    ["Description"] = "Obtained in the Season 8 Pass",
    ["Asset"] = "rbxassetid://134115142685022"
}
local v14 = {
    ["Looped"] = false,
    ["Sound"] = {
        ["Id"] = "rbxassetid://104264652096342"
    },
    ["Callback"] = function(p8, p9)
        -- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_5, (copy) v_u_4
        local v_u_10 = v_u_1.Assets.Misc.TrickOrTreatBag:Clone()
        local v_u_11 = Instance.new("Motor6D")
        if not p9 then
            v_u_2:AddItem(v_u_10, 5)
            v_u_2:AddItem(v_u_11, 5)
            v_u_5.create({
                ["Instance"] = v_u_10,
                ["HasParticle"] = true
            })
            task.delay(1.8, function()
                -- upvalues: (copy) v_u_10
                for _, v12 in ipairs(v_u_10:GetChildren()) do
                    if v12:IsA("ParticleEmitter") then
                        v12.Enabled = false
                    end
                end
            end)
        end
        v_u_10.Parent = p8
        v_u_11.Parent = p8.HumanoidRootPart
        v_u_11.Part0 = p8.HumanoidRootPart
        v_u_11.Part1 = v_u_10
        return function()
            -- upvalues: (ref) v_u_4, (copy) v_u_10, (copy) v_u_11
            local v13 = {
                ["Id"] = "rbxassetid://101795207043317",
                ["Parent"] = v_u_10
            }
            v_u_4.new(v13)
            v_u_10:Destroy()
            v_u_11:Destroy()
        end
    end
}
v7.Metadata = v14
return v6(v7)