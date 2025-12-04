-- Decompiled game.ReplicatedFirst.Controllers.PackController.FadeContent

local v_u_1 = {
    ["BackgroundTransparency"] = {
        "GuiObject",
        "Frame",
        "ImageButton",
        "ViewportFrame",
        "TextLabel"
    },
    ["TextTransparency"] = { "TextButton", "TextLabel", "TextBox" },
    ["TextStrokeTransparency"] = { "TextButton", "TextLabel", "TextBox" },
    ["ImageTransparency"] = { "ImageButton", "ImageLabel", "ViewportFrame" },
    ["Transparency"] = { "UIStroke" }
}
local v_u_2 = game:GetService("TweenService")
return function(p3, p4, p5)
    -- upvalues: (copy) v_u_1, (copy) v_u_2
    local v6 = p4 or 1
    for _, v7 in ipairs({ p3, table.unpack(p3:GetDescendants()) }) do
        if (v7:IsA("GuiObject") or v7:IsA("UIStroke")) and not v7:GetAttribute("IgnoreOnFade") then
            local v8 = {}
            for v9, v10 in pairs(v_u_1) do
                if table.find(v10, v7.ClassName) then
                    local v11 = ("FadeContentOriginal%s"):format(v9)
                    local v12 = v7:GetAttribute(v11) or v7[v9]
                    local v13
                    if v12 == 1 then
                        v13 = nil
                    else
                        v13 = v12
                    end
                    v8[v9] = v13
                    v7:SetAttribute(v11, v12)
                end
            end
            for v14, v15 in pairs(v8) do
                v8[v14] = math.max(p5 or 0, v15)
            end
            v_u_2:Create(v7, TweenInfo.new(v6), v8):Play()
        end
    end
end