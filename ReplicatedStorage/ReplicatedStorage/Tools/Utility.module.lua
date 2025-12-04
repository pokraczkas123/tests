-- Decompiled game.ReplicatedStorage.Tools.Utility

local v_u_1 = Enum.ThumbnailType.HeadShot
local v_u_2 = Enum.ThumbnailSize.Size100x100
local v_u_3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("CollectionService")
local v_u_5 = game:GetService("Players")
local v_u_6 = require(v_u_3.Tools.Logger).new(script.Name)
local v_u_7 = require(v_u_3.Common.State)
local v_u_28 = {
    ["applyToAllTagged"] = function(p8, p9)
        -- upvalues: (copy) v_u_4
        for _, v10 in ipairs(v_u_4:GetTagged(p8)) do
            task.spawn(p9, v10)
        end
        return v_u_4:GetInstanceAddedSignal(p8):Connect(p9)
    end,
    ["getHeadshot"] = function(p11, p12)
        -- upvalues: (copy) v_u_2, (copy) v_u_7, (copy) v_u_28, (copy) v_u_5, (copy) v_u_1, (copy) v_u_6
        local v13 = p12 or v_u_2
        if typeof(p11) == "Instance" and p11:IsA("Player") then
            local v14 = ("Headshot%*"):format(v13.Name)
            local v15 = v_u_7.get(p11, v_u_7.Id.Cache, v14, nil)
            if not v15 then
                v15 = v_u_28.getHeadshot(p11.UserId, v13)
                v_u_7.set(p11, v_u_7.Id.Cache, v14, v15)
            end
            return v15
        end
        local v16 = math.max(p11, 1)
        local v17, v18 = pcall(v_u_5.GetUserThumbnailAsync, v_u_5, v16, v_u_1, v13)
        if v17 then
            return v18
        end
        v_u_6:Warn((("Failed to get headshot: %*"):format(v18)))
    end,
    ["getRigTemplateAsync"] = function()
        -- upvalues: (copy) v_u_28, (copy) v_u_3, (copy) v_u_5
        if v_u_28.RigTemplate then
            return v_u_28.RigTemplate:Clone()
        end
        if v_u_28.FetchingRig then
            repeat
                task.wait()
            until v_u_28.RigTemplate
        end
        v_u_28.FetchingRig = true
        local v19 = v_u_3.Assets.Misc.EmoteRig:Clone()
        v19.Name = "EmoteRig"
        v19.Parent = workspace
        v19.PrimaryPart.Anchored = true
        v19:PivotTo(CFrame.new())
        local v20 = v_u_5
        local v21 = v_u_5.LocalPlayer.UserId
        local v22 = v20:GetHumanoidDescriptionFromUserId((math.max(v21, 1)))
        v22.Head = 0
        v22.LeftArm = 0
        v22.RightArm = 0
        v22.LeftLeg = 0
        v22.RightLeg = 0
        v22.Torso = 0
        local v23 = v22.HeightScale
        v22.HeightScale = math.clamp(v23, 0.9, 1)
        v22.BodyTypeScale = 0
        v22.ProportionScale = 0
        v19.Humanoid:ApplyDescription(v22, Enum.AssetTypeVerification.Default)
        v19.Parent = nil
        v19:PivotTo(CFrame.new())
        v_u_28.RigTemplate = v19:Clone()
        return v19:Clone()
    end,
    ["deepClone"] = function(p24)
        -- upvalues: (copy) v_u_28
        local v25 = table.create(#p24)
        for v26, v27 in p24 do
            if type(v27) == "table" then
                v25[v26] = v_u_28.deepClone(v27)
            else
                v25[v26] = v27
            end
        end
        return v25
    end
}
return v_u_28