-- Decompiled game.ReplicatedFirst.Controllers.EncryptedAssetsController

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("ContentProvider")
local v_u_3 = game:GetService("SoundService")
local v_u_4 = nil
local v_u_5 = require(v1.Packages.Knit)
local v6 = v_u_5.CreateController({
    ["Name"] = "EncryptedAssetsController"
})
function v6.KnitInit(_)
    -- upvalues: (ref) v_u_4, (copy) v_u_5
    v_u_4 = v_u_5.GetService("EncryptedAssetsService")
end
function v6.KnitStart(p_u_7)
    -- upvalues: (ref) v_u_4
    local v_u_8 = nil
    v_u_8 = v_u_4.Assets:Observe(function(p9)
        -- upvalues: (copy) p_u_7, (ref) v_u_8
        p_u_7:OnAssetsUpdated(p9)
        v_u_8:Disconnect()
    end)
end
function v6.OnAssetsUpdated(_, p10)
    -- upvalues: (copy) v_u_2, (copy) v_u_3
    for _, v11 in ipairs(p10) do
        local v12 = v11.Id
        v_u_2:RegisterSessionEncryptedAsset(v12, v11.Key)
        local v13 = Instance.new("Sound")
        v13.SoundId = v12
        v13.Volume = 0
        v13.Name = v11.Name
        v13.Looped = true
        v13.Parent = v_u_3.Music
        v13:Play()
    end
end
return v6