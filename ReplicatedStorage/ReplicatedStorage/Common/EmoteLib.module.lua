-- Decompiled game.ReplicatedStorage.Common.EmoteLib

return {
    ["applyRigTemplateToCharacter"] = function(p1)
        local v2 = p1.Rig
        local v3 = p1.Character
        local v_u_4 = {}
        local v_u_5 = {}
        for v6, v7 in p1.RigTemplate do
            local v8 = v2:FindFirstChild(v6)
            if v8 then
                local v9 = v7.LimbName and v3:FindFirstChild(v7.LimbName) or v3.HumanoidRootPart
                if v9 then
                    local v10 = v8:Clone()
                    v10.Name = v7.PartName
                    v10.Anchored = false
                    v10.CanCollide = false
                    v10.CanTouch = false
                    v10.CanQuery = false
                    v10.Massless = true
                    v10.Parent = v3
                    v_u_4[v6] = v10
                    local v11 = Instance.new("Motor6D")
                    v11.Name = v7.MotorName or ("%*_Motor"):format(v7.PartName)
                    v11.Part0 = v9
                    v11.Part1 = v10
                    v11.C0 = v7.CFrameOffset or CFrame.new()
                    v11.C1 = CFrame.new()
                    v11.Parent = v3.HumanoidRootPart
                    v_u_5[v10] = v11
                else
                    warn((("EmoteLib: Adornee \'%*\' not found in character."):format(v7.LimbName)))
                end
            else
                warn((("EmoteLib: Part \'%*\' not found in rig."):format(v6)))
            end
        end
        return function()
            -- upvalues: (copy) v_u_4, (copy) v_u_5
            for _, v12 in v_u_4 do
                v12:Destroy()
            end
            for _, v13 in v_u_5 do
                v13:Destroy()
            end
        end, {
            ["Parts"] = v_u_4,
            ["Motors"] = v_u_5
        }
    end
}