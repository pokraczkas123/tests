-- Decompiled game.ReplicatedFirst.Controllers.StyleController.UltraSpecial

local v_u_1 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(197, 255, 0)),
    ColorSequenceKeypoint.new(0.463, Color3.fromRGB(57, 250, 34)),
    ColorSequenceKeypoint.new(0.743, Color3.fromRGB(19, 241, 222)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(77, 174, 255))
})
local v_u_2 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(252, 181, 0)),
    ColorSequenceKeypoint.new(0.518, Color3.fromRGB(251, 50, 170)),
    ColorSequenceKeypoint.new(0.883, Color3.fromRGB(251, 50, 170)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(77, 174, 255))
})
local v_u_3 = Color3.fromRGB(244, 0, 106)
local v_u_4 = Color3.fromRGB(44, 250, 106)
local v5 = game:GetService("ReplicatedStorage")
local v_u_6 = require(v5.Packages.Fusion)
require(v5.Content.Style)
return function(p_u_7)
    -- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_4, (copy) v_u_1, (copy) v_u_2
    v_u_6.Hydrate(p_u_7.Component.Body.Info2.Check)({
        ["Image"] = v_u_6.Computed(function()
            -- upvalues: (copy) p_u_7
            return p_u_7.CompletedMastery:get() and "rbxassetid://136385575887176" or "rbxassetid://79458331531277"
        end)
    })
    v_u_6.Hydrate(p_u_7.Component.Body.Info2)({
        ["TextColor3"] = v_u_6.Computed(function()
            -- upvalues: (copy) p_u_7, (ref) v_u_3, (ref) v_u_4
            if p_u_7.CompletedMastery:get() then
                return v_u_4
            else
                return v_u_3
            end
        end)
    })
    v_u_6.Hydrate(p_u_7.Component.Body.Info2.Title.UIGradient)({
        ["Color"] = v_u_6.Computed(function()
            -- upvalues: (copy) p_u_7, (ref) v_u_1, (ref) v_u_2
            if p_u_7.CompletedMastery:get() then
                return v_u_1
            else
                return v_u_2
            end
        end),
        ["Rotation"] = v_u_6.Computed(function()
            -- upvalues: (copy) p_u_7
            return p_u_7.CompletedMastery:get() and 180 or 0
        end)
    })
end