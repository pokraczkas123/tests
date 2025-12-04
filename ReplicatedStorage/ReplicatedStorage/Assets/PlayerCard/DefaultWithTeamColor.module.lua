-- Decompiled game.ReplicatedStorage.Assets.PlayerCard.DefaultWithTeamColor

local v_u_1 = require(script.Parent.PlayerCardLib)
return function(p2)
    -- upvalues: (copy) v_u_1
    local v3 = v_u_1.DefaultFrame()
    p2.Maid:GiveTask(v3)
    v_u_1.SetDefaultFrameProps(v3, p2)
    local v4 = v3.CardCanvas.CardHolder
    if p2.DisplayData.Team then
        local v5 = p2.Metadata.TeamImageMap
        if v5 then
            v5 = p2.Metadata.TeamImageMap[p2.DisplayData.Team.Name]
        end
        if v5 then
            v4.Image = v5
        else
            v4.Image = p2.Metadata.ImageGrey or p2.Metadata.Image
            v4.ImageColor3 = p2.DisplayData.Team.Color
        end
    end
    local v6 = v_u_1.AnimateDefaultFrame(v3)
    v3.Parent = p2.Container
    v6()
end