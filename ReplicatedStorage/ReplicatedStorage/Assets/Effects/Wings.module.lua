-- Decompiled game.ReplicatedStorage.Assets.Effects.Wings

game:GetService("Debris")
local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
require(v_u_1.Tools.Sound)
return function(p3, _)
    -- upvalues: (copy) v_u_1, (copy) v_u_2
    local v4 = p3:FindFirstChild("Cube.006")
    if not v4 then
        v4 = v_u_1.Assets.Misc.Wings:Clone()
        v4.Name = "Cube.006"
        v4.Parent = p3
        local v5 = Instance.new("Motor6D")
        v5.Name = "Cube.006"
        v5.Parent = p3.UpperTorso
        v5.Part0 = p3.UpperTorso
        v5.Part1 = v4
        v5.C0 = CFrame.new(-0.022, 1.029, 0.992)
    end
    v4.Transparency = 1
    v_u_2:Create(v4, TweenInfo.new(0.2), {
        ["Transparency"] = 0.7
    }):Play()
    task.wait(1.8)
    v_u_2:Create(v4, TweenInfo.new(0.2), {
        ["Transparency"] = 1
    }):Play()
end