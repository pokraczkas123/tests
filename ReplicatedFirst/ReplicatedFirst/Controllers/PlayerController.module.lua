-- Decompiled game.ReplicatedFirst.Controllers.PlayerController

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v3 = require(v2.Packages.Knit)
local v_u_4 = require(v2.Packages.Fusion)
local v_u_5 = require(v2.Tools.Utility).getHeadshot
local v_u_6 = require(v2.Tools.Logger).new(script.Name)
local v_u_7 = require(v2.Common.State)
local v8 = v3.CreateController({
    ["Name"] = "PlayerController",
    ["Player"] = v_u_1.LocalPlayer
})
function v8.KnitInit(p_u_9)
    -- upvalues: (copy) v_u_4
    p_u_9.Players = v_u_4.Value({})
    p_u_9.LocalFriends = v_u_4.Value({})
    p_u_9:BindToPlayers()
    task.spawn(function()
        -- upvalues: (copy) p_u_9
        p_u_9:BindToLocalPlayersFriends()
    end)
end
function v8.AddPlayer(p10, p11)
    -- upvalues: (copy) v_u_7, (copy) v_u_5
    local v12 = p10.Players:get()
    v12[p11.UserId] = {
        ["Name"] = p11.Name,
        ["DisplayName"] = p11.DisplayName,
        ["Instance"] = p11,
        ["UserId"] = p11.UserId,
        ["Headshot"] = v_u_7.get(p11, v_u_7.Id.Cache, ("Headshot%*"):format(Enum.ThumbnailSize.Size100x100.Name), "")
    }
    p10.Players:set(v12)
    local v13 = v_u_5(p11)
    local v14 = p10.Players:get()
    if v14[p11.UserId] then
        v14[p11.UserId].Headshot = v13
        p10.Players:set(v14)
    end
end
function v8.RemovePlayer(p15, p16)
    local v17 = p15.Players:get()
    v17[p16.UserId] = nil
    p15.Players:set(v17)
end
function v8.BindToPlayers(p_u_18)
    -- upvalues: (copy) v_u_1
    for _, v_u_19 in ipairs(v_u_1:GetPlayers()) do
        task.spawn(function()
            -- upvalues: (copy) p_u_18, (copy) v_u_19
            p_u_18:AddPlayer(v_u_19)
        end)
    end
    v_u_1.PlayerAdded:Connect(function(p20)
        -- upvalues: (copy) p_u_18
        p_u_18:AddPlayer(p20)
    end)
    v_u_1.PlayerRemoving:Connect(function(p21)
        -- upvalues: (copy) p_u_18
        p_u_18:RemovePlayer(p21)
    end)
end
function v8.BindToLocalPlayersFriends(p_u_22)
    -- upvalues: (copy) v_u_1, (copy) v_u_6
    local v23, v24 = pcall(function()
        -- upvalues: (ref) v_u_1, (copy) p_u_22
        return v_u_1:GetFriendsAsync(p_u_22.Player.UserId)
    end)
    if not v23 then
        v_u_6:Warn((("Failed to get friends! Got %*"):format(v24)))
        return
    end
    local v25 = p_u_22.LocalFriends:get()
    local v26 = v24:GetCurrentPage()
    while v26 do
        for _, v27 in ipairs(v26) do
            if v27.DisplayName ~= "Account Deleted" then
                v27.UserId = v27.Id
                v27.Id = nil
                v27.Name = v27.Username
                v27.Username = nil
                table.insert(v25, v27)
            end
        end
        if v24.IsFinished then
            break
        end
        v26 = v24:AdvanceToNextPageAsync()
    end
    p_u_22.LocalFriends:set(v25)
end
return v8