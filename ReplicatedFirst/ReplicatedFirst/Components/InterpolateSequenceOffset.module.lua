-- Decompiled game.ReplicatedFirst.Components.InterpolateSequenceOffset

return {
    ["Number"] = function(p1, p2)
        local v3 = p1.Keypoints
        local v4 = #v3
        local v5 = true
        local v6 = {}
        for v7 = 1, v4 do
            local v8 = v3[v7]
            local v9 = v8.Time + p2
            local v10 = v8.Value
            local v11 = v8.Envelope
            if v9 > 1 then
                v9 = v9 - 1
            elseif v9 == 1 then
                v5 = false
            end
            if v7 == v4 and v5 then
                v9 = v9 - 0.001
                if v9 >= 0 then
                    goto l8
                end
            else
                ::l8::
                local v12 = NumberSequenceKeypoint.new
                table.insert(v6, v12(v9, v10, v11))
            end
        end
        table.sort(v6, function(p13, p14)
            return p13.Time < p14.Time
        end)
        if v5 then
            local v15 = v6[1]
            local v16 = v6[#v6]
            local v17 = 1 - v16.Time
            local v18 = v17 + v15.Time
            local v19 = v16.Value
            local v20 = v15.Value
            local v21 = v17 / v18
            local v22 = v19 + (v20 - v19) * v21
            local v23 = v16.Value
            local v24 = v15.Value
            local v25 = v17 / v18
            local v26 = v23 + (v24 - v23) * v25
            local v27 = NumberSequenceKeypoint.new
            local v28 = v15.Envelope
            table.insert(v6, 1, v27(0, v22, v28))
            local v29 = NumberSequenceKeypoint.new
            local v30 = v16.Envelope
            table.insert(v6, v29(1, v26, v30))
        end
        return NumberSequence.new(v6)
    end,
    ["Color"] = function(p31, p32)
        local v33 = p31.Keypoints
        local v34 = #v33
        local v35 = true
        local v36 = {}
        for v37 = 1, v34 do
            local v38 = v33[v37]
            local v39 = v38.Time + p32
            local v40 = v38.Value
            if v39 > 1 then
                v39 = v39 - 1
            elseif v39 == 1 then
                v35 = false
            end
            if v37 == v34 and v35 then
                v39 = v39 - 0.001
                if v39 >= 0 then
                    goto l8
                end
            else
                ::l8::
                local v41 = ColorSequenceKeypoint.new
                table.insert(v36, v41(v39, v40))
            end
        end
        table.sort(v36, function(p42, p43)
            return p42.Time < p43.Time
        end)
        if v35 then
            local v44 = v36[1]
            local v45 = v36[#v36]
            local v46 = 1 - v45.Time
            local v47 = v46 + v44.Time
            local v48 = v45.Value:lerp(v44.Value, v46 / v47)
            local v49 = v45.Value:lerp(v44.Value, v46 / v47)
            local v50 = ColorSequenceKeypoint.new
            table.insert(v36, 1, v50(0, v48))
            local v51 = ColorSequenceKeypoint.new
            table.insert(v36, v51(1, v49))
        end
        return ColorSequence.new(v36)
    end
}