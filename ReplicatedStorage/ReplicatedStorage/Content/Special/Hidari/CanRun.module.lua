-- Decompiled game.ReplicatedStorage.Content.Special.Hidari.CanRun

local v_u_1 = game:GetService("RunService"):IsClient()
local v2 = game:GetService("ReplicatedStorage")
require(script.Parent.Parent)
local v_u_3 = require(v2.Tools.Sound)
require(v2.Common.Context)
local v_u_4 = require(v2.Common.Physics)
local v_u_5 = require(v2.Assets.Effects.HidariSpikeVFX)
return function(p6, p_u_7)
    -- upvalues: (copy) v_u_1, (copy) v_u_4, (copy) v_u_3, (copy) v_u_5
    if p_u_7.Move ~= p6.Move then
        return false
    end
    if not (v_u_1 or p_u_7.ClientCanRunSpecial) then
        return false
    end
    if p_u_7.State.Custom.CachedCanRun ~= nil then
        return p_u_7.State.Custom.CachedCanRun
    end
    local v8 = p_u_7.Player.Character:GetPivot()
    local v9 = v_u_4.unit(v8.LookVector * Vector3.new(1, 0, 1))
    local v10 = p_u_7.Ball
    local v11
    if typeof(v10) == "table" then
        v11 = p_u_7.Ball:GetCFrame()
    else
        v11 = p_u_7.Ball:GetPivot()
    end
    local v12 = v11.Position
    local v13 = (p_u_7.State.Custom.MarginOfError or 0) - 0.2 > v_u_4.unit(v12 - v8.Position):Dot(v9:Cross(Vector3.new(0, 1, 0)))
    if v13 and v_u_1 then
        task.spawn(function()
            -- upvalues: (ref) v_u_3, (copy) p_u_7, (ref) v_u_5
            v_u_3.fromName("PowerSpike")({
                ["Parent"] = p_u_7.Player.Character.PrimaryPart
            })
            v_u_5(p_u_7.Player.Character)
        end)
    end
    p_u_7.State.Custom.CachedCanRun = v13
    p_u_7.State.Events.SpecialActive = v13
    return v13
end