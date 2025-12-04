-- Decompiled game.ReplicatedStorage.Tools.Sprite

local v_u_1 = game:GetService("RunService")
return {
    ["new"] = function(p2)
        return {
            ["frameRate"] = p2.FrameRate or 30,
            ["frames"] = p2.Frames
        }
    end,
    ["play"] = function(p_u_3, p_u_4)
        -- upvalues: (copy) v_u_1
        if typeof(p_u_4) == "string" then
            p_u_3.Image = p_u_4
            return function() end
        end
        if #p_u_4.frames <= 1 then
            p_u_3.Image = p_u_4.frames[1]
            return function() end
        end
        local v_u_5 = 0
        local v_u_6 = 1 / p_u_4.frameRate
        local v_u_7 = #p_u_4.frames
        local v_u_8 = v_u_6 * v_u_7
        local function v12(p9)
            -- upvalues: (ref) v_u_5, (copy) v_u_8, (copy) v_u_6, (copy) v_u_7, (copy) p_u_3, (copy) p_u_4
            v_u_5 = v_u_5 + p9
            if v_u_8 <= v_u_5 then
                v_u_5 = v_u_5 % v_u_8
            end
            local v10 = v_u_5 / v_u_6
            local v11 = math.floor(v10) % v_u_7 + 1
            p_u_3.Image = p_u_4.frames[v11]
        end
        local v_u_13 = v_u_1.Heartbeat:Connect(v12)
        v_u_5 = v_u_5 + 0
        if v_u_8 <= v_u_5 then
            v_u_5 = v_u_5 % v_u_8
        end
        local v14 = v_u_5 / v_u_6
        local v15 = math.floor(v14) % v_u_7 + 1
        p_u_3.Image = p_u_4.frames[v15]
        return function()
            -- upvalues: (copy) v_u_13
            v_u_13:Disconnect()
        end
    end
}