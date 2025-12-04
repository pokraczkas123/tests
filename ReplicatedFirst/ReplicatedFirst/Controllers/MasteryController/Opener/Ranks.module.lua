-- Decompiled game.ReplicatedFirst.Controllers.MasteryController.Opener.Ranks

local v_u_1 = Color3.fromRGB(255, 238, 0)
local v_u_2 = Color3.fromRGB(179, 0, 255)
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = require(v3.Packages.Fusion)
require(v3.Content.Mastery)
local v_u_5 = require(v3.Content.Reward)
return function(p_u_6)
    -- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_1, (copy) v_u_2
    local v_u_7 = p_u_6.Component.Template
    v_u_4.Hydrate(p_u_6.Component)({
        [v_u_4.Children] = v_u_4.ForPairs(p_u_6.MasteryLevels, function(p_u_8, p9)
            -- upvalues: (copy) v_u_7, (copy) p_u_6, (ref) v_u_5, (ref) v_u_4, (ref) v_u_1, (ref) v_u_2
            local v10 = p9.Reward
            local v11 = v_u_7:Clone()
            v11.Parent = p_u_6.Component
            v11.Name = "Level" .. p_u_8
            v11.LayoutOrder = p_u_8
            v_u_5.setIcon(v10, v11.Reward)
            v11.LevelIcon.Title.Text = ("%*"):format(p_u_8)
            v_u_4.Hydrate(v11.LevelIcon)({
                ["ImageColor3"] = v_u_4.Computed(function()
                    -- upvalues: (ref) p_u_6, (copy) p_u_8
                    if p_u_6.HasCompletedMastery:get() then
                        return Color3.new(1, 1, 1)
                    elseif p_u_8 < p_u_6.CurrentLevel:get() then
                        return Color3.new(1, 1, 1)
                    else
                        return Color3.new()
                    end
                end)
            })
            v_u_4.Hydrate(v11.LevelIcon.Glow)({
                ["ImageColor3"] = v_u_4.Computed(function()
                    -- upvalues: (ref) p_u_6, (ref) v_u_1, (copy) p_u_8, (ref) v_u_2
                    if p_u_6.HasCompletedMastery:get() then
                        return v_u_1
                    elseif p_u_8 < p_u_6.CurrentLevel:get() then
                        return v_u_1
                    else
                        return v_u_2
                    end
                end)
            })
            v11.Visible = true
            return p_u_8, v11
        end, v_u_4.cleanup)
    })
end