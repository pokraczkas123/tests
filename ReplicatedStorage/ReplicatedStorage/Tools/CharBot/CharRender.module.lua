-- Decompiled game.ReplicatedStorage.Tools.CharBot.CharRender

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
require(script.Parent.Types)
local v_u_3 = require(v1.Packages.Knit)
local v_u_4 = require(v1.Packages.Maid)
local v_u_5 = require(v1.Content.Animations)
local v_u_6 = require(script.LoadAnimation)
local v_u_7 = {}
v_u_7.__index = v_u_7
function v_u_7.new(p8)
    -- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5
    local v9 = v_u_7
    local v10 = setmetatable({}, v9)
    local v11 = v_u_4.new()
    v10._maid = v11
    v11:GiveTask(p8)
    local v12 = p8.Humanoid
    local v13 = p8.HumanoidRootPart
    v10.AnimTracks = {}
    v10.Character = p8
    v10.Humanoid = v12
    v10.HumanoidRootPart = v13
    local v14, v15 = v_u_6.loadAll(v_u_5, v12)
    v10.AnimTracks = v14
    v11:GiveTask(v15)
    return v10
end
function v_u_7.ForAllParts(p16, p17)
    for _, v18 in p16.Character:GetDescendants() do
        if v18:IsA("BasePart") then
            p17(v18)
        end
    end
end
function v_u_7.ApplyJersey(p19, p20)
    -- upvalues: (ref) v_u_2, (copy) v_u_3
    v_u_2 = v_u_2 or v_u_3.GetService("JerseyService")
    v_u_2:ApplyJersey(p19.Character, p20)
end
function v_u_7.ClearJersey(p21)
    -- upvalues: (ref) v_u_2, (copy) v_u_3
    v_u_2 = v_u_2 or v_u_3.GetService("JerseyService")
    v_u_2:ClearJersey(p21.Character)
end
function v_u_7.Destroy(p22)
    p22._maid:DoCleaning()
end
return v_u_7