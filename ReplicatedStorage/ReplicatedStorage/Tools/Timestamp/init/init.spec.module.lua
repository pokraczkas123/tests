-- Decompiled game.ReplicatedStorage.Tools.Timestamp.init.spec

return function()
    local v_u_1 = require(script.Parent)
    describe("timestamp", function()
        -- upvalues: (copy) v_u_1
        for v2 = 1, 31 do
            local v3 = DateTime.fromUniversalTime(2025, 1, v2, 15, 30, 0)
            local v4 = v3:FormatUniversalTime("d", "en-us")
            local v_u_5 = tonumber(v4)
            local v6 = v_u_1.new({
                ["Start"] = v_u_1.Day.Saturday,
                ["End"] = v_u_1.Day.Monday
            }, v3)
            local v_u_7 = v_u_1.isActive(v6, {
                ["Hour"] = 15,
                ["Minute"] = 30
            }, v3)
            it(("should have January, %* %* as: %*"):format(DateTime.fromUnixTimestamp(v3.UnixTimestamp):ToUniversalTime().Day, DateTime.fromUnixTimestamp(v3.UnixTimestamp):FormatUniversalTime("ddd", "en-us"), (v_u_5 == 0 or v_u_5 == 6) and "Active" or "Not active"), function()
                -- upvalues: (copy) v_u_7, (copy) v_u_5
                expect(v_u_7).to.equal(v_u_5 == 0 or v_u_5 == 6)
            end)
        end
    end)
end