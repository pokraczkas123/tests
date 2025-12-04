-- Decompiled game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.MeshImpact

return function(p1, p_u_2, p3)
    if p1 then
        if typeof(p1) == "Vector3" then
            p1 = CFrame.new(p1)
        elseif typeof(p1) ~= "CFrame" then
            p1 = nil
        end
    end
    if not p_u_2 then
        p_u_2 = workspace:FindFirstChild("MeshCache")
        if not p_u_2 then
            p_u_2 = Instance.new("Folder")
            p_u_2.Name = "MeshCache"
            p_u_2.Parent = workspace
        end
    end
    local v_u_4 = p1 or CFrame.new(0, 0, 0)
    local v5 = {
        [p3.Impact] = {
            ["General"] = {
                ["Offset"] = CFrame.new(0, 0, 0, 1.00000012, -1.21591021e-18, 0, -1.21591021e-18, 1, 1.38795878e-17, 0, 1.38795878e-17, 1.00000012),
                ["Tween_Duration"] = 0.3,
                ["Transparency"] = 0
            },
            ["BasePart"] = {
                ["Property"] = {
                    ["Size"] = Vector3.new(41.00078, 41.00078, 41.00078),
                    ["CFrame"] = v_u_4 * CFrame.new(0, 0, 0, 1.00000012, -1.21591021e-18, 0, -1.21591021e-18, 1, 1.38795878e-17, 0, 1.38795878e-17, 1.00000012),
                    ["Color"] = Color3.new(0.639216, 0.635294, 0.647059),
                    ["Transparency"] = 1
                },
                ["Tween"] = {
                    ["Easing_Direction"] = Enum.EasingDirection.Out,
                    ["Easing_Style"] = Enum.EasingStyle.Exponential
                }
            },
            ["Mesh"] = {
                ["Property"] = {
                    ["Offset"] = Vector3.new(0, 0, 0),
                    ["Scale"] = Vector3.new(10.93354, 10.93354, 10.93354),
                    ["VertexColor"] = Vector3.new(1, 1, 1)
                },
                ["Tween"] = {
                    ["Easing_Direction"] = Enum.EasingDirection.Out,
                    ["Easing_Style"] = Enum.EasingStyle.Exponential
                }
            },
            ["Decal"] = {
                ["Property"] = {
                    ["Color3"] = Color3.new(1, 1, 1),
                    ["Transparency"] = 1
                },
                ["Tween"] = {
                    ["Easing_Direction"] = Enum.EasingDirection.Out,
                    ["Easing_Style"] = Enum.EasingStyle.Circular
                }
            }
        },
        [p3.Meshnew] = {
            ["General"] = {
                ["Offset"] = CFrame.new(-3.93400711e-7, 9, -1.18855092e-9, -1.21591021e-18, 0.17067194, 0.985327959, 1, 3.96345218e-16, -6.9886293e-17, 1.38795878e-17, 0.985327959, -0.17067194),
                ["Tween_Duration"] = 1,
                ["Transparency"] = 0
            },
            ["Features"] = {
                ["Random_Angles"] = {
                    ["X"] = { 0, 0 },
                    ["Y"] = { 0, 0 },
                    ["Z"] = { 0, 0 }
                }
            },
            ["BasePart"] = {
                ["Property"] = {
                    ["Size"] = Vector3.new(27.154469, 47.034206, 47.034206),
                    ["CFrame"] = v_u_4 * CFrame.new(0, 0, 0, -4.37111893e-8, -0.999995589, -0.00302119972, 1, -4.37113918e-8, 4.02459526e-16, -1.32061209e-10, -0.00302119972, 0.999995589),
                    ["Color"] = Color3.new(0.639216, 0.635294, 0.647059),
                    ["Transparency"] = 1
                },
                ["Tween"] = {
                    ["Easing_Direction"] = Enum.EasingDirection.Out,
                    ["Easing_Style"] = Enum.EasingStyle.Exponential
                }
            },
            ["Mesh"] = {
                ["Property"] = {
                    ["Offset"] = Vector3.new(0, 0, 0),
                    ["Scale"] = Vector3.new(0.7403286, 0.9047362, 0.9047362),
                    ["VertexColor"] = Vector3.new(1, 1, 1)
                },
                ["Tween"] = {
                    ["Easing_Direction"] = Enum.EasingDirection.Out,
                    ["Easing_Style"] = Enum.EasingStyle.Exponential
                }
            }
        }
    }
    for v_u_6, v_u_7 in pairs(v5) do
        if v_u_6 and v_u_6:IsDescendantOf(game) and v_u_6:FindFirstChild("Start") then
            task.spawn(function()
                -- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_4, (ref) p_u_2
                local v8 = v_u_6.Start:Clone()
                v8.Name = v_u_6.Name
                v8.Transparency = v_u_7.General.Transparency
                if v8:FindFirstChildOfClass("Decal") then
                    v8:FindFirstChildOfClass("Decal").Transparency = v_u_7.General.Transparency
                    v8.Transparency = 1
                end
                v8.Anchored = true
                v8.CanCollide = false
                v8.CanQuery = false
                v8.CanTouch = false
                v8.Locked = true
                v8.CFrame = v_u_4 * v_u_7.General.Offset
                v8.Parent = p_u_2
                if v_u_7.Features and v_u_7.Features.Random_Angles then
                    local v9 = v_u_7.BasePart.Property
                    local v10 = v9.CFrame
                    local v11 = CFrame.Angles
                    local v12 = math.random
                    local v13 = v_u_7.Features.Random_Angles.X
                    local v14 = v12(unpack(v13))
                    local v15 = math.random
                    local v16 = v_u_7.Features.Random_Angles.Y
                    local v17 = v15(unpack(v16))
                    local v18 = math.random
                    local v19 = v_u_7.Features.Random_Angles.Z
                    v9.CFrame = v10 * v11(v14, v17, v18(unpack(v19)))
                end
                game:GetService("TweenService"):Create(v8, TweenInfo.new(v_u_7.General.Tween_Duration, v_u_7.BasePart.Tween.Easing_Style, v_u_7.BasePart.Tween.Easing_Direction), v_u_7.BasePart.Property):Play()
                if v_u_7.Decal then
                    game:GetService("TweenService"):Create(v8:FindFirstChildOfClass("Decal"), TweenInfo.new(v_u_7.General.Tween_Duration, v_u_7.Decal.Tween.Easing_Style, v_u_7.Decal.Tween.Easing_Direction), v_u_7.Decal.Property):Play()
                end
                if v_u_7.Mesh then
                    game:GetService("TweenService"):Create(v8:FindFirstChildOfClass("SpecialMesh"), TweenInfo.new(v_u_7.General.Tween_Duration, v_u_7.Mesh.Tween.Easing_Style, v_u_7.Mesh.Tween.Easing_Direction), v_u_7.Mesh.Property):Play()
                end
                task.delay(v_u_7.General.Tween_Duration, v8.Destroy, v8)
            end)
        end
    end
end