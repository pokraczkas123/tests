-- Decompiled game.ReplicatedFirst.Controllers.SystemChatController

local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("TextChatService")
local v_u_3 = nil
local v_u_4 = nil
local v_u_5 = require(v1.Packages.Knit)
local v6 = v_u_5.CreateController({
    ["Name"] = "SystemChatController",
    ["Channel"] = v2.TextChannels:FindFirstChild("RBXGeneral")
})
function v6.KnitInit(_)
    -- upvalues: (ref) v_u_3, (copy) v_u_5, (ref) v_u_4
    v_u_3 = v_u_5.GetService("BanService")
    v_u_4 = v_u_5.GetService("StyleService")
end
function v6.KnitStart(p_u_7)
    -- upvalues: (ref) v_u_3, (ref) v_u_4
    v_u_3.PlayerBanned:Connect(function(p8)
        -- upvalues: (copy) p_u_7
        p_u_7:LogSystemMessage((("<stroke color=\"rgb(100, 0, 0)\"> <font color=\"rgb(255, 117, 117)\">@%* was struck by the ban hammer</font></stroke>"):format(p8)))
    end)
    v_u_4.UltraRolled:Connect(function(p9, p10, p11)
        -- upvalues: (copy) p_u_7
        local v12 = p10:upper()
        local v13 = string.format("@%s HAS UNLOCKED ", p9):upper()
        local v14 = {
            "252, 71, 168",
            "254, 250, 2",
            "108, 249, 11",
            "21, 239, 251",
            "131, 35, 249"
        }
        for v15 = 1, #v12 do
            local v16 = v12:sub(v15, v15)
            local v17 = v14[(v15 - 1) % #v14 + 1]
            v13 = v13 .. string.format("<font family=\"%s\" color=\"%s\">%s</font>", "rbxassetid://12187360881", ("rgb(%*)"):format(v17), v16)
        end
        p_u_7:LogSystemMessage((("<bold>%*</bold>"):format(v13 .. string.format(" WITH A %s SPIN!", p11 and "LUCKY" or "REGULAR"))))
    end)
end
function v6.LogSystemMessage(p18, p19)
    p18.Channel:DisplaySystemMessage(("[SERVER] %s"):format(p19))
end
return v6