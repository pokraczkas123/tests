-- Decompiled game.ReplicatedStorage.Packages._Index.sleitnick_knit@1.7.0.knit

local v1 = game:GetService("RunService")
if v1:IsServer() then
    return require(script.KnitServer)
end
local v2 = script:FindFirstChild("KnitServer")
if v2 and v1:IsRunning() then
    v2:Destroy()
end
return require(script.KnitClient)