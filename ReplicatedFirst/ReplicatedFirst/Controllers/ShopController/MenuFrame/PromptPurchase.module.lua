-- Decompiled game.ReplicatedFirst.Controllers.ShopController.MenuFrame.PromptPurchase

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = nil
local v_u_4 = nil
local v_u_5 = require(v1.Packages.Knit)
local v_u_6 = require(v1.Configuration.Game)
require(v1.Content.Shop)
local v_u_7 = require(v1.Tools.Number)
local v_u_8 = {
    ["Icon"] = "rbxassetid://13321838559",
    ["Header"] = "PURCHASE",
    ["Options"] = {
        ["Confirm"] = "OK",
        ["Cancel"] = "BACK"
    }
}
return function(p_u_9)
    -- upvalues: (ref) v_u_2, (copy) v_u_5, (ref) v_u_3, (ref) v_u_4, (copy) v_u_8, (copy) v_u_7, (copy) v_u_6
    v_u_2 = v_u_2 or v_u_5.GetService("ShopService")
    v_u_3 = v_u_3 or v_u_5.GetController("PromptController")
    v_u_4 = v_u_4 or v_u_5.GetController("GameController")
    v_u_3:Open({
        ["Icon"] = v_u_8.Icon,
        ["Header"] = v_u_8.Header,
        ["Body"] = ("Purchase %* for %* Gems?"):format(p_u_9.RewardText, (v_u_7.format(p_u_9.Cost))),
        ["Option1"] = v_u_8.Options.Confirm,
        ["Option2"] = v_u_8.Options.Cancel,
        ["Callback1"] = function()
            -- upvalues: (ref) v_u_2, (copy) p_u_9, (ref) v_u_4, (ref) v_u_6
            local v10, v11 = v_u_2:Purchase(p_u_9.SourceEnum, p_u_9.PurchaseIndex):expect()
            v_u_4:Notify({
                ["Body"] = v11,
                ["Color"] = v10 and v_u_6.Notification.Color.Green or v_u_6.Notification.Color.Red
            })
        end
    })
end