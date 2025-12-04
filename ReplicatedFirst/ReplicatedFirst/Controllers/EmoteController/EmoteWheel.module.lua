-- Decompiled game.ReplicatedFirst.Controllers.EmoteController.EmoteWheel

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedFirst")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("GamepadService")
local v_u_5 = require(v3.Packages.Knit)
local v_u_6 = require(v3.Packages.Fusion)
local v_u_7 = require(v2.Components.DisplayItem)
local v_u_8 = require(v2.Components.Button)
local v_u_9 = require(v3.Common.State)
local v_u_10 = require(v3.Content.Item)
local v_u_11 = v_u_6.Children
return function(p_u_12)
    -- upvalues: (copy) v_u_5, (copy) v_u_1, (copy) v_u_6, (copy) v_u_4, (copy) v_u_10, (copy) v_u_8, (copy) v_u_9, (copy) v_u_11, (copy) v_u_7
    local v_u_13 = v_u_5.GetController("InterfaceController")
    local v_u_14 = v_u_5.GetController("AnimationController")
    local v_u_15 = v_u_5.GetService("InventoryService")
    local v_u_16 = v_u_5.GetController("SpecialController")
    local v_u_17 = v_u_1.LocalPlayer
    local v_u_18 = v_u_6.Hydrate(p_u_12.Component)({
        ["Visible"] = p_u_12.Visible
    })
    local v19 = v_u_6.Observer(p_u_12.Visible)
    v19:onChange(function()
        -- upvalues: (copy) p_u_12, (copy) v_u_13, (ref) v_u_4, (copy) v_u_18
        if p_u_12.Visible:get() then
            v_u_13:SelectLobbyMenu("")
            v_u_4:EnableGamepadCursor(v_u_18)
        else
            v_u_4:DisableGamepadCursor()
        end
    end)
    v19:update()
    for v_u_20 = 1, 4 do
        local v_u_23 = v_u_6.Computed(function()
            -- upvalues: (copy) p_u_12, (copy) v_u_20, (ref) v_u_10
            local v21 = p_u_12.Emotes:get()
            if v21[v_u_20] and v21[v_u_20] ~= "nil" then
                local v22 = v_u_10:Get(v21[v_u_20])
                if v22 then
                    return v22
                end
            end
        end)
        local v_u_29 = v_u_8(v_u_18:FindFirstChild(v_u_20))({
            ["ImageColor"] = v_u_6.Computed(function()
                -- upvalues: (copy) v_u_23, (ref) v_u_10
                local v24 = v_u_23:get()
                if v24 then
                    return v_u_10.Rarity.Data[v24.Rarity].Color
                else
                    return Color3.new()
                end
            end),
            ["OnActivated"] = function()
                -- upvalues: (copy) v_u_17, (copy) v_u_16, (ref) v_u_9, (copy) v_u_13, (copy) p_u_12, (copy) v_u_15, (copy) v_u_20, (copy) v_u_23, (copy) v_u_14
                local v25 = v_u_17.character
                if v25 and v25.Humanoid.Health > 0 and v25.Humanoid.MoveDirection.Magnitude <= 0 and v_u_16.ChargeBar:Evaluate() == nil and not (v_u_9.get(v_u_13.Player, v_u_9.Id.Context, "IsServing") or v_u_13.IsJumping:get()) then
                    local v26 = p_u_12.SelectedEmote:get()
                    p_u_12.Visible:set(false)
                    if v26 then
                        v_u_15:EquipEmote(v26, v_u_20)
                        p_u_12.SelectedEmote:set()
                        v_u_13:SelectLobbyMenu("Inventory")
                    else
                        local v27 = v_u_23:get()
                        if v27 then
                            if v_u_9.get(v_u_17, v_u_9.Id.Debounce, "EmoteDebounce", 0) > workspace:GetServerTimeNow() then
                                return
                            end
                            local v_u_28 = workspace:GetServerTimeNow() + 1
                            v_u_9.set(v_u_17, v_u_9.Id.Debounce, "EmoteDebounce", v_u_28)
                            v_u_14:PlayAnimation(v27.Id)
                            v_u_15:UseEmote(v27.Id)
                            if v27.Metadata.Looped then
                                return
                            end
                            task.delay(v_u_14:GetAnimationLength(v27.Id), function()
                                -- upvalues: (ref) v_u_9, (ref) v_u_17, (copy) v_u_28, (ref) v_u_15
                                if v_u_9.get(v_u_17, v_u_9.Id.Debounce, "EmoteDebounce") == v_u_28 then
                                    v_u_15:StopEmotes()
                                end
                            end)
                        end
                    end
                else
                    return
                end
            end
        })
        v_u_6.Hydrate(v_u_29.DisplayName)({
            ["Text"] = v_u_6.Computed(function()
                -- upvalues: (copy) v_u_23
                local v30 = v_u_23:get()
                return not v30 and "None" or v30.DisplayName
            end)
        })
        v_u_6.Hydrate(v_u_29.ItemDisplay)({
            [v_u_11] = v_u_6.Computed(function()
                -- upvalues: (copy) v_u_23, (ref) v_u_7, (copy) v_u_29
                local v31 = v_u_23:get()
                return not v31 and {} or v_u_7(v_u_29.ItemDisplay, v31.Id)
            end, v_u_6.cleanup)
        })
    end
    v_u_8(v_u_18.ChangeBtn)({
        ["Visible"] = v_u_6.Computed(function()
            -- upvalues: (copy) v_u_13, (copy) p_u_12
            local v32
            if v_u_13.InGame:get() == false then
                v32 = p_u_12.SelectedEmote:get() == nil
            else
                v32 = false
            end
            return v32
        end),
        ["OnActivated"] = function()
            -- upvalues: (copy) p_u_12, (copy) v_u_13
            p_u_12.Visible:set(false)
            v_u_13:SelectLobbyMenu("Inventory")
        end
    })
    return v_u_18
end