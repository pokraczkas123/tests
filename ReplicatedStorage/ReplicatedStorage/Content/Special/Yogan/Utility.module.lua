-- Decompiled game.ReplicatedStorage.Content.Special.Yogan.Utility

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = nil
local v_u_4 = nil
local v_u_5 = require(v1.Packages.Knit)
local v_u_6 = require(v1.Common.State)
local v_u_7 = require(v1.Content.Style)
local v_u_8 = require(v1.Tools.Logger).new(script.Name)
return {
    ["applyState"] = function(p9, p10)
        -- upvalues: (ref) v_u_2, (copy) v_u_5, (ref) v_u_3, (ref) v_u_4, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8
        v_u_2 = v_u_2 or v_u_5.GetService("MultiplierService")
        v_u_3 = v_u_3 or v_u_5.GetService("GameService")
        v_u_4 = v_u_4 or v_u_5.GetService("QuestService")
        local v11 = v_u_6.get(p9, v_u_6.Id.Gameplay, "Style")
        local v12
        if v11 then
            v12 = v_u_7:Get(v11)
        else
            v12 = v11
        end
        if v11 and v12 and v12.Metadata and v12.Metadata.Special and v12.Metadata.Special.Id and v12.Metadata.Special.Id == "Yogan" then
            for v13, v18 in pairs(v12.Multipliers) do
                local v15 = v_u_7.MaximumStats[v13]
                local v16 = v_u_2
                local v17 = "Base"
                if p10 then
                    local v18 = v15
                end
                v16:Set(p9, v13, v17, v18)
            end
            v_u_3.Client.Effect:FireAll("RageAura", {
                ["IsModuleEffect"] = true,
                ["Character"] = p9.Character,
                ["Props"] = {
                    ["State"] = p10
                }
            })
            if p10 == true and v_u_3:CanObtainCareerProgress() then
                v_u_4:IncrementProgress(p9, v_u_4.Quest.Type.Special.Id, 1)
            end
        else
            v_u_8:Warn("Failed to apply Rage Special to player: " .. p9.Name .. " " .. v11)
        end
    end
}