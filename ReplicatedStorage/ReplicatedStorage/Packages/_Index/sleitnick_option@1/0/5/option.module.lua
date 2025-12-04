-- Decompiled game.ReplicatedStorage.Packages._Index.sleitnick_option@1.0.5.option

local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1._new(p2)
    -- upvalues: (copy) v_u_1
    local v3 = {
        ["ClassName"] = "Option",
        ["_v"] = p2,
        ["_s"] = p2 ~= nil
    }
    local v4 = v_u_1
    return setmetatable(v3, v4)
end
function v_u_1.Some(p5)
    -- upvalues: (copy) v_u_1
    local v6 = p5 ~= nil
    assert(v6, "Option.Some() value cannot be nil")
    return v_u_1._new(p5)
end
function v_u_1.Wrap(p7)
    -- upvalues: (copy) v_u_1
    if p7 == nil then
        return v_u_1.None
    else
        return v_u_1.Some(p7)
    end
end
function v_u_1.Is(p8)
    -- upvalues: (copy) v_u_1
    local v9
    if type(p8) == "table" then
        v9 = getmetatable(p8) == v_u_1
    else
        v9 = false
    end
    return v9
end
function v_u_1.Assert(p10)
    -- upvalues: (copy) v_u_1
    local v11 = v_u_1.Is(p10)
    assert(v11, "Result was not of type Option")
end
function v_u_1.Deserialize(p12)
    -- upvalues: (copy) v_u_1
    local v13
    if type(p12) == "table" then
        v13 = p12.ClassName == "Option"
    else
        v13 = false
    end
    assert(v13, "Invalid data for deserializing Option")
    return p12.Value == nil and v_u_1.None or v_u_1.Some(p12.Value)
end
function v_u_1.Serialize(p14)
    return {
        ["ClassName"] = p14.ClassName,
        ["Value"] = p14._v
    }
end
function v_u_1.Match(p15, p16)
    local v17 = p16.Some
    local v18 = p16.None
    local v19 = type(v17) == "function"
    assert(v19, "Missing \'Some\' match")
    local v20 = type(v18) == "function"
    assert(v20, "Missing \'None\' match")
    if p15:IsSome() then
        return v17(p15:Unwrap())
    else
        return v18()
    end
end
function v_u_1.IsSome(p21)
    return p21._s
end
function v_u_1.IsNone(p22)
    return not p22._s
end
function v_u_1.Expect(p23, p24)
    local v25 = p23:IsSome()
    assert(v25, p24)
    return p23._v
end
function v_u_1.ExpectNone(p26, p27)
    local v28 = p26:IsNone()
    assert(v28, p27)
end
function v_u_1.Unwrap(p29)
    return p29:Expect("Cannot unwrap option of None type")
end
function v_u_1.UnwrapOr(p30, p31)
    if p30:IsSome() then
        return p30:Unwrap()
    else
        return p31
    end
end
function v_u_1.UnwrapOrElse(p32, p33)
    if p32:IsSome() then
        return p32:Unwrap()
    else
        return p33()
    end
end
function v_u_1.And(p34, p35)
    -- upvalues: (copy) v_u_1
    if p34:IsSome() then
        return p35
    else
        return v_u_1.None
    end
end
function v_u_1.AndThen(p36, p37)
    -- upvalues: (copy) v_u_1
    if not p36:IsSome() then
        return v_u_1.None
    end
    local v38 = p37(p36:Unwrap())
    v_u_1.Assert(v38)
    return v38
end
function v_u_1.Or(p39, p40)
    if p39:IsSome() then
        return p39
    else
        return p40
    end
end
function v_u_1.OrElse(p41, p42)
    -- upvalues: (copy) v_u_1
    if p41:IsSome() then
        return p41
    end
    local v43 = p42()
    v_u_1.Assert(v43)
    return v43
end
function v_u_1.XOr(p44, p45)
    -- upvalues: (copy) v_u_1
    local v46 = p44:IsSome()
    if v46 == p45:IsSome() then
        return v_u_1.None
    elseif v46 then
        return p44
    else
        return p45
    end
end
function v_u_1.Filter(p47, p48)
    -- upvalues: (copy) v_u_1
    if p47:IsNone() or not p48(p47._v) then
        return v_u_1.None
    else
        return p47
    end
end
function v_u_1.Contains(p49, p50)
    local v51 = p49:IsSome()
    if v51 then
        v51 = p49._v == p50
    end
    return v51
end
function v_u_1.__tostring(p52)
    if not p52:IsSome() then
        return "Option<None>"
    end
    local v53 = p52._v
    return "Option<" .. typeof(v53) .. ">"
end
function v_u_1.__eq(p54, p55)
    -- upvalues: (copy) v_u_1
    if v_u_1.Is(p55) then
        if p54:IsSome() and p55:IsSome() then
            return p54:Unwrap() == p55:Unwrap()
        end
        if p54:IsNone() and p55:IsNone() then
            return true
        end
    end
    return false
end
v_u_1.None = v_u_1._new()
return v_u_1