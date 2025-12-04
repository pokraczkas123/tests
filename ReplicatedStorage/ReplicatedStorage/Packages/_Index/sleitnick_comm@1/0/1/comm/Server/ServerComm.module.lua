-- Decompiled game.ReplicatedStorage.Packages._Index.sleitnick_comm@1.0.1.comm.Server.ServerComm

local v_u_1 = require(script.Parent)
require(script.Parent.Parent.Types)
local v_u_2 = require(script.Parent.Parent.Util)
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.new(p4, p5)
    -- upvalues: (copy) v_u_2, (copy) v_u_3
    local v6 = v_u_2.IsServer
    assert(v6, "ServerComm must be constructed from the server")
    local v7 = typeof(p4) == "Instance"
    assert(v7, "Parent must be of type Instance")
    local v8 = p5 or v_u_2.DefaultCommFolderName
    local v9 = not p4:FindFirstChild(v8)
    local v10 = "Parent already has another ServerComm bound to namespace " .. v8
    assert(v9, v10)
    local v11 = v_u_3
    local v12 = setmetatable({}, v11)
    v12._instancesFolder = Instance.new("Folder")
    v12._instancesFolder.Name = v8
    v12._instancesFolder.Parent = p4
    return v12
end
function v_u_3.BindFunction(p13, p14, p15, p16, p17)
    -- upvalues: (copy) v_u_1
    return v_u_1.BindFunction(p13._instancesFolder, p14, p15, p16, p17)
end
function v_u_3.WrapMethod(p18, p19, p20, p21, p22)
    -- upvalues: (copy) v_u_1
    return v_u_1.WrapMethod(p18._instancesFolder, p19, p20, p21, p22)
end
function v_u_3.CreateSignal(p23, p24, p25, p26, p27)
    -- upvalues: (copy) v_u_1
    return v_u_1.CreateSignal(p23._instancesFolder, p24, p25, p26, p27)
end
function v_u_3.CreateProperty(p28, p29, p30, p31, p32)
    -- upvalues: (copy) v_u_1
    return v_u_1.CreateProperty(p28._instancesFolder, p29, p30, p31, p32)
end
function v_u_3.Destroy(p33)
    p33._instancesFolder:Destroy()
end
return v_u_3