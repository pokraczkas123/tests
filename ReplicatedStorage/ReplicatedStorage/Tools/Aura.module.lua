-- Decompiled game.ReplicatedStorage.Tools.Aura

local v1 = game:GetService("Players")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(script.PartsList)
local v_u_4 = require(v_u_2.Tools.Sound)
local v_u_5 = require(v_u_2.Common.State)
local v_u_6 = {}
v1.PlayerRemoving:Connect(function(p7)
    -- upvalues: (copy) v_u_6
    v_u_6[p7] = nil
end)
local v_u_26 = {
    ["applyForPlayer"] = function(p_u_8, p9, p10, p11)
        -- upvalues: (copy) v_u_2, (copy) v_u_26, (copy) v_u_6, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
        local v12 = v_u_2.Assets.Effects:FindFirstChild((("Aura%*"):format(p9)))
        local v13
        if p_u_8:IsA("Player") then
            v13 = p_u_8.Character
        else
            v13 = p_u_8
        end
        v_u_26.deleteForPlayer(p_u_8)
        v_u_6[p_u_8] = {}
        if v12 then
            for _, v14 in v12:GetChildren() do
                if v14.Name == "Limbs" then
                    for _, v15 in v14:GetChildren() do
                        for _, v16 in v13:GetChildren() do
                            if (not p11 or table.find(p11, v16.Name)) and v_u_3[v16.Name] then
                                local v17 = v15:Clone()
                                v17.Parent = v16
                                local v18 = v_u_6[p_u_8]
                                table.insert(v18, v17)
                                if v16.Name == "UpperTorso" then
                                    local v19 = v_u_6[p_u_8]
                                    local v20 = v_u_4.fromName("AbilityLoop")
                                    table.insert(v19, v20({
                                        ["Parent"] = v16,
                                        ["Looped"] = true
                                    }))
                                end
                            end
                        end
                    end
                elseif v14.Name == "VFX" and (not p11 or table.find(p11, "Root")) then
                    local v21 = v14:Clone()
                    local v22 = Instance.new("Weld")
                    v22.Part0 = v21
                    v22.Part1 = v13.UpperTorso
                    v21.Parent = v22
                    v22.Parent = v13.HumanoidRootPart
                    v22.Name = "VFX_Holder"
                    local v23 = v_u_6[p_u_8]
                    table.insert(v23, v22)
                end
            end
        end
        if p10 then
            return
        elseif v_u_5.get(p_u_8, v_u_5.Id.Ability, "Current") == nil then
            v_u_26.deleteForPlayer(p_u_8)
        else
            p_u_8:GetAttributeChangedSignal(v_u_5.getKey(v_u_5.Id.Ability, "Current")):Once(function()
                -- upvalues: (ref) v_u_26, (copy) p_u_8
                v_u_26.deleteForPlayer(p_u_8)
            end)
        end
    end,
    ["deleteForPlayer"] = function(p24)
        -- upvalues: (copy) v_u_6
        for _, v25 in v_u_6[p24] or {} do
            if v25 ~= nil and v25.Parent ~= nil then
                v25:Destroy()
            end
        end
        v_u_6[p24] = nil
    end
}
return v_u_26