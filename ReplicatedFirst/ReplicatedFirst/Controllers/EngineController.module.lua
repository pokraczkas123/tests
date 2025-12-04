-- Decompiled game.ReplicatedFirst.Controllers.EngineController

local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("LogService")
local v_u_4 = nil
local v_u_5 = require(v2.Packages.Knit)
local v6 = v_u_5.CreateController({
    ["Name"] = "EngineController",
    ["Player"] = v1.LocalPlayer,
    ["Cache"] = {}
})
function v6.KnitStart(p_u_7)
    -- upvalues: (ref) v_u_4, (copy) v_u_5
    v_u_4 = v_u_5.GetService("EngineSchedulerService")
    v_u_4.OnPing:Connect(function(p8)
        -- upvalues: (copy) p_u_7
        p_u_7:Ping(p8)
    end)
    p_u_7:BindToEvents()
end
function v6.BindToEvents(p_u_9)
    -- upvalues: (copy) v_u_3
    for _, v10 in v_u_3:GetLogHistory() do
        local v11 = p_u_9.Cache
        local v12 = v10.message
        table.insert(v11, v12)
    end
    v_u_3.MessageOut:Connect(function(p13)
        -- upvalues: (copy) p_u_9
        local v14 = p_u_9.Cache
        table.insert(v14, p13)
    end)
end
function v6.Ping(p15, p16)
    -- upvalues: (ref) v_u_4
    v_u_4:Ping(p16, p15.Cache)
    p15.Cache = {}
end
return v6