-- Decompiled game.ReplicatedFirst.Controllers.UpdateController

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = require(v1.Packages.Knit)
local v_u_4 = require(v1.Packages.Fusion)
local v_u_5 = require(v1.Tools.Utility).applyToAllTagged
local v_u_6 = require(v1.Content.Update)
local v_u_7 = require(v1.Tools.Time)
local v8 = v_u_3.CreateController({
    ["Name"] = "UpdateController"
})
function v8.KnitStart(p_u_9)
    -- upvalues: (ref) v_u_2, (copy) v_u_3, (copy) v_u_5
    v_u_2 = v_u_3.GetController("InterfaceController")
    p_u_9.Update = p_u_9:BindToLatestUpdateTease()
    v_u_5("UpdateBillboard", function(p10)
        -- upvalues: (copy) p_u_9
        if p_u_9.Update and p_u_9.Update.Timestamp then
            p_u_9:DisplayUpdate(p10)
        else
            p10:Destroy()
        end
    end)
end
function v8.BindToLatestUpdateTease(_)
    -- upvalues: (copy) v_u_6
    local v11 = v_u_6:GetCurrent()
    for _, v12 in v_u_6:GetAll() do
        if v12.Timestamp > v11.Timestamp and v_u_6:IsReadyToSneakPeak(v12) then
            v11 = v12
        end
    end
    return v11
end
function v8.DisplayUpdate(p_u_13, p14)
    -- upvalues: (copy) v_u_4, (copy) v_u_7, (ref) v_u_2
    local v15 = DateTime.now().UnixTimestamp > p_u_13.Update.Timestamp
    local v16, v17, v18 = p_u_13.Update.Color.Keypoints[#p_u_13.Update.Color.Keypoints].Value:ToHSV()
    p14.Content.Text = p_u_13.Update.DisplayName:upper()
    p14.Content.UIGradient.Color = p_u_13.Update.Color
    p14.Title.Text = v15 and "CURRENT UPDATE" or "NEXT UPDATE"
    p14.Title.UIGradient.Color = ColorSequence.new(Color3.fromHSV(v16, v17 * 0.7, v18), Color3.fromHSV(v16, v17 * 0.9, v18 * 0.4))
    v_u_4.Hydrate(p14.Subtitle)({
        ["Text"] = v15 and "NOW" or v_u_4.Computed(function()
            -- upvalues: (ref) v_u_7, (copy) p_u_13, (ref) v_u_2
            return v_u_7.toDHMS(p_u_13.Update.Timestamp - v_u_2.DynamicTimestamp:get())
        end)
    })
end
return v8