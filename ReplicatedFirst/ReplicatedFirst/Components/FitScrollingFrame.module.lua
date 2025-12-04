-- Decompiled game.ReplicatedFirst.Components.FitScrollingFrame

local v_u_1 = {}
return function(p_u_2, p_u_3, p_u_4)
    -- upvalues: (copy) v_u_1
    if not v_u_1[p_u_2] then
        if typeof(p_u_3) ~= "Vector2" then
            p_u_3 = Vector2.new(0, p_u_3)
        end
        v_u_1[p_u_2] = true
        local v_u_5 = p_u_2:FindFirstChildOfClass("UIListLayout") or p_u_2:FindFirstChildOfClass("UIGridLayout")
        p_u_2.CanvasSize = UDim2.fromOffset(v_u_5.AbsoluteContentSize.X + p_u_3.X, v_u_5.AbsoluteContentSize.Y + p_u_3.Y)
        v_u_5:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            -- upvalues: (copy) p_u_4, (copy) p_u_2, (copy) v_u_5, (ref) p_u_3
            local v6
            if p_u_4 == Enum.SizeConstraint.RelativeYY then
                v6 = p_u_2.AbsoluteSize.X
            else
                v6 = v_u_5.AbsoluteContentSize.X
            end
            local v7 = v6 + p_u_3.X
            local v8
            if p_u_4 == Enum.SizeConstraint.RelativeXX then
                v8 = p_u_2.AbsoluteSize.Y
            else
                v8 = v_u_5.AbsoluteContentSize.Y
            end
            local v9 = v8 + p_u_3.Y
            p_u_2.CanvasSize = UDim2.fromOffset(v7, v9)
        end)
    end
end