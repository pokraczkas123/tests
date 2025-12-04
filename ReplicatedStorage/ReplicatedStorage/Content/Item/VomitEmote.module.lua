-- Decompiled game.ReplicatedStorage.Content.Item.VomitEmote

local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = v2.new
local v6 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "\240\159\164\174",
    ["Rarity"] = v2.Rarity.Type.Legendary,
    ["Type"] = v2.Type.Emote,
    ["Description"] = "Obtained by reaching Diamond I in Season 6",
    ["Asset"] = "rbxassetid://128329219328127",
    ["Metadata"] = {
        ["Callback"] = function(p4, _)
            -- upvalues: (copy) v_u_1
            local v_u_5 = v_u_1.Assets.Misc.VomitParticles.Attachment:Clone()
            v_u_5.Parent = p4.Head
            return function()
                -- upvalues: (copy) v_u_5
                v_u_5:Destroy()
            end
        end
    }
}
return v3(v6)