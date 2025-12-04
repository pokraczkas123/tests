-- Decompiled game.ReplicatedFirst.Components.UltraDisplay

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v_u_3 = require(v_u_1.Packages.Maid)
local v_u_4 = require(v_u_1.Tools.Utility).applyToAllTagged
local v_u_5 = {
    ["Instances"] = {}
}
v_u_5.__index = v_u_5
function v_u_5.init()
    -- upvalues: (copy) v_u_5, (copy) v_u_4
    v_u_5.init = nil
    v_u_4("UltraNametag", function(p6)
        local v7 = p6.UltraStroke.UIGradient
        local v8 = p6.UltraGradient
        local v9 = p6.UltraGlow.UIGradient
        while p6.Visible == true do
            local v10 = Vector2.new
            local v11 = tick() * 2
            v7.Offset = v10(math.sin(v11) * 0.35, 0)
            local v12 = tick() * 2
            v7.Rotation = math.sin(v12) * 15
            local v13 = Vector2.new
            local v14 = tick() * 2
            v8.Offset = -v13(math.sin(v14) * 0.35, 0)
            local v15 = tick() * 2
            v8.Rotation = -math.sin(v15) * 15
            local v16 = Vector2.new
            local v17 = tick() * 2
            v9.Offset = v16(math.sin(v17) * 0.35, 0)
            local v18 = tick() * 2
            v9.Rotation = -math.sin(v18) * 15
            task.wait()
        end
    end)
end
function v_u_5.new(p19, p20)
    -- upvalues: (copy) v_u_5, (copy) v_u_3
    if v_u_5.Instances[p19] then
        if v_u_5.Instances[p19]._props.Text ~= p20 then
            v_u_5.Instances[p19]:SetText(p20)
        end
        return v_u_5.Instances[p19]
    end
    local v21 = v_u_5
    local v22 = setmetatable({}, v21)
    v22._maid = v_u_3.new()
    v22._props = {
        ["Text"] = p20,
        ["TextLabel"] = p19
    }
    v_u_5.Instances[p19] = v22
    v22:Create()
    v22._maid:GiveTask(v22:Start())
    return v22
end
function v_u_5.clear(p23)
    -- upvalues: (copy) v_u_5
    local v24 = v_u_5.Instances[p23]
    if v24 then
        v24:Destroy()
    end
end
function v_u_5.SetText(p25, p26)
    p25._props.Text = p26
    p25._assets.TextLabel.Text = p26
end
function v_u_5.Create(p27)
    -- upvalues: (copy) v_u_1
    local v28 = v_u_1.Assets.Effects.UltraText
    local v29 = p27._props.TextLabel.Size
    local v30 = p27._props.TextLabel.Position
    local v31 = v28.Label:Clone()
    p27._maid:GiveTask(v31)
    v31.Text = p27._props.Text
    v31.Size = v29
    v31.Position = v30
    v31.Parent = p27._props.TextLabel.Parent
    local v32 = v28.Glow:Clone()
    p27._maid:GiveTask(v32)
    v32.Size = UDim2.fromScale(v29.X.Scale, v29.Y.Scale * 1.35)
    v32.Position = v30
    v32.Parent = p27._props.TextLabel.Parent
    p27._assets = {
        ["TextLabel"] = v31,
        ["Glow"] = v32
    }
    p27._components = {
        ["TextStroke"] = v31.UIGradient,
        ["TextGradient"] = v31.TextStroke.UIGradient,
        ["GlowGradient"] = v32.UIGradient
    }
    p27._props.TextLabel.Visible = false
end
function v_u_5.Start(p_u_33)
    -- upvalues: (copy) v_u_2
    return v_u_2.Heartbeat:Connect(function()
        -- upvalues: (copy) p_u_33
        p_u_33:Step()
    end)
end
function v_u_5.CanStep(p34)
    if not p34._assets then
        return false
    end
    for _, v35 in pairs(p34._assets) do
        if not (v35 and v35.Parent) then
            return false
        end
    end
    return true
end
function v_u_5.Step(p36)
    if p36:CanStep() then
        local v37 = p36._components.TextStroke
        local v38 = p36._components.TextGradient
        local v39 = p36._components.GlowGradient
        local v40 = Vector2.new
        local v41 = tick() * 2
        v37.Offset = v40(math.sin(v41) * 0.35, 0)
        local v42 = tick() * 2
        v37.Rotation = math.sin(v42) * 15
        local v43 = Vector2.new
        local v44 = tick() * 2
        v38.Offset = -v43(math.sin(v44) * 0.35, 0)
        local v45 = tick() * 2
        v38.Rotation = -math.sin(v45) * 15
        local v46 = Vector2.new
        local v47 = tick() * 2
        v39.Offset = -v46(math.sin(v47) * 0.35, 0)
        local v48 = tick() * 2
        v39.Rotation = -math.sin(v48) * 15
    else
        p36:Destroy()
    end
end
function v_u_5.Destroy(p49)
    -- upvalues: (copy) v_u_5
    v_u_5.Instances[p49._props.TextLabel] = nil
    p49._props.TextLabel.Visible = true
    p49._maid:DoCleaning()
    setmetatable(p49, nil)
    table.clear(p49)
end
return v_u_5, v_u_5.init()