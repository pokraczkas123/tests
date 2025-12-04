-- Decompiled game.ReplicatedStorage.Tools.CharGravity

local v_u_1 = {
    [Enum.HumanoidStateType.Jumping] = true,
    [Enum.HumanoidStateType.Freefall] = true
}
local v_u_2 = {}
v_u_2.__index = v_u_2
v_u_2.IsForcedInAir = nil
v_u_2.InAirFactor = 0
v_u_2.Factor = 0
local function v_u_6(p3)
    local v4 = 0
    for _, v5 in p3:GetDescendants() do
        if v5:IsA("BasePart") then
            v4 = v4 + v5:GetMass()
        end
    end
    return v4
end
function v_u_2.new(p7, p8)
    -- upvalues: (copy) v_u_2
    local v9 = v_u_2
    local v_u_10 = setmetatable({}, v9)
    v_u_10.IsForcedInAir = p8
    local v11 = p7.Humanoid
    local v12 = p7.HumanoidRootPart
    local v13 = v12.RootAttachment
    local v14 = v12:FindFirstChild("VectorForce")
    if v14 then
        v14:Destroy()
    end
    local v_u_15 = Instance.new("VectorForce")
    v_u_15.ApplyAtCenterOfMass = true
    v_u_15.Attachment0 = v13
    v_u_15.RelativeTo = Enum.ActuatorRelativeTo.World
    v_u_15.Parent = v12
    v_u_15.Force = Vector3.new(0, 0, 0)
    v_u_10._vectorForce = v_u_15
    v_u_10._humanoid = v11
    v_u_10._humanoidRootPart = v12
    v_u_10._character = p7
    local v_u_16 = v11.StateChanged:Connect(function()
        -- upvalues: (copy) v_u_10
        v_u_10:_Compute()
    end)
    local v17 = v12.AssemblyLinearVelocity.Y
    if v17 <= 0 or p7:GetAttribute("IsBot") then
        v_u_10:_Compute()
    else
        local v18 = (0.01 - v17) / -workspace.Gravity
        v_u_10._requiredTimestamp = tick() + v18
        local v19 = v18 <= 0 and 0 or v18
        task.delay(v19, function()
            -- upvalues: (copy) v_u_10
            if v_u_10 and v_u_10._Compute then
                v_u_10:_Compute()
            end
        end)
    end
    function v_u_10._cleanup()
        -- upvalues: (copy) v_u_15, (copy) v_u_16
        v_u_15:Destroy()
        v_u_16:Disconnect()
    end
    return v_u_10
end
function v_u_2._ComputeInAir(p20)
    -- upvalues: (copy) v_u_1
    if p20.IsForcedInAir == true then
        p20.InAirFactor = 1
        return
    elseif p20.IsForcedInAir == false then
        p20.InAirFactor = 0
    else
        p20.InAirFactor = v_u_1[p20._humanoid:GetState()] == true and 1 or 0
    end
end
function v_u_2.ComputeMass(p21)
    -- upvalues: (copy) v_u_6
    return v_u_6(p21._character)
end
function v_u_2.ComputeWeightForce(p22)
    local v23 = p22:ComputeMass()
    return workspace.Gravity * v23
end
function v_u_2._Compute(p24)
    p24:_ComputeInAir()
    if p24.InAirFactor ~= 1 or tick() >= (p24._requiredTimestamp or 0) then
        local v25 = p24.InAirFactor * p24.Factor
        local v26 = p24:ComputeWeightForce() * v25
        local v27 = Vector3.new(0, v26, 0)
        p24._vectorForce.Force = v27
    end
end
function v_u_2.SetFactor(p28, p29)
    p28.Factor = p29
    p28:_Compute()
end
function v_u_2.Destroy(p30)
    p30._cleanup()
end
return v_u_2