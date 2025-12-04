-- Decompiled game.ReplicatedStorage.Assets.PlayerCard.Default

local v_u_1 = require(script.Parent.PlayerCardLib)
return function(p2)
    -- upvalues: (copy) v_u_1
    local v3 = v_u_1.DefaultFrame()
    p2.Maid:GiveTask(v3)
    v_u_1.SetDefaultFrameProps(v3, p2)
    local v4 = v_u_1.AnimateDefaultFrame(v3)
    v3.Parent = p2.Container
    v4()
end