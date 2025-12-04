-- Decompiled game.ReplicatedStorage.Content.Item.TurkeyExplodingEmote

local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v_u_3 = require(v_u_1.Common.EmoteLib)
local function v_u_6(p4)
    for _, v_u_5 in p4:GetDescendants() do
        if v_u_5:IsA("ParticleEmitter") then
            task.delay(v_u_5:GetAttribute("EmitDelay"), function()
                -- upvalues: (copy) v_u_5
                v_u_5:Emit(v_u_5:GetAttribute("EmitCount"))
            end)
        end
    end
end
local v7 = v2.new
local v15 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Exploding Turkey Emote",
    ["Rarity"] = v2.Rarity.Type.Legendary,
    ["Type"] = v2.Type.Emote,
    ["Description"] = "Obtained by opening a Crate in Season 9",
    ["Asset"] = "rbxassetid://132131095471775",
    ["Metadata"] = {
        ["Looped"] = false,
        ["Sound"] = "rbxassetid://79964287402987",
        ["Callback"] = function(p8, _)
            -- upvalues: (copy) v_u_3, (copy) v_u_1, (copy) v_u_6
            local v9 = v_u_3.applyRigTemplateToCharacter
            local v10 = {
                ["Character"] = p8,
                ["Rig"] = v_u_1.Assets.Misc.EmoteAssets.TurkeyOnPlate
            }
            local v11 = {
                ["Turkey"] = {
                    ["PartName"] = "Cube"
                }
            }
            v10.RigTemplate = v11
            local v_u_12, v_u_13 = v9(v10)
            local v_u_14 = task.defer(function()
                -- upvalues: (ref) v_u_6, (copy) v_u_13
                task.wait(1.7)
                v_u_6(v_u_13.Parts.Turkey.ExplosionParticles)
            end)
            return function()
                -- upvalues: (copy) v_u_12, (copy) v_u_14
                v_u_12()
                task.cancel(v_u_14)
            end
        end
    }
}
return v7(v15)