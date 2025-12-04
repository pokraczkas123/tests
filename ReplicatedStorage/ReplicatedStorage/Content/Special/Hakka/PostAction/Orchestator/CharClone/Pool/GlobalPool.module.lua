-- Decompiled game.ReplicatedStorage.Content.Special.Hakka.PostAction.Orchestator.CharClone.Pool.GlobalPool

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Tools.Pooler)
require(v1.Tools.CharBot.CharRender)
local v3 = require(script.Parent.Config)
local v_u_4 = require(script.Parent.HandleCharRender)
local v_u_5 = require(script.Parent.Appearance)
local v_u_6 = v1:FindFirstChild(v3.Constants.FOLDER_NAME)
if not v_u_6 then
    v_u_6 = Instance.new("Folder")
    v_u_6.Name = v3.Constants.FOLDER_NAME
    v_u_6.Parent = v1
end
local v9 = {
    ["NewObject"] = function()
        -- upvalues: (copy) v_u_4, (ref) v_u_6
        return v_u_4.create(v_u_6)
    end,
    ["HandleObjectCheckIn"] = function(p7)
        -- upvalues: (copy) v_u_4, (ref) v_u_6, (copy) v_u_5
        v_u_4.goOffscreen(p7, v_u_6)
        v_u_5.unapplyCloneAppearance(p7)
        return true
    end,
    ["DestroyObject"] = function(p8)
        p8:Destroy()
    end
}
local v_u_11 = {
    ["Pool"] = v2.new(v9),
    ["ModelCache"] = v_u_6,
    ["makeCheckedInObjects"] = function(p_u_10)
        -- upvalues: (copy) v_u_11
        task.defer(function()
            -- upvalues: (copy) p_u_10, (ref) v_u_11
            for _ = 1, p_u_10 do
                v_u_11.Pool:MakeCheckedInObject()
            end
        end)
    end
}
return v_u_11