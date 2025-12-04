-- Decompiled game.ReplicatedStorage.Content.Pack

local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = require(v_u_1.Content.Rarity)
local v_u_3 = require(v_u_1.Tools.Logger).new(script.Name)
local v4 = {
    ["__index"] = require(v_u_1.Tools.Factory).new(script)
}
local v_u_5 = setmetatable({
    ["Rarity"] = v2
}, v4)
function v_u_5.new(p6)
    -- upvalues: (copy) v_u_5, (copy) v_u_1, (copy) v_u_3
    local v7 = v_u_5:Create(p6)
    local v8 = v7.Distribution
    assert(v8, "Failed to create Pack. Missing \'Distribution\' field.")
    local v9 = v7.Content
    assert(v9, "Failed to create Pack. Missing \'Content\' field.")
    v7.Asset = v_u_1.Assets.Packs:FindFirstChild(v7.Id)
    if not v7.Asset then
        v_u_3:Warn((("Pack \'%*\' does not have an asset."):format(v7.Id)))
    end
    return v7
end
return v_u_5