-- Decompiled game.ReplicatedFirst.Controllers.LikeRewardController

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("AvatarEditorService")
local v_u_4 = nil
local v_u_5 = nil
local v_u_6 = nil
local v_u_7 = require(v2.Packages.Knit)
local v_u_8 = require(v2.Configuration.Place)()
local v_u_9 = require(v1.Components.Button)
local v10 = v_u_7.CreateController({
    ["Name"] = "LikeRewardController"
})
function v10.KnitStart(p11)
    -- upvalues: (ref) v_u_4, (copy) v_u_7, (ref) v_u_5, (ref) v_u_6
    v_u_4 = v_u_7.GetService("RewardService")
    v_u_5 = v_u_7.GetController("InterfaceController")
    v_u_6 = v_u_7.GetController("GameController")
    p11.CanAccesInventory = false
    p11.IsPrompting = false
    p11.Component = p11:LoadComponent()
    p11:BindToInventoryReadAccess()
end
function v10.LoadComponent(p_u_12)
    -- upvalues: (ref) v_u_5, (copy) v_u_9, (copy) v_u_3
    local v13 = v_u_5.App.Lobby.LikeReward
    local v14 = {
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_5
            v_u_5:SelectLobbyMenu("")
        end
    }
    v_u_9(v13.BGFrame.CloseBTN)(v14)
    local v15 = {
        ["OnActivated"] = function()
            -- upvalues: (copy) p_u_12, (ref) v_u_3
            if p_u_12.IsPrompting then
                return
            elseif p_u_12.CanAccesInventory then
                p_u_12:Activate()
            else
                p_u_12.IsPrompting = true
                v_u_3:PromptAllowInventoryReadAccess()
            end
        end
    }
    v_u_9(v13.BGFrame.Body.EnterButton)(v15)
    return v13
end
function v10.BindToInventoryReadAccess(p_u_16)
    -- upvalues: (copy) v_u_3, (ref) v_u_6
    v_u_3.PromptAllowInventoryReadAccessCompleted:Connect(function(p17)
        -- upvalues: (copy) p_u_16, (ref) v_u_6
        p_u_16.IsPrompting = false
        if p17 == Enum.AvatarPromptResult.Success then
            p_u_16.CanAccesInventory = true
            p_u_16:Activate()
        else
            v_u_6:Notify({
                ["Body"] = "Need access in order to check if favorited!"
            })
        end
    end)
end
function v10.Activate(_)
    -- upvalues: (copy) v_u_3, (copy) v_u_8, (ref) v_u_6, (ref) v_u_4
    if v_u_3:GetFavorite(v_u_8.Default, Enum.AvatarItemType.Asset) then
        local v18, v19 = v_u_4:RequestReward("Like"):expect()
        if not v18 then
            v_u_6:Notify({
                ["Body"] = v19
            })
        end
    else
        v_u_6:Notify({
            ["Body"] = "You must favorite the game to receive the reward."
        })
    end
end
return v10