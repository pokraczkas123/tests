-- Decompiled game.ReplicatedFirst.Controllers.PlayerCardController.PlayerCard

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.Content.Item)
local v_u_3 = require(v_u_1.Packages.Maid)
local v_u_4 = require(v_u_1.Tools.Utility).getHeadshot
local v_u_25 = {
    ["itemFromItemId"] = function(p5)
        -- upvalues: (copy) v_u_2
        local v6 = v_u_2:Get(p5)
        local v7 = ("Item PlayerCard of id %* is invalid."):format(p5)
        assert(v6, v7)
        return v6
    end,
    ["playerDisplayFromPlayer"] = function(p8)
        -- upvalues: (copy) v_u_4
        local v9 = v_u_4(p8)
        local v10 = ("Failed to get headshot for player %*"):format(p8.Name)
        assert(v9, v10)
        return {
            ["Name"] = p8.Name,
            ["Image"] = v9
        }
    end,
    ["teamDisplayFromPlayer"] = function(p11)
        local v12 = p11.Team
        if not v12 then
            return nil
        end
        local v13 = v12:GetAttribute("ColorOverride") or v12.TeamColor.Color
        return {
            ["Name"] = v12.Name,
            ["Color"] = v13
        }
    end,
    ["statDisplayFromItem"] = function(p14, p15)
        local v16 = p14.Metadata
        if v16 then
            v16 = p14.Metadata.Stat
        end
        return v16 and {
            ["Name"] = v16,
            ["Value"] = p15 or 0
        } or nil
    end,
    ["renderFromItem"] = function(p17)
        -- upvalues: (copy) v_u_1
        local v18 = p17.Metadata and p17.Metadata.RenderId or "Default"
        local v19 = v_u_1.Assets.PlayerCard:FindFirstChild(v18)
        local v20 = ("Failed to find PlayerCard moduleScript for id %*"):format(v18)
        assert(v19, v20)
        return require(v19)
    end,
    ["frame"] = function(p21)
        -- upvalues: (copy) v_u_25, (copy) v_u_3
        local v22 = v_u_25.renderFromItem(p21.Item)
        local v_u_23 = v_u_3.new()
        local v24 = p21.Item.Metadata or {}
        if not v24.Image then
            v24.Image = p21.Item.Asset
        end
        v22({
            ["DisplayData"] = p21.DisplayData,
            ["Container"] = p21.Container,
            ["Maid"] = v_u_23,
            ["Metadata"] = v24 or {}
        })
        return function()
            -- upvalues: (copy) v_u_23
            v_u_23:Destroy()
        end
    end
}
return v_u_25