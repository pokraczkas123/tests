-- Decompiled game.ReplicatedFirst.Assets.DeRankVfxUI.InterfaceShaker

local v_u_1 = {
    ["Threads"] = {},
    ["StartPositions"] = {},
    ["StartRotations"] = {},
    ["CancelEvents"] = {}
}
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = Random.new()
function v_u_1.ShakeOnce(p_u_5, p_u_6, p_u_7, p_u_8, p_u_9)
    -- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
    if v_u_1.Threads[p_u_5] then
        v_u_1.CancelEvents[p_u_5]:Fire()
        task.cancel(v_u_1.Threads[p_u_5])
        v_u_1.Threads[p_u_5] = nil
    end
    local v_u_10 = v_u_1.StartPositions[p_u_5] or p_u_5.Position
    local v_u_11 = v_u_1.StartRotations[p_u_5] or p_u_5.Rotation
    local v_u_12 = Instance.new("BindableEvent")
    local v_u_13 = v_u_12.Event
    if not v_u_1.StartPositions[p_u_5] then
        v_u_1.StartPositions[p_u_5] = v_u_10
    end
    v_u_1.StartRotations[p_u_5] = v_u_11
    v_u_1.CancelEvents[p_u_5] = v_u_12
    v_u_1.Threads[p_u_5] = task.spawn(function()
        -- upvalues: (copy) p_u_6, (ref) v_u_2, (ref) v_u_4, (copy) p_u_5, (copy) v_u_10, (copy) v_u_11, (ref) v_u_3, (copy) p_u_8, (copy) p_u_7, (copy) p_u_9, (copy) v_u_12, (copy) v_u_13, (ref) v_u_1
        local v_u_14 = p_u_6 / 800
        local v_u_15 = p_u_6
        local v_u_16 = {
            ["multiplier"] = Instance.new("NumberValue"),
            ["rotation"] = Instance.new("NumberValue"),
            ["position"] = Instance.new("Vector3Value")
        }
        v_u_16.multiplier.Value = 0
        local v_u_17 = nil
        local v_u_18 = nil
        local v_u_22 = task.spawn(function()
            -- upvalues: (ref) v_u_17, (ref) v_u_2, (ref) v_u_4, (copy) v_u_14, (copy) v_u_15, (ref) v_u_16, (ref) p_u_5, (ref) v_u_10, (ref) v_u_11
            v_u_17 = v_u_2.RenderStepped:Connect(function(_)
                -- upvalues: (ref) v_u_4, (ref) v_u_14, (ref) v_u_15, (ref) v_u_16, (ref) p_u_5, (ref) v_u_10, (ref) v_u_11
                local v19 = v_u_4:NextNumber(-v_u_14, v_u_14)
                local v20 = v_u_4:NextNumber(-v_u_14, v_u_14)
                local v21 = v_u_4:NextNumber(-v_u_15, v_u_15)
                v_u_16.position.Value = Vector3.new(v19, v20, 0)
                p_u_5.Position = v_u_10 + UDim2.fromScale(v_u_16.position.Value.X * v_u_16.multiplier.Value, v_u_16.position.Value.Y * v_u_16.multiplier.Value)
                v_u_16.rotation.Value = v21
                p_u_5.Rotation = v_u_11 + v_u_16.rotation.Value * v_u_16.multiplier.Value
            end)
        end)
        local v_u_23 = task.spawn(function()
            -- upvalues: (ref) v_u_3, (ref) v_u_16, (ref) p_u_8, (ref) p_u_7, (ref) p_u_9, (ref) v_u_12
            v_u_3:Create(v_u_16.multiplier, TweenInfo.new(p_u_8, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                ["Value"] = 1
            }):Play()
            task.wait(p_u_8)
            v_u_16.multiplier.Value = 1
            task.wait(p_u_7)
            v_u_3:Create(v_u_16.multiplier, TweenInfo.new(p_u_9, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                ["Value"] = 0
            }):Play()
            task.wait(p_u_9)
            v_u_16.multiplier.Value = 0
            v_u_12:Fire()
        end)
        v_u_18 = v_u_13:Connect(function()
            -- upvalues: (copy) v_u_22, (copy) v_u_23, (ref) v_u_17, (ref) v_u_18, (ref) v_u_12, (ref) v_u_16, (ref) v_u_1, (ref) p_u_5
            task.cancel(v_u_22)
            task.cancel(v_u_23)
            v_u_17:Disconnect()
            v_u_18:Disconnect()
            v_u_12:Destroy()
            v_u_16.rotation:Destroy()
            v_u_16.position:Destroy()
            v_u_16.multiplier:Destroy()
            v_u_16 = {}
            v_u_1.Threads[p_u_5] = nil
        end)
    end)
end
return v_u_1