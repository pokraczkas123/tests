-- Decompiled game.ReplicatedStorage.Content.Special.Hakka.PostAction.Orchestator.CharClone.Pool.Config

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Common.State)
local v_u_3 = {}
local v4 = {
    ["START_CHARS"] = 4,
    ["CLONES_PER_PLAYER"] = {
        ["DEFAULT"] = 1,
        ["LEVEL_MAX"] = 2
    },
    ["CHAR_POOL_REFRESH_TIME"] = 60,
    ["FOLDER_NAME"] = "Pooled Clones",
    ["MODEL_PREFIXES"] = {
        ["OFFSCREEN"] = "BOT_OFFSCREEN",
        ["ONSCREEN"] = "BOT_ONSCREEN"
    },
    ["OFFSCREEN_POSITION"] = Vector3.new(0, -250, 0)
}
v_u_3.Constants = v4
function v_u_3.computeStartCount(p5)
    -- upvalues: (copy) v_u_2, (copy) v_u_3
    if v_u_2.get(p5, v_u_2.Id.Gameplay, "Style") == "Hakka" and v_u_2.get(p5, v_u_2.Id.Mastery, "Level") >= 5 then
        return v_u_3.Constants.CLONES_PER_PLAYER.LEVEL_MAX
    else
        return v_u_3.Constants.CLONES_PER_PLAYER.DEFAULT
    end
end
function v_u_3.isHakkaCurrentStyle(p6)
    -- upvalues: (copy) v_u_2
    return v_u_2.get(p6, v_u_2.Id.Gameplay, "Style") == "Hakka"
end
function v_u_3.isInGame(p7)
    -- upvalues: (copy) v_u_2
    return v_u_2.get(p7, v_u_2.Id.Gameplay, "InGame") == true
end
function v_u_3.canPlayerHaveClones(p8)
    -- upvalues: (copy) v_u_3
    local v9 = v_u_3.isHakkaCurrentStyle(p8)
    if v9 then
        v9 = v_u_3.isInGame(p8)
    end
    return v9
end
return v_u_3