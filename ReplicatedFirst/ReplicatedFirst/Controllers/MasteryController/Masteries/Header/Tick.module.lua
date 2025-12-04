-- Decompiled game.ReplicatedFirst.Controllers.MasteryController.Masteries.Header.Tick

local v_u_1 = Color3.fromRGB(255, 157, 0)
local v_u_2 = Color3.fromRGB(98, 94, 129)
local v_u_3 = Color3.fromRGB(0, 234, 255)
require(script.Parent.Parent.Parent.Types)
return function(p4)
    -- upvalues: (copy) v_u_3, (copy) v_u_1, (copy) v_u_2
    local v5 = p4.Component
    local v6
    if p4.RawQuest.Claimed then
        v6 = v_u_3
    elseif (p4.RawQuest.Progress or 0) / (p4.RawQuest.Requirement or 1) >= 1 then
        v6 = v_u_1
    else
        v6 = v_u_2
    end
    v5.ImageColor3 = v6
    p4.Component.Visible = true
    return p4.Component
end