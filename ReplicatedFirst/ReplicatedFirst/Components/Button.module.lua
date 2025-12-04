-- Decompiled game.ReplicatedFirst.Components.Button

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("SoundService")
local v_u_3 = require(v1:WaitForChild("Packages"):WaitForChild("Fusion"))
return function(p_u_4)
    -- upvalues: (copy) v_u_3, (copy) v_u_2
    return function(p_u_5)
        -- upvalues: (ref) v_u_3, (copy) p_u_4, (ref) v_u_2
        p_u_5.Scale = p_u_5.Scale or {}
        local v_u_6 = p_u_5.ScaleValue or v_u_3.Value(p_u_5.Scale.Base or 1)
        local v7 = p_u_5.ScaleSpring or v_u_3.Spring(v_u_6, 50, 0.7)
        local v10 = v_u_3.Hydrate(p_u_4)({
            ["Name"] = p_u_5.Name,
            ["AnchorPoint"] = p_u_5.AnchorPoint,
            ["Text"] = p_u_5.Text,
            ["BackgroundColor3"] = p_u_5.Color,
            ["ImageColor3"] = p_u_5.ImageColor,
            ["LayoutOrder"] = p_u_5.LayoutOrder,
            ["Size"] = p_u_5.Size,
            ["Position"] = p_u_5.Position,
            ["Image"] = p_u_5.Image,
            ["Visible"] = p_u_5.Visible,
            ["Parent"] = p_u_5.Parent,
            [v_u_3.OnEvent("Activated")] = function()
                -- upvalues: (copy) p_u_5, (ref) v_u_2
                if not p_u_5.Active or p_u_5.Active:get() ~= false then
                    if p_u_5.OnActivated then
                        task.spawn(p_u_5.OnActivated)
                    end
                    local v8 = Instance.new("Sound")
                    v8.SoundId = "rbxassetid://10066968815"
                    v8.Parent = v_u_2
                    v8.PlayOnRemove = true
                    v8:Destroy()
                end
            end,
            [v_u_3.OnEvent("MouseEnter")] = function()
                -- upvalues: (copy) p_u_5, (ref) v_u_2, (copy) v_u_6
                if not p_u_5.Active or p_u_5.Active:get() ~= false then
                    local v9 = Instance.new("Sound")
                    v9.SoundId = "rbxassetid://10066931761"
                    v9.Parent = v_u_2
                    v9.PlayOnRemove = true
                    v9:Destroy()
                    v_u_6:set(p_u_5.Scale.Hover or 1.1)
                    if p_u_5.OnHoverStart then
                        task.spawn(p_u_5.OnHoverStart)
                    end
                end
            end,
            [v_u_3.OnEvent("MouseLeave")] = function()
                -- upvalues: (copy) v_u_6, (copy) p_u_5
                v_u_6:set(p_u_5.Scale.Base or 1)
                if not p_u_5.Active or p_u_5.Active:get() ~= false then
                    if p_u_5.OnHoverEnd then
                        task.spawn(p_u_5.OnHoverEnd)
                    end
                end
            end,
            [v_u_3.OnEvent("MouseButton1Down")] = function()
                -- upvalues: (copy) p_u_5, (copy) v_u_6
                if not p_u_5.Active or p_u_5.Active:get() ~= false then
                    v_u_6:set(p_u_5.Scale.Down or 0.9)
                    if p_u_5.OnMouseStart then
                        task.spawn(p_u_5.OnMouseStart)
                    end
                end
            end,
            [v_u_3.OnEvent("MouseButton1Up")] = function()
                -- upvalues: (copy) p_u_5, (copy) v_u_6
                if not p_u_5.Active or p_u_5.Active:get() ~= false then
                    v_u_6:set(p_u_5.Scale.Base or 1)
                    if p_u_5.OnMouseEnd then
                        task.spawn(p_u_5.OnMouseEnd)
                    end
                end
            end
        })
        v_u_3.New("UIScale")({
            ["Scale"] = v7,
            ["Parent"] = v10
        })
        return v10
    end
end