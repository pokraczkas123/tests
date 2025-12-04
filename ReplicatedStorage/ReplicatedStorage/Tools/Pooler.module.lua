-- Decompiled game.ReplicatedStorage.Tools.Pooler

local v_u_1 = {}
v_u_1.__index = v_u_1
v_u_1._startAmount = 0
function v_u_1._destroyObject(p2)
    p2:Destroy()
end
function v_u_1._handleObjectCheckOut(_) end
function v_u_1._handleObjectCheckIn(_)
    return true
end
function v_u_1.new(p3)
    -- upvalues: (copy) v_u_1
    local v4 = v_u_1
    local v5 = setmetatable({}, v4)
    v5.CheckedOutSet = {}
    v5.CheckedInSet = {}
    v5.Count = 0
    v5.CheckedOutCount = 0
    v5.CheckedInCount = 0
    v5._newObject = p3.NewObject
    if p3.DestroyObject then
        v5._destroyObject = p3.DestroyObject
    end
    if p3.HandleObjectCheckOut then
        v5._handleObjectCheckOut = p3.HandleObjectCheckOut
    end
    if p3.HandleObjectCheckIn then
        v5._handleObjectCheckIn = p3.HandleObjectCheckIn
    end
    v5._startAmount = p3.StartAmount or 0
    for _ = 1, v5._startAmount do
        v5:MakeCheckedInObject()
    end
    return v5
end
function v_u_1.MakeCheckedInObject(p6)
    local v7 = p6._newObject()
    p6.Count = p6.Count + 1
    p6.CheckedInSet[v7] = true
    p6.CheckedInCount = p6.CheckedInCount + 1
    p6._handleObjectCheckIn(v7)
    return v7
end
function v_u_1.CheckOut(p8)
    local v9 = next(p8.CheckedInSet)
    if not v9 then
        return nil
    end
    p8.CheckedInSet[v9] = nil
    p8.CheckedInCount = p8.CheckedInCount - 1
    p8.CheckedOutSet[v9] = true
    p8.CheckedOutCount = p8.CheckedOutCount + 1
    p8._handleObjectCheckOut(v9)
    return v9
end
function v_u_1.CheckOutOrMake(p10)
    local v11 = p10:CheckOut()
    if v11 then
        return v11
    end
    local v12 = p10._newObject()
    p10.Count = p10.Count + 1
    p10.CheckedOutSet[v12] = true
    p10.CheckedOutCount = p10.CheckedOutCount + 1
    p10._handleObjectCheckOut(v12)
    return v12
end
function v_u_1.GetFirstCheckedOut(p13)
    local v14, _ = next(p13.CheckedOutSet)
    return v14
end
function v_u_1.CheckIn(p15, p16)
    if not p15.CheckedOutSet[p16] then
        return false
    end
    p15.CheckedOutSet[p16] = nil
    p15.CheckedOutCount = p15.CheckedOutCount - 1
    if p15._handleObjectCheckIn(p16) == true then
        p15.CheckedInSet[p16] = true
        p15.CheckedInCount = p15.CheckedInCount + 1
    else
        p15.Count = p15.Count - 1
        p15._destroyObject(p16)
    end
    return true
end
function v_u_1.CleanAllCheckedOut(p17)
    for v18, _ in p17.CheckedOutSet do
        p17.CheckedOutSet[v18] = nil
        p17.Count = p17.Count - 1
        p17.CheckedOutCount = p17.CheckedOutCount - 1
        p17._destroyObject(v18)
    end
end
function v_u_1.CleanCheckedIn(p19, p20)
    local v21 = 0
    for v22, _ in p19.CheckedInSet do
        if p20 <= v21 then
            break
        end
        p19.CheckedInSet[v22] = nil
        p19.CheckedInCount = p19.CheckedInCount - 1
        p19.Count = p19.Count - 1
        p19._destroyObject(v22)
        v21 = v21 + 1
    end
end
function v_u_1.CleanToTargetCount(p23, p24)
    if p23.Count <= p24 then
        return true
    else
        local v25 = p23.Count - p24
        local v26 = p23.CheckedInCount
        if v25 <= v26 then
            p23:CleanCheckedIn(v25)
            return true
        else
            p23:CleanCheckedIn(v26)
            return false
        end
    end
end
function v_u_1.Destroy(p27)
    for v28, _ in p27.CheckedInSet do
        p27._destroyObject(v28)
    end
    for v29, _ in p27.CheckedOutSet do
        p27._destroyObject(v29)
    end
end
return v_u_1