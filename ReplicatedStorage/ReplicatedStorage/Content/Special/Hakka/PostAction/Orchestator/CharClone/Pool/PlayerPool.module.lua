-- Decompiled game.ReplicatedStorage.Content.Special.Hakka.PostAction.Orchestator.CharClone.Pool.PlayerPool

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Tools.Pooler)
require(v1.Tools.CharBot.CharRender)
local v_u_3 = require(script.Parent.HandleCharRender)
local v_u_4 = require(script.Parent.GlobalPool)
local v_u_5 = require(script.Parent.Appearance)
return {
    ["createPool"] = function(p_u_6)
        -- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_5, (copy) v_u_3
        local v_u_7 = {}
        local v13 = {
            ["NewObject"] = function()
                -- upvalues: (ref) v_u_4, (copy) v_u_7, (ref) v_u_5, (copy) p_u_6
                local v_u_8 = v_u_4.Pool:CheckOutOrMake()
                v_u_7[v_u_8] = task.defer(function()
                    -- upvalues: (ref) v_u_5, (ref) p_u_6, (copy) v_u_8, (ref) v_u_7
                    v_u_5.applyCloneAppearanceAsync(p_u_6, v_u_8)
                    v_u_7[v_u_8] = nil
                end)
                return v_u_8
            end,
            ["HandleObjectCheckOut"] = function(p9)
                -- upvalues: (ref) v_u_3, (copy) p_u_6
                v_u_3.prepForOnscreen(p9, p_u_6.Name)
            end,
            ["HandleObjectCheckIn"] = function(p10)
                -- upvalues: (ref) v_u_3, (ref) v_u_4, (copy) p_u_6
                v_u_3.goOffscreen(p10, v_u_4.ModelCache, p_u_6.Name)
                return true
            end,
            ["DestroyObject"] = function(p11)
                -- upvalues: (copy) v_u_7, (ref) v_u_4
                local v12 = v_u_7[p11]
                if v12 then
                    task.cancel(v12)
                    v_u_7[p11] = nil
                end
                v_u_4.Pool:CheckIn(p11)
            end
        }
        return v_u_2.new(v13)
    end,
    ["preFillPool"] = function(p_u_14, p_u_15)
        task.defer(function()
            -- upvalues: (copy) p_u_15, (copy) p_u_14
            for _ = 1, p_u_15 do
                p_u_14:MakeCheckedInObject()
            end
        end)
    end
}