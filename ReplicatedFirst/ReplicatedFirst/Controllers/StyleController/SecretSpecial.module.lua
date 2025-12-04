-- Decompiled game.ReplicatedFirst.Controllers.StyleController.SecretSpecial

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Fusion)
require(v1.Content.Style)
return function(p_u_3)
    -- upvalues: (copy) v_u_2
    v_u_2.Hydrate(p_u_3.Component.Body.ImageLabel)({
        ["Image"] = v_u_2.Computed(function()
            -- upvalues: (copy) p_u_3
            local v4 = p_u_3.Style:get() or {}
            return v4.Metadata and (v4.Metadata.Special and (v4.Metadata.Special.Icon or "") or "") or ""
        end)
    })
end