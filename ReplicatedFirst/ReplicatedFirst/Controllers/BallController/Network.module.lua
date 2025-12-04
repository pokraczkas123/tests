-- Decompiled game.ReplicatedFirst.Controllers.BallController.Network

local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("RunService")
local v_u_3 = nil
local v_u_4 = nil
local v_u_5 = nil
local v_u_6 = nil
local _ = nil
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = nil
local v_u_10 = nil
local _ = {
    CFrame.Angles(0, 0, 0),
    CFrame.Angles(1.5707963267948966, 0, 0),
    CFrame.Angles(0, 3.141592653589793, 3.141592653589793),
    CFrame.Angles(-1.5707963267948966, 0, 0),
    CFrame.Angles(0, 3.141592653589793, 1.5707963267948966),
    CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966),
    CFrame.Angles(0, 0, 1.5707963267948966),
    CFrame.Angles(0, -1.5707963267948966, 1.5707963267948966),
    CFrame.Angles(-1.5707963267948966, -1.5707963267948966, 0),
    CFrame.Angles(0, -1.5707963267948966, 0),
    CFrame.Angles(1.5707963267948966, -1.5707963267948966, 0),
    CFrame.Angles(0, 1.5707963267948966, 3.141592653589793),
    CFrame.Angles(0, -1.5707963267948966, 3.141592653589793),
    CFrame.Angles(0, 3.141592653589793, 0),
    CFrame.Angles(-1.5707963267948966, -3.141592653589793, 0),
    CFrame.Angles(0, 0, 3.141592653589793),
    CFrame.Angles(1.5707963267948966, 3.141592653589793, 0),
    CFrame.Angles(0, 0, -1.5707963267948966),
    CFrame.Angles(0, -1.5707963267948966, -1.5707963267948966),
    CFrame.Angles(0, -3.141592653589793, -1.5707963267948966),
    CFrame.Angles(0, 1.5707963267948966, -1.5707963267948966),
    CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0),
    CFrame.Angles(0, 1.5707963267948966, 0),
    CFrame.Angles(-1.5707963267948966, 1.5707963267948966, 0)
}
v_u_3 = buffer.create(64)
v_u_4 = 0
v_u_5 = 64
v_u_6 = {}
if not v2:IsRunning() then
    local function v11() end
    local v12 = table.freeze
    local v13 = {
        ["SendEvents"] = v11,
        ["BallStream"] = table.freeze({
            ["SetCallback"] = v11
        })
    }
    return v12(v13)
end
if v2:IsServer() then
    error("Cannot use the client module on the server!")
end
local v14 = v1:WaitForChild("ZAP")
local v_u_15 = v14:WaitForChild("BALL_ZAP_RELIABLE")
local v16 = v14:WaitForChild("BALL_ZAP_UNRELIABLE")
local v17 = v_u_15:IsA("RemoteEvent")
assert(v17, "Expected BALL_ZAP_RELIABLE to be a RemoteEvent")
local v18 = v16:IsA("UnreliableRemoteEvent")
assert(v18, "Expected BALL_ZAP_UNRELIABLE to be an UnreliableRemoteEvent")
local function v20()
    -- upvalues: (ref) v_u_4, (ref) v_u_3, (copy) v_u_15, (ref) v_u_6, (ref) v_u_5
    if v_u_4 ~= 0 then
        local v19 = buffer.create(v_u_4)
        buffer.copy(v19, 0, v_u_3, 0, v_u_4)
        v_u_15:FireServer(v19, v_u_6)
        v_u_3 = buffer.create(64)
        v_u_4 = 0
        v_u_5 = 64
        table.clear(v_u_6)
    end
end
v2.Heartbeat:Connect(v20)
local v_u_21 = table.create(1)
local v_u_22 = table.create(1)
v_u_22[1] = {}
v_u_15.OnClientEvent:Connect(function(p23, p24)
    -- upvalues: (ref) v_u_7, (ref) v_u_9, (ref) v_u_8, (ref) v_u_10, (copy) v_u_21, (copy) v_u_22
    v_u_7 = p23
    v_u_9 = p24
    v_u_8 = 0
    v_u_10 = 0
    local v25 = buffer.len(p23)
    while v_u_8 < v25 do
        local v26 = v_u_8
        v_u_8 = v_u_8 + 1
        if buffer.readu8(p23, v26) == 1 then
            local v27 = {}
            local v28 = v_u_7
            local v29 = v_u_8
            v_u_8 = v_u_8 + 4
            local v30 = buffer.readf32(v28, v29)
            local v31 = v_u_7
            local v32 = v_u_8
            v_u_8 = v_u_8 + 4
            local v33 = buffer.readf32(v31, v32)
            local v34 = v_u_7
            local v35 = v_u_8
            v_u_8 = v_u_8 + 4
            local v36 = buffer.readf32(v34, v35)
            local v37 = Vector3.new(v30, v33, v36)
            local v38 = v_u_7
            local v39 = v_u_8
            v_u_8 = v_u_8 + 4
            local v40 = buffer.readf32(v38, v39)
            local v41 = v_u_7
            local v42 = v_u_8
            v_u_8 = v_u_8 + 4
            local v43 = buffer.readf32(v41, v42)
            local v44 = v_u_7
            local v45 = v_u_8
            v_u_8 = v_u_8 + 4
            local v46 = buffer.readf32(v44, v45)
            local v47 = Vector3.new(v40, v43, v46)
            local v48 = v47.Magnitude
            if v48 == 0 then
                v27.cframe = CFrame.new(v37)
            else
                v27.cframe = CFrame.fromAxisAngle(v47, v48) + v37
            end
            local v49 = v_u_7
            local v50 = v_u_8
            v_u_8 = v_u_8 + 4
            local v51 = buffer.readf32(v49, v50)
            local v52 = v_u_7
            local v53 = v_u_8
            v_u_8 = v_u_8 + 4
            local v54 = buffer.readf32(v52, v53)
            local v55 = v_u_7
            local v56 = v_u_8
            v_u_8 = v_u_8 + 4
            local v57 = buffer.readf32(v55, v56)
            v27.velocity = Vector3.new(v51, v54, v57)
            local v58 = v_u_7
            local v59 = v_u_8
            v_u_8 = v_u_8 + 8
            v27.ID = buffer.readf64(v58, v59)
            local v60 = v_u_7
            local v61 = v_u_8
            v_u_8 = v_u_8 + 1
            if buffer.readu8(v60, v61) == 1 then
                local v62 = v_u_7
                local v63 = v_u_8
                v_u_8 = v_u_8 + 2
                local v64 = buffer.readu16(v62, v63)
                local v65 = buffer.readstring
                local v66 = v_u_7
                local v67 = v_u_8
                v_u_8 = v_u_8 + v64
                v27.Skin = v65(v66, v67, v64)
            else
                v27.Skin = nil
            end
            if v_u_21[1] then
                task.spawn(v_u_21[1], v27)
            else
                local v68 = v_u_22[1]
                table.insert(v68, v27)
                if #v_u_22[1] > 64 then
                    warn((("[ZAP] %* events in queue for BallStream. Did you forget to attach a listener?"):format(#v_u_22[1])))
                end
            end
        else
            error("Unknown event id")
        end
    end
end)
local v71 = {
    ["SendEvents"] = v20,
    ["BallStream"] = {
        ["SetCallback"] = function(p69)
            -- upvalues: (copy) v_u_21, (copy) v_u_22
            v_u_21[1] = p69
            for _, v70 in v_u_22[1] do
                task.spawn(p69, v70)
            end
            v_u_22[1] = {}
            return function()
                -- upvalues: (ref) v_u_21
                v_u_21[1] = nil
            end
        end
    }
}
return v71