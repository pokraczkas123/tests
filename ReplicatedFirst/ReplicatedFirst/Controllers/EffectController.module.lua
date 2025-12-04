-- Decompiled game.ReplicatedFirst.Controllers.EffectController

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = nil
local v_u_4 = require(v_u_1.Packages.Knit)
local v_u_5 = require(v_u_1.Tools.Aura)
local v_u_6 = require(v_u_1.Content.Effect)
local v_u_7 = require(v_u_1.Tools.Sound)
local v_u_8 = require(v_u_1.Tools.Logger).new(script.Name)
local v9 = v_u_4.CreateController({
    ["Name"] = "EffectController"
})
function v9.KnitInit(p10)
    -- upvalues: (ref) v_u_2, (copy) v_u_4, (ref) v_u_3
    v_u_2 = v_u_4.GetService("GameService")
    v_u_3 = v_u_4.GetService("AbilityService")
    p10:BindToConnections()
end
function v9.BindToConnections(_)
    -- upvalues: (ref) v_u_2, (copy) v_u_1, (copy) v_u_8, (copy) v_u_6, (copy) v_u_7, (ref) v_u_3, (copy) v_u_5
    v_u_2.Effect:Connect(function(p11, p12)
        -- upvalues: (ref) v_u_1, (ref) v_u_8, (ref) v_u_6
        if p12.IsModuleEffect then
            local v13 = v_u_1.Assets.Effects:FindFirstChild(p11)
            if v13 then
                require(v13)(p12.Character, p12.Props)
            else
                v_u_8:Warn((("Effect module \'%*\' not found!"):format(p11)))
            end
        else
            v_u_6:Play(p11)(p12)
            return
        end
    end)
    v_u_2.Sound:Connect(function(p14, p15)
        -- upvalues: (ref) v_u_7
        v_u_7.fromName(p14)(p15)
    end)
    v_u_3.Aura:Connect(function(...)
        -- upvalues: (ref) v_u_5
        v_u_5.applyForPlayer(...)
    end)
    v_u_3.AuraDelete:Connect(function(p16)
        -- upvalues: (ref) v_u_5
        v_u_5.deleteForPlayer(p16)
    end)
end
return v9