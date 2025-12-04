-- Decompiled game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.ViewportWindow.SkyboxModel

local v_u_1 = {
    ["SkyboxBk"] = Enum.NormalId.Back,
    ["SkyboxFt"] = Enum.NormalId.Front,
    ["SkyboxLf"] = Enum.NormalId.Left,
    ["SkyboxRt"] = Enum.NormalId.Right
}
local v_u_2 = Instance.new("Part")
v_u_2.CanCollide = false
v_u_2.Anchored = true
v_u_2.Transparency = 1
v_u_2.Size = Vector3.new(1, 1, 1)
local v3 = Instance.new("BlockMesh")
v3.Scale = Vector3.new(10000, 10000, 10000)
v3.Parent = v_u_2
local v4 = CFrame.new(0, 0, 0, 1, 0, 0, 0, -1, 0, 0, 0, 1)
local v_u_5 = v4 * CFrame.fromEulerAnglesXYZ(3.141592653589793, 3.141592653589793, 0)
local v_u_6 = v4 * CFrame.fromEulerAnglesXYZ(3.141592653589793, 1.5707963267948966, 0)
local v_u_7 = v4 * CFrame.fromEulerAnglesXYZ(3.141592653589793, -1.5707963267948966, 0)
return function(p8)
    -- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7
    local v9 = Instance.new("Model")
    local v10 = v_u_2:Clone()
    local v11 = v_u_2:Clone()
    local v12 = v_u_2:Clone()
    for v13, v14 in pairs(v_u_1) do
        local v15 = Instance.new("Decal")
        v15.Texture = p8[v13]
        v15.Face = v14
        v15.Parent = v10
    end
    local v16 = Instance.new("Decal")
    v16.Texture = p8.SkyboxUp
    v16.Face = Enum.NormalId.Top
    v16.Parent = v11
    local v17 = Instance.new("Decal")
    v17.Texture = p8.SkyboxDn
    v17.Face = Enum.NormalId.Bottom
    v17.Parent = v12
    v10.CFrame = v_u_5
    v11.CFrame = v_u_6
    v12.CFrame = v_u_7
    v10.Parent = v9
    v11.Parent = v9
    v12.Parent = v9
    v9.Name = "SkyboxModel"
    return v9
end