-- Decompiled game.ReplicatedStorage.Content.Item.VolcanoEmote

local v_u_1 = game:GetService("Debris")
local v_u_2 = game:GetService("ReplicatedStorage")
local v3 = require(script.Parent)
local v_u_4 = require(v_u_2.Tools.Prop)
local v5 = v3.new
local v12 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Volcano Emote",
    ["Rarity"] = v3.Rarity.Type.Rare,
    ["Type"] = v3.Type.Emote,
    ["Description"] = "Obtained in the Season 5 Pass",
    ["Asset"] = "rbxassetid://112679048290528",
    ["Metadata"] = {
        ["Sound"] = "rbxassetid://110418219604786",
        ["Looped"] = false,
        ["Callback"] = function(p6, p7)
            -- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_4
            local v_u_8 = v_u_2.Assets.Misc.VolcanoEmote:Clone()
            local v_u_9 = Instance.new("Motor6D")
            v_u_8.Name = "Circle.009"
            if not p7 then
                v_u_1:AddItem(v_u_8, 5)
                v_u_1:AddItem(v_u_9, 5)
                local v_u_10 = v_u_8:GetDescendants()
                task.delay(3, function()
                    -- upvalues: (copy) v_u_8, (copy) v_u_10
                    if not (v_u_8 and v_u_8.Parent) then
                        return
                    end
                    for _, v11 in ipairs(v_u_10) do
                        if not (v11 and v11.Parent) then
                            break
                        end
                        if v11:IsA("ParticleEmitter") or v11:IsA("Beam") then
                            v11.Enabled = true
                        end
                    end
                end)
            end
            v_u_8.Parent = p6
            v_u_9.Part0 = p6.HumanoidRootPart
            v_u_9.Part1 = v_u_8
            v_u_9.Parent = p6.HumanoidRootPart
            if not p7 then
                v_u_4.create({
                    ["Instance"] = v_u_8,
                    ["Time"] = 1,
                    ["HasParticle"] = false
                })
            end
            return function()
                -- upvalues: (copy) v_u_8, (copy) v_u_9
                v_u_8:Destroy()
                v_u_9:Destroy()
            end
        end
    }
}
return v5(v12)