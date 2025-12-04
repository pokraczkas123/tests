-- Decompiled game.ReplicatedFirst.Controllers.EventController

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.Packages.Knit)
local v_u_3 = require(v_u_1.Tools.Logger).new("EventController")
local v_u_4 = nil
local v5 = v_u_2.CreateController({
    ["Name"] = "EventController",
    ["RecentTimestamps"] = {}
})
function v5.KnitInit(p6)
    -- upvalues: (ref) v_u_4, (copy) v_u_2
    v_u_4 = v_u_2.GetService("EventService")
    p6:BindLiveEventListener()
end
function v5.BindLiveEventListener(p_u_7)
    -- upvalues: (ref) v_u_4, (copy) v_u_1, (copy) v_u_3
    v_u_4.LiveEvents:Observe(function(p8)
        -- upvalues: (copy) p_u_7, (ref) v_u_1, (ref) v_u_3
        for v9, v10 in p8 do
            if not p_u_7.RecentTimestamps[v9] or p_u_7.RecentTimestamps[v9] ~= v10 then
                p_u_7.RecentTimestamps[v9] = v10
                local v11 = v_u_1:FindFirstChild("LiveEvents")
                if not v11 then
                    v_u_3:Error("LiveEvents folder not found in ReplicatedStorage.")
                    return
                end
                local v12 = v11:FindFirstChild(v9)
                if v12 then
                    local v13 = require(v12)
                    local v14 = DateTime.now().UnixTimestamp - v10
                    v13:Play((math.max(0, v14)))
                end
            end
        end
    end)
end
return v5