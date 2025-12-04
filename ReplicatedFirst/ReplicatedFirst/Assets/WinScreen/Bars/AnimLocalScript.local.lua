-- Decompiled game.ReplicatedFirst.Assets.WinScreen.Bars.AnimLocalScript

local v1 = { script.Parent.Bottom.Star }
local v2 = game:GetService("TweenService")
local v3 = TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true)
v2:Create(script.Parent.Parent.IconMVP, v3, {
    ["Rotation"] = -1,
    ["Position"] = script.Parent.Parent.IconMVP.Position + UDim2.new(0, 0, 0.01, 0),
    ["Size"] = script.Parent.Parent.IconMVP.Size + UDim2.new(0, 0, 0.01, 0)
}):Play()
while true do
    for v4, v5 in pairs(v1) do
        if v4 == 1 then
            v5.Rotation = v5.Rotation - 0.25
        end
    end
    task.wait()
end