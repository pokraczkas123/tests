-- Decompiled game.ReplicatedStorage.Content.Special.Hakka.PostAction.Orchestator.CharClone.Pool.Appearance

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = require(v1.Packages.Knit)
require(v1.Tools.CharBot.CharRender)
local v_u_4 = {}
local v_u_5 = {
    ["Material"] = Enum.Material.ForceField,
    ["Color"] = Color3.new(0, 1, 0.1),
    ["RemoveTextures"] = true
}
function v_u_4.applyCloneAppearanceAsync(p6, p_u_7)
    -- upvalues: (ref) v_u_2, (copy) v_u_3, (copy) v_u_4
    v_u_2 = v_u_2 or v_u_3.GetService("JerseyService")
    local v8 = p6.Character.Humanoid.HumanoidDescription
    p_u_7.Humanoid:ApplyDescription(v8)
    local v9 = v_u_2:TryCheapCopyJerseyDataFromPlayer(p6)
    if v9 then
        p_u_7:ApplyJersey(v9)
    end
    p_u_7:ForAllParts(function(p10)
        -- upvalues: (copy) p_u_7, (ref) v_u_4
        if p10 ~= p_u_7.HumanoidRootPart then
            v_u_4._applyPartStyling(p10)
        end
    end)
end
function v_u_4.unapplyCloneAppearance(p11)
    p11:ClearJersey()
end
function v_u_4._applyPartStyling(p12)
    -- upvalues: (copy) v_u_5, (copy) v_u_4
    p12.Material = v_u_5.Material
    p12.Color = v_u_5.Color
    p12.CanCollide = false
    p12.CanQuery = false
    p12.CanTouch = false
    if v_u_5.RemoveTextures then
        v_u_4._removeTextures(p12)
    end
end
function v_u_4._removeTextures(p13)
    if p13.ClassName == "MeshPart" then
        p13.TextureID = ""
    end
    for _, v14 in p13:GetChildren() do
        if v14.ClassName == "SurfaceAppearance" then
            v14:Destroy()
        end
    end
end
return v_u_4