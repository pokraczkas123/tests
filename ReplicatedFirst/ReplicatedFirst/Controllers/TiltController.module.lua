-- Decompiled game.ReplicatedFirst.Controllers.TiltController

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("RunService")
local v4 = require(v2.Packages.Knit)
local v_u_5 = require(v2.Common.State)
local v_u_6 = require(script.CharTilter)
local v7 = v4.CreateController({
    ["Name"] = "TiltController",
    ["CharTilter"] = v_u_6,
    ["All"] = {}
})
function v7.KnitStart(p_u_8)
    -- upvalues: (copy) v_u_1
    v_u_1.PlayerAdded:Connect(function(p9)
        -- upvalues: (copy) p_u_8
        p_u_8:NewTilterForPlayer(p9)
    end)
    for _, v10 in v_u_1:GetPlayers() do
        task.defer(p_u_8.NewTilterForPlayer, p_u_8, v10)
    end
    p_u_8:BindToHeartbeat()
end
function v7.AddCharTilter(p11, p12)
    local v13 = p11.All[p12.RootPart]
    if v13 then
        v13:Destroy()
    end
    p11.All[p12.RootPart] = p12
    return p12
end
function v7.NewTilterForPlayer(p_u_14, p_u_15)
    -- upvalues: (copy) v_u_1, (copy) v_u_6, (copy) v_u_5
    if p_u_15 ~= v_u_1.LocalPlayer then
        local function v_u_25(p16)
            -- upvalues: (copy) p_u_14, (ref) v_u_6, (ref) v_u_5, (copy) p_u_15
            local v24 = {
                ["RootPart"] = p16:WaitForChild("HumanoidRootPart"),
                ["LowerTorso"] = p16:WaitForChild("LowerTorso"),
                ["ComputeTilt"] = function()
                    -- upvalues: (ref) v_u_5, (ref) p_u_15
                    local v17 = v_u_5.get(p_u_15, v_u_5.Id.Gameplay, "TiltDirection")
                    if v17 then
                        local v18 = v17.X
                        local v19 = math.round(v18)
                        local v20 = v17.Y
                        local v21 = math.round(v20)
                        local v22 = v17.Z
                        local v23 = math.round(v22)
                        return Vector3.new(v19, v21, v23)
                    end
                end
            }
            p_u_14:AddCharTilter(v_u_6.new(v24))
        end
        local v_u_26 = nil
        local function v28(p_u_27)
            -- upvalues: (ref) v_u_26, (copy) v_u_25
            if v_u_26 then
                task.cancel(v_u_26)
            end
            v_u_26 = task.defer(function()
                -- upvalues: (ref) v_u_25, (copy) p_u_27, (ref) v_u_26
                v_u_25(p_u_27)
                v_u_26 = nil
            end)
        end
        if p_u_15.Character then
            local v_u_29 = p_u_15.Character
            if v_u_26 then
                task.cancel(v_u_26)
            end
            v_u_26 = task.defer(function()
                -- upvalues: (copy) v_u_25, (copy) v_u_29, (ref) v_u_26
                v_u_25(v_u_29)
                v_u_26 = nil
            end)
        end
        p_u_15.CharacterAdded:Connect(v28)
    end
end
function v7.BindToHeartbeat(p_u_30)
    -- upvalues: (copy) v_u_3
    v_u_3.Heartbeat:Connect(function(p31)
        -- upvalues: (copy) p_u_30
        for v32, v33 in p_u_30.All do
            v33:Tick(p31)
            if v33.IsDead then
                p_u_30.All[v32] = nil
            end
        end
    end)
end
return v7