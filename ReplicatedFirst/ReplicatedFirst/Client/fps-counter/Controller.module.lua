-- Decompiled game.ReplicatedFirst.Client.fps-counter.Controller

local v_u_1 = game:GetService("RunService")
local v_u_2 = game:GetService("TextChatService")
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.new(p4)
    -- upvalues: (copy) v_u_3
    local v5 = v_u_3
    local v6 = setmetatable({}, v5)
    local v7 = p4.Interface
    assert(v7, "Interface is required")
    local v8 = p4.Interface:IsA("ScreenGui")
    assert(v8, "Interface must be a ScreenGui")
    local v9 = p4.RenderRate
    local v10 = typeof(v9) == "number" and true or p4.RenderRate == nil
    assert(v10, "RenderRate must be a number")
    local v11 = p4.MaxSamples
    local v12 = typeof(v11) == "number" and true or p4.MaxSamples == nil
    assert(v12, "MaxSamples must be a number")
    v6.Interface = p4.Interface
    v6.RenderRate = p4.RenderRate or 60
    v6.MaxSamples = p4.MaxSamples or 300
    v6.FrameDeltas = {}
    v6.MinFps = (1 / 0)
    v6.MaxFps = 0
    v6.LastUpdateTime = 0
    v6.IsVisible = false
    v6.IsEnabled = v6.IsVisible
    v6.Connections = {}
    v6:Init()
    return v6
end
function v_u_3.Init(p_u_13)
    -- upvalues: (copy) v_u_1, (copy) v_u_2
    p_u_13.Interface.Enabled = p_u_13.IsVisible
    local v14 = p_u_13.Connections
    local v15 = v_u_1.RenderStepped
    table.insert(v14, v15:Connect(function(p16)
        -- upvalues: (copy) p_u_13
        p_u_13:Update(p16)
    end))
    local v17 = p_u_13.Connections
    local v18 = p_u_13.Interface.Container.Buttons.Reset.Activated
    table.insert(v17, v18:Connect(function()
        -- upvalues: (copy) p_u_13
        p_u_13:Reset()
    end))
    local v19 = p_u_13.Connections
    local v20 = p_u_13.Interface.Container.Buttons.Toggle.Activated
    table.insert(v19, v20:Connect(function()
        -- upvalues: (copy) p_u_13
        p_u_13:Toggle()
    end))
    p_u_13.Interface.Container.Version.Text = ("Kareem\'s FPS Counter v%s"):format("1.1.0")
    local v21 = Instance.new("TextChatCommand")
    v21.Name = "FPSCounterCommand"
    v21.PrimaryAlias = "/fps"
    v21.Triggered:Connect(function()
        -- upvalues: (copy) p_u_13
        p_u_13.IsVisible = not p_u_13.IsVisible
        p_u_13.Interface.Enabled = p_u_13.IsVisible
        p_u_13:Toggle(p_u_13.IsVisible)
    end)
    v21.Parent = v_u_2:WaitForChild("TextChatCommands")
end
function v_u_3.Update(p22, p23)
    if p22.IsEnabled then
        p22.LastUpdateTime = p22.LastUpdateTime + p23
        local v24 = p22.FrameDeltas
        table.insert(v24, p23)
        if #p22.FrameDeltas > p22.MaxSamples then
            table.remove(p22.FrameDeltas, 1)
        end
        if p22.LastUpdateTime >= 1 / p22.RenderRate then
            p22:Render()
            p22.LastUpdateTime = 0
        end
    end
end
function v_u_3.Evaluate(p25)
    if #p25.FrameDeltas == 0 then
        return 0, 0, 0
    end
    local v26 = {}
    local v27 = p25.FrameDeltas
    __set_list(v26, 1, {table.unpack(v27)})
    table.sort(v26, function(p28, p29)
        return p29 < p28
    end)
    local v30 = #v26
    local v31 = p25:ComputeAverageFpsFromSlice(v26)
    local v32 = v30 * 0.01
    local v33 = math.floor(v32)
    local v34 = p25:ComputeAverageFpsFromSlice(v26, 1, v33 < 1 and 1 or v33)
    local v35 = v30 * 0.001
    local v36 = math.floor(v35)
    return v31, v34, p25:ComputeAverageFpsFromSlice(v26, 1, v36 < 1 and 1 or v36)
end
function v_u_3.ComputeAverageFpsFromSlice(_, p37, p38, p39)
    local v40 = p38 or 1
    local v41 = p39 or #p37
    if v41 < v40 then
        return 0
    end
    local v42 = 0
    for v43 = v40, v41 do
        v42 = v42 + p37[v43]
    end
    local v44 = v42 / (v41 - v40 + 1)
    return v44 > 0 and 1 / v44 or 0
end
function v_u_3.Render(p45)
    local v46, v47, v48 = p45:Evaluate()
    local v49 = math.round(v46)
    local v50 = math.round(v47)
    local v51 = math.round(v48)
    local v52
    if p45.MinFps == 0 then
        v52 = v49
    else
        local v53 = p45.MinFps
        v52 = math.min(v53, v49)
    end
    p45.MinFps = v52
    local v54 = p45.MaxFps
    p45.MaxFps = math.max(v54, v49)
    local v55 = p45.Interface.Container
    v55.AverageFrameRate.Value.Text = ("%d"):format(v49)
    v55.OnePercentFrameRate.Value.Text = ("%d"):format(v50)
    v55.ZeroOnePercentFrameRate.Value.Text = ("%d"):format(v51)
    v55.MaxFrameRate.Value.Text = ("%d"):format(p45.MaxFps)
    v55.MinFrameRate.Value.Text = ("%d"):format(p45.MinFps)
end
function v_u_3.Toggle(p56, p57)
    if p57 == nil then
        p57 = not p56.IsEnabled
    end
    p56.IsEnabled = p57
    p56.Interface.Container.Buttons.Toggle.Text = p56.IsEnabled and "Enabled" or "Disabled"
    p56.Interface.Container.Buttons.Toggle.BackgroundColor3 = p56.IsEnabled and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
end
function v_u_3.Reset(p58)
    p58.MinFps = (1 / 0)
    p58.MaxFps = 0
    p58.FrameDeltas = {}
    p58.LastUpdateTime = 0
    p58:Render()
end
function v_u_3.Destroy(p59)
    for _, v60 in ipairs(p59.Connections) do
        v60:Disconnect()
    end
    p59.Connections = {}
    p59.Interface:Destroy()
    table.clear(p59)
    setmetatable(p59, nil)
end
return v_u_3