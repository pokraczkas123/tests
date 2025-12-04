-- Decompiled game.ReplicatedStorage.Content.Effect.Particle

local v_u_1 = game:GetService("Debris")
local v_u_2 = game:GetService("ReplicatedStorage")
local v3 = require(script.Parent)
local v_u_4 = require(v_u_2.Tools.Character)
return v3.new({
    ["Name"] = script.Name,
    ["Play"] = function(_, p5)
        -- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_1
        local v6 = p5.Name
        local v7 = typeof(v6) == "string"
        assert(v7, "Name must be a string.")
        local v8 = p5.Origin or p5.Parent
        assert(v8, "Origin or Parent must be provided.")
        local v9 = v_u_2.Assets.Effects:FindFirstChild(p5.Name)
        local v10 = ("Particle asset \'%*\' not found."):format(p5.Name)
        assert(v9, v10)
        local v11
        if p5.Parent then
            v11 = v_u_4.isDescendantOfPlayerCharacter(p5.Parent)
        else
            v11 = false
        end
        if not p5.Parent or v11 then
            local v12 = Instance.new("Part")
            v_u_1:AddItem(v12, 10 + (p5.Duration or 1))
            v12.Anchored = true
            v12.CanCollide = false
            v12.CanQuery = false
            v12.CanTouch = false
            v12.Massless = true
            v12.Transparency = 1
            v12.Size = Vector3.new(1, 1, 1)
            local v13 = p5.Name
            local v14 = workspace:GetServerTimeNow() * 100
            v12.Name = ("Particle \'%*\' @ %*"):format(v13, math.floor(v14) / 100)
            v12.CFrame = p5.Origin or p5.Parent:GetPivot()
            if v11 then
                v12.Anchored = false
                local v15 = Instance.new("Weld")
                v15.Part0 = p5.Parent
                v15.Part1 = v12
                v15.Parent = v12
            end
            v12.Parent = workspace.Effects
            p5.Parent = v12
        end
        local v16 = p5.Parent:FindFirstChild(p5.Name)
        if not v16 then
            v16 = v_u_2.Assets.Effects:FindFirstChild(p5.Name).Attachment:Clone()
            v16.Name = p5.Name
            v16.Parent = p5.Parent
        end
        if p5.Offset then
            v16.CFrame = p5.Offset
        end
        if p5.CFrame then
            v16.WorldCFrame = p5.CFrame
        end
        if p5.Duration or p5.ManualDisable then
            local v_u_17 = {}
            for _, v18 in ipairs(v16:GetDescendants()) do
                if v18:IsA("ParticleEmitter") or v18:IsA("Beam") or v18:IsA("Trail") then
                    v18.Enabled = true
                    table.insert(v_u_17, v18)
                end
            end
            if not p5.Duration then
                return function()
                    -- upvalues: (copy) v_u_17
                    for _, v19 in v_u_17 do
                        v19.Enabled = false
                    end
                end
            end
            task.delay(p5.Duration, function()
                -- upvalues: (copy) v_u_17
                for _, v20 in v_u_17 do
                    v20.Enabled = false
                end
            end)
        else
            for _, v21 in ipairs(v16:GetDescendants()) do
                if v21:IsA("ParticleEmitter") then
                    v21:Emit(v21:GetAttribute("EmitCount") or 1)
                end
            end
        end
    end
})