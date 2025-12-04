-- Decompiled game.ReplicatedStorage.Content.Mastery.Entities.Hidari.OnCompletion

local v_u_1 = game:GetService("ReplicatedStorage").Assets.Misc.HidariArm
return function(_, p2, p3)
    -- upvalues: (copy) v_u_1
    if p2 then
        local v4
        if p3 then
            v4 = v_u_1:Clone()
        else
            v4 = v_u_1
        end
        local v5 = p2:FindFirstChild((("%*_Hidari"):format(p2.Name))) or Instance.new("Folder")
        v5.Name = ("%*_Hidari"):format(p2.Name)
        v5.Parent = p2
        if not p3 then
            v5:Destroy()
        end
        for _, v6 in v4:GetChildren() do
            if v6:IsA("BasePart") then
                local v7 = p2:FindFirstChild(v6.Name, true)
                if p3 then
                    v6.Anchored = false
                    v6.CanCollide = false
                    v6.Massless = true
                    if v7 and v7:IsA("BasePart") then
                        v6.CFrame = v7.CFrame
                        local v8 = Instance.new("Motor6D")
                        v8.Name = v6.Name .. "_Weld"
                        v8.Part0 = v7
                        v8.Part1 = v6
                        v8.Parent = v7
                        for _, v9 in v6:GetChildren() do
                            if v9:IsA("BasePart") then
                                local v10 = Instance.new("Motor6D")
                                v10.Part0 = v9
                                v10.Part1 = v7
                                v10.Parent = v6
                            end
                        end
                        v6.Parent = v5
                        v7.Transparency = 1
                    end
                elseif v7 and v7:IsA("BasePart") then
                    v7.Transparency = 0
                end
            end
        end
    end
end