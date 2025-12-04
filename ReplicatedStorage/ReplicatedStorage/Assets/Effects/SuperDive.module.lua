-- Decompiled game.ReplicatedStorage.Assets.Effects.SuperDive

local v_u_1 = game:GetService("Debris")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = require(v2.Tools.Sound)
return function(p5, p6)
    -- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_4
    task.wait(0.1)
    if p5 and p5.Parent and p5.PrimaryPart and p5.PrimaryPart.Parent then
        local v_u_7 = script.PrimaryPart:Clone()
        v_u_1:AddItem(v_u_7, 3)
        v_u_7.Parent = p5.PrimaryPart
        for _, v8 in ipairs(v_u_7:GetDescendants()) do
            if v8:IsA("ParticleEmitter") then
                v8.Enabled = v8.Parent ~= v_u_7 and true or p6.IsStrong == true
            elseif v8:IsA("Beam") then
                v8.Brightness = p6.IsStrong and 1 or 0.5
                v8.LightInfluence = 0
            end
        end
        local v9 = p5:GetPivot()
        local v10 = CFrame.new(Vector3.new(0, 0, 0), v9:VectorToObjectSpace(p5.PrimaryPart.AssemblyLinearVelocity * Vector3.new(1, 0, 1)).Unit)
        local v11 = Instance.new("Motor6D", v_u_7)
        v11.Part0 = p5.PrimaryPart
        v11.Part1 = v_u_7
        v11.C0 = v10
        task.delay(0.25, function()
            -- upvalues: (copy) v_u_7, (ref) v_u_3
            for _, v12 in ipairs(v_u_7:GetDescendants()) do
                if v12:IsA("ParticleEmitter") or v12:IsA("Trail") then
                    v12.Enabled = false
                elseif v12:IsA("Beam") then
                    v_u_3:Create(v12, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
                        ["Brightness"] = 0,
                        ["LightInfluence"] = 0
                    }):Play()
                end
            end
        end)
        v_u_4.fromName((("SuperDive%*"):format(p6.IsStrong and 2 or 1)))({
            ["Parent"] = p5.PrimaryPart
        })
    end
end