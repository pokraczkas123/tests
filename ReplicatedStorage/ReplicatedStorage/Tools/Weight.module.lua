-- Decompiled game.ReplicatedStorage.Tools.Weight

local v1 = game:GetService("ReplicatedStorage")
require(v1.Content.Reward)
return {
    ["evaluate"] = function(p2)
        local v3 = 0
        for _, v4 in p2 do
            v3 = v3 + (v4.Weight or 0)
        end
        local v5 = math.random() * v3
        local v6 = 0
        for _, v7 in p2 do
            v6 = v6 + (v7.Weight or 0)
            if v5 <= v6 then
                return v7
            end
        end
    end
}