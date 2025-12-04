-- Decompiled game.ReplicatedStorage.Assets.Effects.CloneEffect

local function v_u_4(p1, p2)
    if p1 ~= p2 then
        p1.Material = Enum.Material.ForceField
        p1.Color = Color3.new(0, 1, 0.1)
        if p1.ClassName == "MeshPart" then
            p1.TextureID = ""
        end
        for _, v3 in p1:GetChildren() do
            if v3.ClassName == "SurfaceAppearance" then
                v3:Destroy()
            end
        end
    end
end
return function(p5)
    -- upvalues: (copy) v_u_4
    for _, v6 in p5:GetDescendants() do
        if v6:IsA("BasePart") then
            v_u_4(v6, p5.PrimaryPart)
        end
    end
end