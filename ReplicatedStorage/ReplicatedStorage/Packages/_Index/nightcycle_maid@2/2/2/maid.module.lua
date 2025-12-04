-- Decompiled game.ReplicatedStorage.Packages._Index.nightcycle_maid@2.2.2.maid

local v1 = require(script:WaitForChild("Maid"))
local v2 = require(script:WaitForChild("MaidTaskUtils"))
return {
    ["isValidTask"] = v2.isValidTask,
    ["doTask"] = v2.doTask,
    ["delayed"] = v2.delayed,
    ["new"] = v1.new
}