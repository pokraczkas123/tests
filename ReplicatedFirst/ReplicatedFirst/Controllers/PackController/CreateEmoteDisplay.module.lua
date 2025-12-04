-- Decompiled game.ReplicatedFirst.Controllers.PackController.CreateEmoteDisplay

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Knit)
local v_u_3 = require(v1.Content.Item)
local v_u_4 = require(v1.Tools.Logger).new(script.Name)
local v_u_5 = require(v1.Content.Monetization)
local v_u_6 = require(v1.Tools.Sound)
local v_u_7 = require(script.EmoteDisplay)
return function(p8)
    -- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7
    local v_u_9 = v_u_2.GetService("MonetizationService")
    local v_u_10 = p8:GetAttribute("Emote")
    local v11
    if v_u_10 then
        v11 = v_u_3:Get(v_u_10)
    else
        v11 = v_u_10
    end
    if v11 then
        local v12 = v_u_5:GetDataFromName(v_u_10)
        local v13 = Instance.new("ProximityPrompt")
        v13.RequiresLineOfSight = false
        v13.KeyboardKeyCode = Enum.KeyCode.E
        v13.MaxActivationDistance = 25
        v13.GamepadKeyCode = Enum.KeyCode.ButtonX
        v13.UIOffset = Vector2.new(0, 20)
        v13.ObjectText = ("%*"):format(v12.DisplayName)
        v13.ActionText = ("%* %*"):format(v_u_5.RobuxSymbol, v12.Cost)
        v13.PromptShown:Connect(function()
            -- upvalues: (ref) v_u_6
            v_u_6.playMusic("CrabRave")
        end)
        v13.PromptHidden:Connect(function()
            -- upvalues: (ref) v_u_6
            v_u_6.playMusic("Lobby")
        end)
        v13.Triggered:Connect(function()
            -- upvalues: (copy) v_u_9, (copy) v_u_10
            v_u_9:RequestPurchaseName(v_u_10)
        end)
        v13.Parent = p8
        v_u_7(v11, p8)
    else
        v_u_4:Warn((("[EmoteDisplay] - Emote \'%*\' not found!"):format(v_u_10 or "(EMOTE ATTRIBUTE DOES NOT EXIST)")))
    end
end