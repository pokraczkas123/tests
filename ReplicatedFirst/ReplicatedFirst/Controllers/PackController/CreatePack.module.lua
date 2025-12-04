-- Decompiled game.ReplicatedFirst.Controllers.PackController.CreatePack

local v_u_1 = {
    {
        ["Buttons"] = { Enum.KeyCode.E, Enum.KeyCode.ButtonX },
        ["Offset"] = Vector2.new(0, 20)
    },
    {
        ["Buttons"] = { Enum.KeyCode.F, Enum.KeyCode.ButtonB },
        ["Offset"] = Vector2.new(-80, 100)
    },
    {
        ["Buttons"] = { Enum.KeyCode.R, Enum.KeyCode.ButtonY },
        ["Offset"] = Vector2.new(0, 100)
    }
}
local v_u_2 = game:GetService("Players")
local v3 = game:GetService("ReplicatedFirst")
local v_u_4 = game:GetService("ReplicatedStorage")
local v_u_5 = require(v_u_4.Packages.Knit)
local v_u_6 = require(v_u_4.Content.Monetization)
local v_u_7 = require(v_u_4.Content.Pack)
local v_u_8 = require(v_u_4.Content.Item)
local v_u_9 = require(v_u_4.Tools.Logger).new(script.Name)
local v_u_10 = require(v3.Components.DisplayItem)
local v_u_11 = require(v_u_4.Tools.Number)
local v_u_12 = require(v_u_4.Tools.Utility).getRigTemplateAsync
return function(p13)
    -- upvalues: (copy) v_u_7, (copy) v_u_9, (copy) v_u_5, (copy) v_u_1, (copy) v_u_11, (copy) v_u_6, (copy) v_u_4, (copy) v_u_2, (copy) v_u_8, (copy) v_u_10, (copy) v_u_12
    local v_u_14 = p13:GetAttribute("Pack")
    local v_u_15
    if v_u_14 then
        v_u_15 = v_u_7:Get(v_u_14)
    else
        v_u_15 = v_u_14
    end
    if v_u_15 then
        local v_u_16 = v_u_5.GetService("MonetizationService")
        local v_u_17 = v_u_5.GetService("PackService")
        local v_u_18 = v_u_5.GetController("ShopController")
        for v_u_19 = 1, 3 do
            if v_u_19 ~= 2 and (v_u_19 == 1 or not v_u_15.Cost) then
                local v20 = Instance.new("ProximityPrompt")
                v20.RequiresLineOfSight = false
                v20.KeyboardKeyCode = v_u_1[v_u_19].Buttons[1]
                v20.GamepadKeyCode = v_u_1[v_u_19].Buttons[2]
                v20.UIOffset = v_u_1[v_u_19].Offset
                v20.ObjectText = v_u_19 == 2 and "View" or v_u_19 == 3 and "Buy 3" or "Buy"
                local v21
                if v_u_19 == 2 then
                    v21 = "Pack"
                elseif v_u_15.Cost then
                    v21 = ("$%*"):format((v_u_11.format(v_u_15.Cost)))
                else
                    v21 = ("%* %*"):format(v_u_6.RobuxSymbol, v_u_6:GetDataFromName((("%*Pack%*"):format(v_u_14, v_u_19 == 3 and "3" or ""))).Cost)
                end
                v20.ActionText = v21
                v20.Triggered:Connect(function()
                    -- upvalues: (copy) v_u_19, (copy) v_u_16, (copy) v_u_14, (copy) v_u_18, (copy) v_u_15, (copy) v_u_17, (ref) v_u_9
                    if v_u_19 == 3 then
                        v_u_16:RequestPurchaseName((("%*Pack3"):format(v_u_14)))
                        return
                    elseif v_u_19 == 2 then
                        v_u_18:OpenAt("Packs")
                        return
                    elseif v_u_15.Cost then
                        local v22, v23 = v_u_17:Open(v_u_14):expect()
                        if not v22 then
                            v_u_9:Warn((("Failed to open Pack \'%*\': %*"):format(v_u_14, v23)))
                        end
                    else
                        v_u_16:RequestPurchaseName((("%*Pack"):format(v_u_14)))
                    end
                end)
                v20.Parent = p13
            end
        end
        local v24 = v_u_4.Assets.Misc.PackAnimRig:Clone()
        local v25 = CFrame.new(p13.CFrame.Position + Vector3.new(0, 6, 0))
        local v26 = CFrame.fromOrientation
        local v27 = math.random(360)
        v24:PivotTo(v25 * v26(0, math.rad(v27), 0))
        local v28 = v_u_15.Asset:Clone()
        v28.CFrame = v24.PrimaryPart.CFrame
        v28.CastShadow = false
        local v29, v30, v31 = v28.Color:ToHSV()
        v24.Highlight.OutlineColor = Color3.fromHSV(v29, v30, v31 * 0.5)
        for _, v32 in ipairs(v24:WaitForChild("Lighting"):GetChildren()) do
            v32.Color = v28.Color
            v32.Parent = v28
        end
        local v33 = Instance.new("Motor6D")
        v33.Part0 = v28
        v33.Part1 = v24.Cube
        v33.Parent = v24.Cube
        v28.Parent = v24
        v24.Parent = p13
        v28.CFrame = CFrame.new(v24.Cube.Position)
        local v34 = v_u_4.Assets.Misc.PackContent:Clone()
        v34.Adornee = p13
        v34.Enabled = true
        v34.Name = ("%* Pack Content"):format(v_u_14)
        v34.Parent = v_u_2.LocalPlayer.PlayerGui
        v34.Container.NameBG.PackName.Text = ("%* Pack"):format(v_u_15.DisplayName)
        v34.Container.NameBG.PackName.TextColor3 = v_u_15.Palette.Primary or Color3.new(1, 1, 1)
        v34.MainBG.UIGradient.Color = v_u_15.Palette.Background
        v34.Container.Inner.UIStroke.UIGradient.Color = v_u_15.Palette.Stroke
        local v35 = {}
        local v36 = {}
        for _, v37 in ipairs(v_u_15.Content) do
            local v38 = v_u_8:Get(v37)
            if v38 then
                v35[v37] = {
                    ["Item"] = v38,
                    ["Chance"] = v_u_15.Distribution[v38.Rarity]
                }
                v36[v38.Rarity] = (v36[v38.Rarity] or 0) + 1
            else
                v_u_9:Warn((("Failed to create Pack content: Item \'%*\' not found!"):format(v37)))
            end
        end
        local v39 = 10
        local v40 = nil
        for v41, v42 in pairs(v35) do
            local v43 = v42.Item
            if v43 then
                local v44 = v34.Container.Frame.Template:Clone()
                v44.Name = ("%*Item"):format(v43.Rarity)
                v44.Parent = v34.Container.Frame
                v44.Visible = true
                local v45 = v44.Chance
                local v46 = v42.Chance / v36[v43.Rarity] * 10000
                v45.Text = ("%*%%"):format(math.round(v46) / 100)
                v44.Rarity.Text = v_u_8.Rarity.Data[v43.Rarity].Name
                v44.Rarity.TextColor3 = v_u_8.Rarity.Data[v43.Rarity].Color
                v44.ImageColor3 = v_u_8.Rarity.Data[v43.Rarity].BackgroundColor
                v44.Stroke.ImageColor3 = v_u_8.Rarity.Data[v43.Rarity].Color
                if v43.Type == v_u_8.Type.Emote and v43.Rarity < v39 then
                    v39 = v43.Rarity
                else
                    v43 = v40
                end
                v_u_10(v44.ItemDisplay, v41)
                v40 = v43
            end
        end
        if v_u_15.Preview then
            v40 = v_u_8:Get(v_u_15.Preview)
        end
        if v40 then
            v28.CFrame = v28.CFrame + Vector3.new(0, 0, -6)
            local v47 = v_u_12()
            v47.Parent = v24
            v47:PivotTo(v24:GetPivot() + Vector3.new(0, -2.5, 6))
            v47.HumanoidRootPart.CFrame = CFrame.new(v47.HumanoidRootPart.Position) * CFrame.Angles(0, -1.5707963267948966, 0)
            v47.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
            local v48 = Instance.new("Animation")
            local v49 = v47:WaitForChild("Humanoid"):WaitForChild("Animator")
            v48.AnimationId = v40.Asset
            v48.Parent = v47
            local v50 = v49:LoadAnimation(v48)
            v50.Looped = true
            v50.Priority = Enum.AnimationPriority.Action4
            if v40.Metadata and v40.Metadata.Callback then
                v40.Metadata.Callback(v47, true)
            end
            v50:Play()
        end
    else
        v_u_9:Warn((("Failed to create Pack proximity prompt: Pack \'%*\' not found!"):format(v_u_14 or "(PACK ATTRIBUTE DOES NOT EXIST)")))
    end
end