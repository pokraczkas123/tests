-- Decompiled game.ReplicatedStorage.Packages._Index.serunite-development_playfab-authentication@1.221024.0.playfab-authentication.Apis

local v_u_1 = require(script.Parent.Parent.PlayFabInternal)
require(script.Parent.Types)
return {
    ["GetEntityTokenAsync"] = function(p2)
        -- upvalues: (copy) v_u_1
        return v_u_1.MakeApiCall("/Authentication/GetEntityToken", p2, nil, nil)
    end,
    ["ValidateEntityTokenAsync"] = function(p3, p4)
        -- upvalues: (copy) v_u_1
        return v_u_1.MakeApiCall("/Authentication/ValidateEntityToken", p4, "X-EntityToken", p3)
    end,
    ["AuthenticateGameServerWithCustomIdAsync"] = function(p5, p6)
        -- upvalues: (copy) v_u_1
        return v_u_1.MakeApiCall("/GameServerIdentity/AuthenticateGameServerWithCustomId", p6, "X-EntityToken", p5)
    end,
    ["DeleteAsync"] = function(p7, p8)
        -- upvalues: (copy) v_u_1
        return v_u_1.MakeApiCall("/GameServerIdentity/Delete", p8, "X-EntityToken", p7)
    end
}