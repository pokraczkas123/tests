-- Decompiled game.ReplicatedFirst.Controllers.SettingsController.Settings.BubbleChat

local v_u_1 = game:GetService("TextChatService")
return function(p2)
    -- upvalues: (copy) v_u_1
    local v3 = v_u_1:FindFirstChild("BubbleChatConfiguration")
    if v3 then
        v3.Enabled = p2
    end
end