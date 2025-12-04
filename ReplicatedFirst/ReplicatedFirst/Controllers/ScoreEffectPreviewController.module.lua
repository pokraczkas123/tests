-- Decompiled game.ReplicatedFirst.Controllers.ScoreEffectPreviewController

local v_u_1 = game:GetService("CollectionService")
local v2 = game:GetService("Players")
local v3 = game:GetService("ReplicatedFirst")
local v4 = game:GetService("ReplicatedStorage")
local v_u_5 = game:GetService("RunService")
local v_u_6 = nil
local v_u_7 = nil
local v_u_8 = require(v4.Packages.Fusion)
local v_u_9 = require(v3.Components.Button)
local v_u_10 = require(script.PreviewTemplate)
local v_u_11 = require(v4.Packages.Knit)
local v_u_12 = require(v4.Packages.Maid)
local v_u_13 = require(v4.Common.State)
local v_u_14 = require(v4.Tools.Sound)
local v_u_15 = require(v4.Content.Item)
local v_u_16 = require(script.Group)
local v17 = v_u_11.CreateController({
    ["Name"] = "ScoreEffectPreviewController",
    ["Player"] = v2.LocalPlayer
})
function v17.KnitStart(p18)
    -- upvalues: (ref) v_u_6, (copy) v_u_11, (ref) v_u_7
    v_u_6 = v_u_11.GetController("InterfaceController")
    v_u_7 = v_u_11.GetController("InventoryController")
    p18.Connection = nil
    p18.Groups = {}
    p18.Inventory = v_u_7:BindToInventoryAsync()
    p18.Component = p18:LoadComponent()
end
function v17.BindCamera(p_u_19, p20)
    -- upvalues: (copy) v_u_1, (copy) v_u_5, (copy) v_u_13, (ref) v_u_6
    if p_u_19.Connection then
        p_u_19.Connection:Disconnect()
        p_u_19.Connection = nil
    end
    local v21 = v_u_1:GetTagged("ScoreEffectPreview")
    if #v21 == 0 then
        return
    else
        local v_u_22 = CFrame.new(v21[1].Origin.Position, v21[1].Focus.Position) * CFrame.new(4, 0, 0)
        if p20 == false then
            p20 = false
        end
        local v_u_23 = workspace.CurrentCamera
        if p20 then
            p_u_19.Connection = v_u_5.RenderStepped:Connect(function()
                -- upvalues: (ref) v_u_13, (copy) p_u_19, (ref) v_u_6, (copy) v_u_23, (copy) v_u_22
                if v_u_13.get(p_u_19.Player, v_u_13.Id.Gameplay, "InGame") then
                    p_u_19.Connection:Disconnect()
                    p_u_19.Connection = nil
                    p_u_19:Close()
                    v_u_6:SelectLobbyMenu("Inventory")
                    return
                elseif v_u_23 and v_u_23.Parent then
                    v_u_23.CFrame = v_u_22
                    v_u_23.FieldOfView = 60
                    v_u_23.Focus = v_u_23.CFrame
                end
            end)
        else
            v_u_23.FieldOfView = 70
        end
    end
end
function v17.Open(p24, p25, p26)
    -- upvalues: (copy) v_u_15, (ref) v_u_6
    p24:BindCamera(true)
    local v27 = (v_u_15:Get(p25) or {}).Group
    if v27 then
        for v28, v29 in pairs(p24.Groups) do
            v29.Visible:set(v28 == v27)
        end
        local v30 = p24.Component.BGFrame.Body.List
        v30.CanvasPosition = v30.CanvasPosition + Vector2.new(0, p24.Groups[v27].Dropdown:FindFirstChild(p25).AbsolutePosition.Y - p24.Component.AbsolutePosition.Y)
        if p26 then
            v_u_6:SelectLobbyMenu("EffectPreview", false, true)
            p24:Preview(p25)
        end
    end
end
function v17.Close(p31)
    p31:BindCamera(false)
end
function v17.Preview(p32, p33)
    -- upvalues: (copy) v_u_15, (copy) v_u_1, (copy) v_u_14, (copy) v_u_12
    local v34 = v_u_15:Get(p33)
    if v34 and v34.Type == v_u_15.Type.ScoreEffect then
        local v35 = v_u_1:GetTagged("ScoreEffectPreview")
        if #v35 ~= 0 then
            local v36 = v35[1].Focus.Position
            if not v_u_14.isRegistered(v34.Id) then
                local v37 = {
                    ["Volume"] = 4,
                    ["PlaybackSpeed"] = NumberRange.new(0.9, 1.1)
                }
                for v38, v39 in pairs(v34.Metadata.Sound) do
                    v37[v38] = v39
                end
                v_u_14.register(v34.Id, v37)
            end
            local v40 = v_u_12.new()
            v_u_14.fromName(v34.Id)({
                ["Origin"] = CFrame.new(v36)
            })
            require(v34.Asset)(v36, p32.Player.Character, v40)
            task.delay(5, v40.DoCleaning, v40)
        end
    else
        return
    end
end
function v17.LoadComponent(p_u_41)
    -- upvalues: (ref) v_u_6, (copy) v_u_9, (copy) v_u_8, (ref) v_u_7, (copy) v_u_15, (copy) v_u_16, (copy) v_u_10
    local v42 = v_u_6.App.Lobby.EffectPreview
    local v43 = {
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_6
            v_u_6:SelectLobbyMenu(v_u_6.LastOpened)
        end
    }
    v_u_9(v42.ExitBtn)(v43)
    local v_u_44 = v_u_8.Value(false)
    v_u_8.Hydrate(v42)({
        ["Visible"] = false,
        [v_u_8.Out("Visible")] = v_u_44
    })
    v_u_8.Observer(v_u_44):onChange(function()
        -- upvalues: (copy) v_u_44, (copy) p_u_41, (ref) v_u_7
        if v_u_44:get() then
            p_u_41:Open(v_u_7.Selected:get())
        else
            p_u_41:Close()
        end
    end)
    v_u_8.Observer(v_u_44):onChange(function()
        -- upvalues: (ref) v_u_6, (copy) v_u_44
        if v_u_6.App.Parent ~= nil then
            task.delay(0.1, function()
                -- upvalues: (ref) v_u_44, (ref) v_u_6
                local v45 = v_u_44:get()
                v_u_6.App.Stats.Visible = not v45
                v_u_6.App.Lobby.Buttons.Visible = not v45
            end)
        end
    end)
    local v46 = {}
    for _, v47 in v_u_15:GetAllFromType(v_u_15.Type.ScoreEffect) do
        if v47.Group and (v46[v47.Group] == nil or v47.Rarity < v46[v47.Group].Rarity) then
            v46[v47.Group] = v47
        end
    end
    for _, v48 in ipairs(v_u_15:GetAllFromType(v_u_15.Type.ScoreEffect)) do
        if v48.Group then
            local v49
            if p_u_41.Groups[v48.Group] then
                v49 = p_u_41.Groups[v48.Group]
            else
                v49 = nil
            end
            if not v49 then
                local v50 = v_u_8.Value(false)
                v49 = v_u_16({
                    ["Header"] = v42.BGFrame.Body.List.Category:Clone(),
                    ["Dropdown"] = v42.BGFrame.Body.List.Dropdown:Clone(),
                    ["DisplayName"] = v48.Group,
                    ["Parent"] = v42.BGFrame.Body.List,
                    ["Visible"] = v50,
                    ["PreviewVisible"] = v_u_44,
                    ["RarestEffects"] = v46
                })
                p_u_41.Groups[v48.Group] = v49
            end
            v_u_10({
                ["Template"] = v42.BGFrame.Body.List.Dropdown.Template:Clone(),
                ["Inventory"] = p_u_41.Inventory,
                ["Item"] = v48,
                ["ScoreEffect"] = p_u_41,
                ["PreviewVisible"] = v_u_44,
                ["ScrollingFrame"] = v42.BGFrame.Body.List
            }).Parent = v49.Dropdown
        end
    end
    return v42
end
return v17