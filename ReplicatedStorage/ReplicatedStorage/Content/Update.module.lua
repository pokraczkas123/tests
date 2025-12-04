-- Decompiled game.ReplicatedStorage.Content.Update

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Tools.Factory).new(script)
local v_u_3 = require(v1.Tools.Logger).new(script.Name)
local v_u_4 = setmetatable({
    ["SecondsNeededToSneakPeak"] = 172800
}, {
    ["__index"] = v2
})
function v_u_4.new(p5)
    -- upvalues: (copy) v_u_4
    local v6 = typeof(p5) == "table"
    local v7 = "Expected a table for argument 1, got " .. typeof(p5)
    assert(v6, v7)
    local v8 = p5.Id
    local v9 = typeof(v8) == "string"
    local v10 = p5.Id
    local v11 = "Expected a string for Id, got " .. typeof(v10)
    assert(v9, v11)
    local v12 = p5.Timestamp
    local v13 = typeof(v12) == "number"
    local v14 = p5.Timestamp
    local v15 = "Expected a number for Timestamp, got " .. typeof(v14)
    assert(v13, v15)
    local v16 = p5.DisplayName
    local v17 = typeof(v16) == "string"
    local v18 = p5.DisplayName
    local v19 = "Expected a string for DisplayName, got " .. typeof(v18)
    assert(v17, v19)
    local v20 = p5.Color
    local v21 = typeof(v20) == "ColorSequence"
    local v22 = p5.Color
    local v23 = "Expected a ColorSequence for Color, got " .. typeof(v22)
    assert(v21, v23)
    local v24 = p5.Header
    local v25 = typeof(v24) == "string"
    local v26 = p5.Header
    local v27 = "Expected a string for Header, got " .. typeof(v26)
    assert(v25, v27)
    local v28 = p5.SplashImage
    local v29 = typeof(v28) == "string"
    local v30 = p5.SplashImage
    local v31 = "Expected a string for SplashImage, got " .. typeof(v30)
    assert(v29, v31)
    local v32 = p5.Content
    local v33 = typeof(v32) == "table"
    local v34 = p5.Content
    local v35 = "Expected a table for Content, got " .. typeof(v34)
    assert(v33, v35)
    p5.Header = p5.Header:upper()
    for _, v36 in p5.Content do
        local v37 = v36.Type == "Short" and true or v36.Type == "Long"
        local v38 = v36.Type
        local v39 = "Expected Content.Type to be \'Short\' or \'Long\', got " .. tostring(v38)
        assert(v37, v39)
        local v40 = v36.Body
        local v41 = typeof(v40) == "string"
        local v42 = v36.Body
        local v43 = "Expected a string for Content.Body, got " .. typeof(v42)
        assert(v41, v43)
        v36.Body = ("\226\153\166 %*"):format(v36.Body)
    end
    return v_u_4:Create(p5)
end
function v_u_4.IsReadyToSneakPeak(p44, p45)
    local v46 = typeof(p45) == "table"
    local v47 = "Expected a table for argument 1, got " .. typeof(p45)
    assert(v46, v47)
    local v48 = p45.Timestamp
    local v49 = typeof(v48) == "number"
    local v50 = p45.Timestamp
    local v51 = "Expected a number for Timestamp, got " .. typeof(v50)
    assert(v49, v51)
    return DateTime.now().UnixTimestamp > p45.Timestamp - p44.SecondsNeededToSneakPeak
end
function v_u_4.GetCurrent(p52)
    -- upvalues: (copy) v_u_3
    local v53 = nil
    for _, v54 in script:GetChildren() do
        if v54:IsA("ModuleScript") then
            local v55 = require(v54)
            if p52:IsReadyToSneakPeak(v55) and v55.Timestamp > (v53 and (v53.Timestamp or 0) or 0) and v55.Timestamp <= DateTime.now().UnixTimestamp then
                v53 = v55
            end
        else
            v_u_3:Warn("Expected a ModuleScript, got " .. v54.ClassName)
        end
    end
    return v53
end
function v_u_4.GetHistory(_)
    -- upvalues: (copy) v_u_4
    local v56 = {}
    for _, v57 in v_u_4:GetAll() do
        if v57.Timestamp <= DateTime.now().UnixTimestamp then
            table.insert(v56, v57)
        end
    end
    return v56
end
return v_u_4