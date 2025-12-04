-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.FlamethrowerScoreEffect.MeshImpactLava

return function(p1, p_u_2)
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
    local v_u_3 = p1 or CFrame.new(0, 0, 0)
    local v4 = {
        ["Meshnew"] = script.Parent.Impacts.Meshnew,
        ["Impact"] = script.Parent.Impacts.Impact
    }
    local v5 = {
        [v4.Impact] = {
            ["General"] = {
                ["Offset"] = CFrame.new(0, 0, 0, 1.00000048, 1.06568832e-14, 2.32830644e-10, 1.06569255e-14, 1, 5.551311e-17, -2.32830644e-10, 5.55184304e-17, 1.00000048),
                ["Tween_Duration"] = 2,
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
                    ["Size"] = Vector3.new(53.30101, 53.30101, 53.30101),
                    ["CFrame"] = v_u_3 * CFrame.new(0, 0, 0, 1.00000048, 1.06568832e-14, 2.32830644e-10, 1.06569255e-14, 1, 5.551311e-17, -2.32830644e-10, 5.55184304e-17, 1.00000048),
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
                    ["Scale"] = Vector3.new(14.213602, 14.213602, 14.213602),
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
        [v4.Meshnew] = {
            ["General"] = {
                ["Offset"] = CFrame.new(-5.11420922e-7, 11.6999998, -1.54511615e-9, 1.06568832e-14, 0.170671999, 0.985328257, 1, 2.17270219e-15, 7.03554121e-15, 5.55184304e-17, 0.985328257, -0.170671999),
                ["Tween_Duration"] = 2,
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
                    ["Size"] = Vector3.new(35.300808, 61.144466, 61.144466),
                    ["CFrame"] = v_u_3 * CFrame.new(0, 0, 0, -4.37111929e-8, -0.999995947, -0.00302120089, 1, -4.37114025e-8, 4.16337446e-16, -1.32061209e-10, -0.00302120089, 0.999995947),
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
                    ["Scale"] = Vector3.new(0.96242714, 1.176157, 1.176157),
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
                -- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_3, (ref) p_u_2
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
                v8.CFrame = v_u_3 * v_u_7.General.Offset
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