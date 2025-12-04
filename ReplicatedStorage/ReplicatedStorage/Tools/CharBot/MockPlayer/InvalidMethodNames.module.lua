-- Decompiled game.ReplicatedStorage.Tools.CharBot.MockPlayer.InvalidMethodNames

local v1 = {
    "IsA",
    "GetPropertyChangedSignal",
    "AddTag",
    "ClearAllChildren",
    "Clone",
    "FindFirstAncestor",
    "FindFirstAncestorOfClass",
    "FindFirstAncestorWhichIsA",
    "FindFirstChild",
    "FindFirstChildOfClass",
    "FindFirstChildWhichIsA",
    "FindFirstDescendant",
    "GetActor",
    "GetAttributes",
    "GetChildren",
    "GetDebugId",
    "GetDescendants",
    "GetFullName",
    "GetStyled",
    "GetStyledPropertyChangedSignal",
    "GetTags",
    "HasTag",
    "IsAncestorOf",
    "IsDescendantOf",
    "IsPropertyModified",
    "QueryDescendants",
    "RemoveTag",
    "ResetPropertyToDefault",
    "WaitForChild",
    "AddReplicationFocus",
    "ClearCharacterAppearance",
    "GetFriendsOnline",
    "GetJoinData",
    "GetMouse",
    "GetNetworkPing",
    "GetRankInGroup",
    "GetRoleInGroup",
    "HasAppearanceLoaded",
    "IsFriendsWith",
    "IsInGroup",
    "IsVerified",
    "Kick",
    "LoadCharacter",
    "LoadCharacterWithHumanoidDescription",
    "Move",
    "RemoveReplicationFocus",
    "RequestStreamAroundAsync",
    "SetAccountAge",
    "SetSuperSafeChat"
}
local v2 = {}
for _, v3 in v1 do
    v2[v3] = true
end
return {
    ["List"] = v1,
    ["Set"] = v2
}