-- Decompiled game.ReplicatedFirst.Controllers.SessionController

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = require(v1.Packages.Knit)
local v4 = v_u_3.CreateController({
    ["Name"] = "SessionController"
})
function v4.KnitStart(_)
    -- upvalues: (ref) v_u_2, (copy) v_u_3
    v_u_2 = v_u_3.GetService("SessionService")
    v_u_2.GetTimeZone:Connect(function()
        -- upvalues: (ref) v_u_2
        v_u_2:SetTimezone(DateTime.now():ToLocalTime().Hour)
    end)
end
return v4