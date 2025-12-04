-- Decompiled game.ReplicatedFirst.Client

local v_u_1 = game:GetService("TeleportService"):GetArrivingTeleportGui()
if not game:IsLoaded() then
    game.Loaded:Wait()
    local v2 = game:GetService("ReplicatedFirst")
    local v_u_3 = game:GetService("ReplicatedStorage")
    local v_u_4 = game:GetService("Players")
    local v_u_5 = require(v_u_3.Tools.Sound)
    local v_u_6 = require(v2.Components.LoadingScreen);
    ({
        ["Player"] = v_u_4.LocalPlayer,
        ["Init"] = function(p_u_7)
            -- upvalues: (copy) v_u_6
            p_u_7.LoadingScreen = v_u_6.new({
                ["Parent"] = p_u_7.Player:WaitForChild("PlayerGui")
            })
            p_u_7:WaitForGameLoadedAsync()
            p_u_7:StartAsync()
            if p_u_7.LoadingScreen.AllowStart then
                p_u_7.LoadingScreen:AllowStart()
                if p_u_7.Player:GetAttribute("SkipIntro") then
                    p_u_7.LoadingScreen:OnInput()
                    return
                end
                p_u_7.Player:GetAttributeChangedSignal("SkipIntro"):Connect(function()
                    -- upvalues: (copy) p_u_7
                    if p_u_7.Player:GetAttribute("SkipIntro") then
                        p_u_7.LoadingScreen:OnInput()
                    end
                end)
            end
        end,
        ["WaitForGameLoadedAsync"] = function(p8)
            -- upvalues: (copy) v_u_4
            p8.Player:WaitForChild("DataLoaded")
            if v_u_4.CharacterAutoLoads ~= false and not p8.Player.Character then
                p8.Player.CharacterAdded:Wait()
            end
        end,
        ["StartAsync"] = function(p9)
            -- upvalues: (copy) v_u_3, (copy) v_u_1, (copy) v_u_5, (copy) v_u_4
            local v10 = require(v_u_3:WaitForChild("Packages"):WaitForChild("Knit"))
            local v11 = require(v_u_3:WaitForChild("Configuration"):WaitForChild("Place"))()
            v10.AddControllers(script.Parent:WaitForChild("Controllers"))
            v10.Start():andThen(function() end):catch(error)
            if v11.Current == v11.Idle or v11.Current == v11.Pro or v11.IsMatchmakingServer then
                p9.LoadingScreen:End()
                if v_u_1 and v11.Current ~= v11.Pro then
                    v_u_1.Parent = p9.Player:WaitForChild("PlayerGui")
                    v_u_1.Enabled = true
                    v_u_1.DisplayOrder = 100
                    v_u_5.fromName("Queue_Join")({})
                end
            end
            local v12 = game.Workspace:GetServerTimeNow() - DateTime.now().UnixTimestamp
            if math.abs(v12) >= 604800 then
                v_u_4.LocalPlayer:Kick("Your device\'s date and time settings are incorrect. Please adjust them and try again.")
            end
        end
    }):Init()
end