-- Decompiled game.ReplicatedFirst.Controllers.SettingsController.Settings.FastMode

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.Tools.Utility).applyToAllTagged
local v_u_13 = {
    ["IsInitialized"] = false,
    ["Enabled"] = false,
    ["Items"] = {},
    ["Init"] = function(p3)
        -- upvalues: (copy) v_u_1
        if not p3.IsInitialized then
            p3.IsInitialized = true
            p3.Directory = Instance.new("Folder")
            p3.Directory.Name = "HiddenItems"
            p3.Directory.Parent = v_u_1
            p3:BindToItemCreation()
        end
    end,
    ["BindToItemCreation"] = function(p_u_4)
        -- upvalues: (copy) v_u_2, (copy) v_u_1
        v_u_2("FastMode", function(p_u_5)
            -- upvalues: (ref) v_u_1, (copy) p_u_4
            if not p_u_5:IsDescendantOf(v_u_1) then
                p_u_4:AddItem(p_u_5)
                p_u_5.Destroying:Connect(function()
                    -- upvalues: (ref) p_u_4, (copy) p_u_5
                    p_u_4.Items[p_u_5] = nil
                end)
            end
        end)
    end,
    ["AddItem"] = function(p6, p7)
        if not p6.Items[p7] then
            p6.Items[p7] = p7.Parent
            if p6.Enabled then
                p7.Parent = p6.Directory
            end
        end
    end,
    ["HideItems"] = function(p8)
        p8.Enabled = true
        for v9, _ in pairs(p8.Items) do
            v9.Parent = p8.Directory
        end
    end,
    ["ShowItems"] = function(p10)
        p10.Enabled = false
        for v11, v12 in pairs(p10.Items) do
            v11.Parent = v12
        end
    end
}
return function(p14)
    -- upvalues: (copy) v_u_13
    v_u_13:Init()
    if p14 then
        v_u_13:HideItems()
    else
        v_u_13:ShowItems()
    end
end