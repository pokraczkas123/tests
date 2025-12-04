-- Decompiled game.ReplicatedStorage.Tools.Sound

local v_u_1 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local v_u_2 = game:GetService("Debris")
local v_u_3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("SoundService")
local v_u_5 = game:GetService("TweenService")
local v_u_6 = require(v_u_3.Content.Sounds)
local v_u_7 = require(v_u_3.Tools.Logger).new(script.Name)
local v_u_8 = require(v_u_3.Tools.Character)
local v_u_48 = {
    ["new"] = function(p9)
        -- upvalues: (copy) v_u_48, (copy) v_u_8, (copy) v_u_2
        p9.SoundGroup = v_u_48.getSoundGroup(p9.SoundGroup)
        local v10
        if p9.Parent then
            v10 = not p9.IsEmote
            if v10 then
                v10 = v_u_8.isDescendantOfPlayerCharacter(p9.Parent)
            end
        else
            v10 = false
        end
        if (p9.Parent or not p9.Origin) and not v10 then
            if not p9.Parent then
                p9.Parent = p9.SoundGroup
            end
        else
            local v11 = Instance.new("Part")
            v_u_2:AddItem(v11, 10)
            v11.Anchored = true
            v11.CanCollide = false
            v11.CanQuery = false
            v11.CanTouch = false
            v11.Massless = true
            v11.Transparency = 1
            v11.Size = Vector3.new(1, 1, 1)
            local v12 = p9.Sound
            local v13 = workspace:GetServerTimeNow() * 100
            v11.Name = ("%* @ %*"):format(v12, math.floor(v13) / 100)
            v11.CFrame = p9.Origin or p9.Parent:GetPivot()
            if v10 then
                v11.Anchored = false
                local v14 = Instance.new("Weld")
                v14.Part0 = p9.Parent
                v14.Part1 = v11
                v14.Parent = v11
            end
            v11.Parent = workspace:FindFirstChild("Effects")
            if not v11.Parent then
                local v15 = Instance.new("Folder")
                v15.Name = "Effects"
                v11.Parent = v15
                v15.Parent = workspace
            end
            p9.Parent = v11
        end
        local v_u_16 = Instance.new("Sound")
        local v17 = p9.Parent:FindFirstChild("Sound Origin")
        local v18 = p9.PlaybackSpeed or 1
        if typeof(v18) == "NumberRange" then
            v18 = math.random(v18.Min * 10, v18.Max * 10) / 10
        end
        if not v17 and (p9.Parent:IsA("BasePart") or p9.Parent:IsA("Attachment")) then
            v17 = Instance.new("Attachment")
            v17.Name = "Sound Origin"
            v17.Parent = p9.Parent
        end
        local v19 = p9.Id
        local v20
        if typeof(v19) == "number" then
            v20 = ("rbxassetid://%*"):format(p9.Id)
        else
            v20 = p9.Id
        end
        v_u_16.SoundId = v20
        local v21 = workspace:GetServerTimeNow() * 100
        v_u_16.Name = ("Sound @ %*"):format(math.floor(v21) / 100)
        v_u_16.Parent = v17 or p9.Parent
        v_u_16.Looped = p9.Looped or false
        v_u_16.PlaybackSpeed = v18
        v_u_16.SoundGroup = p9.SoundGroup
        v_u_16.Volume = p9.Volume or 0.5
        v_u_16.TimePosition = p9.TimePosition or 0
        v_u_16.RollOffMaxDistance = p9.RollOffMaxDistance or 10000
        v_u_16:Play()
        v_u_16.Ended:Connect(function()
            -- upvalues: (ref) v_u_2, (copy) v_u_16
            v_u_2:AddItem(v_u_16, 1)
        end)
        return v_u_16
    end,
    ["fromName"] = function(p22)
        -- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_48
        local v_u_23 = table.clone(v_u_6[p22] or {})
        if not v_u_23 then
            v_u_7:Warn((("Sound %* does not exist."):format(p22)))
        end
        return function(p24)
            -- upvalues: (copy) v_u_23, (ref) v_u_48
            for v25, v26 in p24 do
                v_u_23[v25] = v26
            end
            return v_u_48.new(v_u_23)
        end
    end,
    ["getSoundGroup"] = function(p27)
        -- upvalues: (copy) v_u_4, (copy) v_u_48
        if typeof(p27) == "string" then
            return v_u_4:FindFirstChild(p27 or "") or v_u_4:FindFirstChild(v_u_48.getDefaultSoundGroup())
        elseif typeof(p27) == "Instance" and p27:IsA("SoundGroup") then
            return p27
        else
            return v_u_48.getDefaultSoundGroup()
        end
    end,
    ["getDefaultSoundGroup"] = function()
        -- upvalues: (copy) v_u_4
        local v28 = v_u_4:FindFirstChild("Game")
        if not v28 then
            v28 = Instance.new("SoundGroup")
            v28.Name = "Game"
            v28.Parent = v_u_4
        end
        return v28
    end,
    ["preload"] = function()
        -- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_4
        if workspace:FindFirstChild("Sound Preload") then
            v_u_7:Warn("Attempted to preload sounds twice.")
        else
            local v29 = Instance.new("Folder")
            v29.Name = "Sound Preload"
            v29.Parent = workspace
            for v30, v31 in pairs(v_u_6) do
                local v32 = Instance.new("Sound")
                v32.Name = v30
                v32.SoundId = v31.Id
                v32.Parent = v29
            end
            for _, v33 in ipairs(v_u_4:WaitForChild("Music"):GetChildren()) do
                v33.Volume = 0
                v33.Looped = true
                v33:Play()
            end
            for _, v34 in ipairs(v_u_4:WaitForChild("Ambience"):GetChildren()) do
                v34:SetAttribute("Volume", v34.Volume)
                v34.Volume = 0
                v34.Looped = true
                v34:Play()
            end
        end
    end,
    ["isRegistered"] = function(p35)
        -- upvalues: (copy) v_u_6
        return v_u_6[p35] ~= nil
    end,
    ["register"] = function(p_u_36, p_u_37)
        -- upvalues: (copy) v_u_6
        if not v_u_6[p_u_36] then
            task.spawn(function()
                -- upvalues: (ref) v_u_6, (copy) p_u_36, (copy) p_u_37
                v_u_6[p_u_36] = p_u_37
                local v38 = workspace:WaitForChild("Sound Preload")
                local v39 = Instance.new("Sound")
                v39.Name = p_u_36
                v39.SoundId = p_u_37.Id
                v39.Parent = v38
            end)
        end
    end,
    ["playMusic"] = function(p40, p41)
        -- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_1
        for _, v42 in ipairs(v_u_4:WaitForChild("Music"):GetChildren()) do
            if v42.Name == p40 then
                if p41 then
                    v42.TimePosition = 0
                end
                v_u_5:Create(v42, v_u_1, {
                    ["Volume"] = 0.2
                }):Play()
            else
                v_u_5:Create(v42, v_u_1, {
                    ["Volume"] = 0
                }):Play()
            end
        end
    end,
    ["playAmbience"] = function(p43, p44)
        -- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_1
        local v45 = v_u_3:GetAttribute("Map") or "Classic"
        local v46 = v45 == "Hardcore" and "Pro" or v45
        for _, v47 in ipairs(v_u_4:WaitForChild("Ambience"):GetChildren()) do
            if v47.Name:find(v46) then
                if v47.Name == ("%*%*"):format(v46, p43) or p43 == "All" then
                    if p44 then
                        v47.TimePosition = 0
                    end
                    v_u_5:Create(v47, v_u_1, {
                        ["Volume"] = v47:GetAttribute("Volume")
                    }):Play()
                else
                    v_u_5:Create(v47, v_u_1, {
                        ["Volume"] = 0
                    }):Play()
                end
            else
                v47.Volume = 0
            end
        end
    end
}
return v_u_48