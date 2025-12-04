-- Decompiled game.ReplicatedFirst.Controllers.TiltController.CharTilter

local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(p2)
    -- upvalues: (copy) v_u_1
    local v3 = v_u_1
    local v4 = setmetatable({}, v3)
    v4.RootPart = p2.RootPart
    v4.LowerTorso = p2.LowerTorso
    v4._computeTilt = p2.ComputeTilt
    return v4
end
function v_u_1._FindJoint(p5)
    return p5.LowerTorso:FindFirstChild("Root")
end
function v_u_1.Tick(p6, p7)
    local v8 = p6.RootPart
    if v8.Parent ~= nil and true or v8:IsDescendantOf(workspace) then
        local v9 = p6:_FindJoint()
        if v9 then
            p6._startC0 = p6._startC0 or v9.C0
            local v10 = p6._computeTilt()
            if v10 then
                local v11 = p6._startC0
                local v12 = p6._prevC0 or v9.C0
                local v13 = v8.CFrame.RightVector:Dot(v10.Unit)
                local v14 = v8.CFrame.LookVector:Dot(v10.Unit)
                if v14 > 0 then
                    v14 = v14 * 2
                end
                local v15 = CFrame.Angles
                local v16 = -v14 * 25
                local v17 = math.rad(v16)
                local v18 = -v13 * 25
                local v19 = v12:Lerp(v11 * v15(v17, 0, (math.rad(v18))), p7 * 15)
                v9.C0 = v19
                p6._prevC0 = v19
            end
        else
            return
        end
    else
        p6:Destroy()
        return
    end
end
function v_u_1.Destroy(p20)
    p20.IsDead = true
end
return v_u_1