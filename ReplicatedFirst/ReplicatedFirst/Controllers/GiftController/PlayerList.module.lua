-- Decompiled game.ReplicatedFirst.Controllers.GiftController.PlayerList

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedFirst")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = require(v2.Components.FitScrollingFrame)
local v_u_5 = require(v3.Tools.Utility).getHeadshot
local v_u_6 = require(v3.Packages.Fusion)
local v_u_7 = require(v2.Components.Button)
return function(p_u_8)
    -- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_1, (copy) v_u_7, (copy) v_u_5
    v_u_4(p_u_8.Component, 30, Enum.SizeConstraint.RelativeYY)
    v_u_6.Hydrate(p_u_8.Component)({
        ["Visible"] = v_u_6.Computed(function()
            -- upvalues: (copy) p_u_8
            return p_u_8.CurrentPage:get() == p_u_8.Component.Name
        end),
        [v_u_6.Children] = v_u_6.ForValues(p_u_8.Players, function(p_u_9)
            -- upvalues: (ref) v_u_1, (ref) v_u_6, (copy) p_u_8, (ref) v_u_7, (ref) v_u_5
            if p_u_9 ~= v_u_1.LocalPlayer then
                local v_u_11 = v_u_6.Hydrate(p_u_8.Component.Template:Clone())({
                    ["Parent"] = p_u_8.Component,
                    ["Visible"] = v_u_6.Computed(function()
                        -- upvalues: (ref) p_u_8, (copy) p_u_9
                        local v10 = (p_u_8.Filter:get() or ""):lower()
                        return v10 == "" and true or p_u_9.Name:lower():find(v10)
                    end),
                    ["Name"] = p_u_9.Name,
                    ["SelectionOrder"] = #p_u_8.Component:GetChildren(),
                    ["LayoutOrder"] = #p_u_8.Component:GetChildren()
                })
                v_u_6.Hydrate(v_u_11.Username)({
                    ["Text"] = ("@%*"):format(p_u_9.Name or p_u_9.DisplayName)
                })
                local v12 = {
                    ["OnActivated"] = function()
                        -- upvalues: (ref) p_u_8, (copy) p_u_9
                        p_u_8.SelectedPlayer:set({
                            ["Name"] = p_u_9.Name or p_u_9.DisplayName,
                            ["UserId"] = p_u_9.UserId or p_u_9.Id
                        })
                    end
                }
                v_u_7(v_u_11)(v12)
                task.spawn(function()
                    -- upvalues: (ref) v_u_5, (copy) p_u_9, (copy) v_u_11
                    local v13 = v_u_5(p_u_9.UserId or p_u_9.Id)
                    if v_u_11 and v_u_11.Parent then
                        v_u_11.Avatar.Image = v13
                    end
                end)
                return v_u_11
            end
        end, v_u_6.cleanup)
    })
    v_u_6.Hydrate(p_u_8.Component.Placeholder)({
        ["Visible"] = v_u_6.Computed(function()
            -- upvalues: (copy) p_u_8, (ref) v_u_1
            for _, v14 in pairs(p_u_8.Players:get()) do
                if v14 ~= v_u_1.LocalPlayer and (typeof(v14) ~= "table" or v14.Id ~= v_u_1.LocalPlayer.UserId) then
                    return false
                end
            end
            return true
        end)
    })
end