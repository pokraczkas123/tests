-- Decompiled game.ReplicatedStorage.Packages._Index.sleitnick_option@1.0.5.option.init.spec

return function()
    local v_u_1 = require(script.Parent)
    describe("Some", function()
        -- upvalues: (copy) v_u_1
        it("should create some option", function()
            -- upvalues: (ref) v_u_1
            local v2 = v_u_1.Some(true)
            expect(v2:IsSome()).to.equal(true)
        end)
        it("should fail to create some option with nil", function()
            -- upvalues: (ref) v_u_1
            expect(function()
                -- upvalues: (ref) v_u_1
                v_u_1.Some(nil)
            end).to.throw()
        end)
        it("should not be none", function()
            -- upvalues: (ref) v_u_1
            local v3 = v_u_1.Some(10)
            expect(v3:IsNone()).to.equal(false)
        end)
    end)
    describe("None", function()
        -- upvalues: (copy) v_u_1
        it("should be able to reference none", function()
            -- upvalues: (ref) v_u_1
            expect(function()
                -- upvalues: (ref) v_u_1
                local _ = v_u_1.None
            end).never.to.throw()
        end)
        it("should be able to check if none", function()
            -- upvalues: (ref) v_u_1
            local v4 = v_u_1.None
            expect(v4:IsNone()).to.equal(true)
        end)
        it("should be able to check if not some", function()
            -- upvalues: (ref) v_u_1
            local v5 = v_u_1.None
            expect(v5:IsSome()).to.equal(false)
        end)
    end)
    describe("Equality", function()
        -- upvalues: (copy) v_u_1
        it("should equal the same some from same options", function()
            -- upvalues: (ref) v_u_1
            local v6 = v_u_1.Some(32)
            expect(v6).to.equal(v6)
        end)
        it("should equal the same some from different options", function()
            -- upvalues: (ref) v_u_1
            local v7 = v_u_1.Some(32)
            local v8 = v_u_1.Some(32)
            expect(v7).to.equal(v8)
        end)
    end)
    describe("Assert", function()
        -- upvalues: (copy) v_u_1
        it("should assert that a some option is an option", function()
            -- upvalues: (ref) v_u_1
            expect(v_u_1.Is(v_u_1.Some(10))).to.equal(true)
        end)
        it("should assert that a none option is an option", function()
            -- upvalues: (ref) v_u_1
            expect(v_u_1.Is(v_u_1.None)).to.equal(true)
        end)
        it("should assert that a non-option is not an option", function()
            -- upvalues: (ref) v_u_1
            expect(v_u_1.Is(10)).to.equal(false)
            expect(v_u_1.Is(true)).to.equal(false)
            expect(v_u_1.Is(false)).to.equal(false)
            expect(v_u_1.Is("Test")).to.equal(false)
            expect(v_u_1.Is({})).to.equal(false)
            expect(v_u_1.Is(function() end)).to.equal(false)
            expect(v_u_1.Is(coroutine.create(function() end))).to.equal(false)
            expect(v_u_1.Is(v_u_1)).to.equal(false)
        end)
    end)
    describe("Unwrap", function()
        -- upvalues: (copy) v_u_1
        it("should unwrap a some option", function()
            -- upvalues: (ref) v_u_1
            local v_u_9 = v_u_1.Some(10)
            expect(function()
                -- upvalues: (copy) v_u_9
                v_u_9:Unwrap()
            end).never.to.throw()
            expect(v_u_9:Unwrap()).to.equal(10)
        end)
        it("should fail to unwrap a none option", function()
            -- upvalues: (ref) v_u_1
            local v_u_10 = v_u_1.None
            expect(function()
                -- upvalues: (copy) v_u_10
                v_u_10:Unwrap()
            end).to.throw()
        end)
    end)
    describe("Expect", function()
        -- upvalues: (copy) v_u_1
        it("should expect a some option", function()
            -- upvalues: (ref) v_u_1
            local v_u_11 = v_u_1.Some(10)
            expect(function()
                -- upvalues: (copy) v_u_11
                v_u_11:Expect("Expecting some value")
            end).never.to.throw()
            expect(v_u_11:Unwrap()).to.equal(10)
        end)
        it("should fail when expecting on a none option", function()
            -- upvalues: (ref) v_u_1
            local v_u_12 = v_u_1.None
            expect(function()
                -- upvalues: (copy) v_u_12
                v_u_12:Expect("Expecting some value")
            end).to.throw()
        end)
    end)
    describe("ExpectNone", function()
        -- upvalues: (copy) v_u_1
        it("should fail to expect a none option", function()
            -- upvalues: (ref) v_u_1
            local v_u_13 = v_u_1.Some(10)
            expect(function()
                -- upvalues: (copy) v_u_13
                v_u_13:ExpectNone("Expecting some value")
            end).to.throw()
        end)
        it("should expect a none option", function()
            -- upvalues: (ref) v_u_1
            local v_u_14 = v_u_1.None
            expect(function()
                -- upvalues: (copy) v_u_14
                v_u_14:ExpectNone("Expecting some value")
            end).never.to.throw()
        end)
    end)
    describe("UnwrapOr", function()
        -- upvalues: (copy) v_u_1
        it("should unwrap a some option", function()
            -- upvalues: (ref) v_u_1
            local v15 = v_u_1.Some(10)
            expect(v15:UnwrapOr(20)).to.equal(10)
        end)
        it("should unwrap a none option", function()
            -- upvalues: (ref) v_u_1
            local v16 = v_u_1.None
            expect(v16:UnwrapOr(20)).to.equal(20)
        end)
    end)
    describe("UnwrapOrElse", function()
        -- upvalues: (copy) v_u_1
        it("should unwrap a some option", function()
            -- upvalues: (ref) v_u_1
            local v17 = v_u_1.Some(10):UnwrapOrElse(function()
                return 30
            end)
            expect(v17).to.equal(10)
        end)
        it("should unwrap a none option", function()
            -- upvalues: (ref) v_u_1
            local v18 = v_u_1.None:UnwrapOrElse(function()
                return 30
            end)
            expect(v18).to.equal(30)
        end)
    end)
    describe("And", function()
        -- upvalues: (copy) v_u_1
        it("should return the second option with and when both are some", function()
            -- upvalues: (ref) v_u_1
            local v19 = v_u_1.Some(1)
            local v20 = v_u_1.Some(2)
            expect(v19:And(v20)).to.equal(v20)
        end)
        it("should return none when first option is some and second option is none", function()
            -- upvalues: (ref) v_u_1
            local v21 = v_u_1.Some(1)
            local v22 = v_u_1.None
            expect(v21:And(v22):IsNone()).to.equal(true)
        end)
        it("should return none when first option is none and second option is some", function()
            -- upvalues: (ref) v_u_1
            local v23 = v_u_1.None
            local v24 = v_u_1.Some(2)
            expect(v23:And(v24):IsNone()).to.equal(true)
        end)
        it("should return none when both options are none", function()
            -- upvalues: (ref) v_u_1
            local v25 = v_u_1.None
            local v26 = v_u_1.None
            expect(v25:And(v26):IsNone()).to.equal(true)
        end)
    end)
    describe("AndThen", function()
        -- upvalues: (copy) v_u_1
        it("should pass the some value to the predicate", function()
            -- upvalues: (ref) v_u_1
            v_u_1.Some(32):AndThen(function(p27)
                -- upvalues: (ref) v_u_1
                expect(p27).to.equal(32)
                return v_u_1.None
            end)
        end)
        it("should throw if an option is not returned from predicate", function()
            -- upvalues: (ref) v_u_1
            local v_u_28 = v_u_1.Some(32)
            expect(function()
                -- upvalues: (copy) v_u_28
                v_u_28:AndThen(function() end)
            end).to.throw()
        end)
        it("should return none if the option is none", function()
            -- upvalues: (ref) v_u_1
            local v29 = v_u_1.None
            expect(v29:AndThen(function()
                -- upvalues: (ref) v_u_1
                return v_u_1.Some(10)
            end):IsNone()).to.equal(true)
        end)
        it("should return option of predicate if option is some", function()
            -- upvalues: (ref) v_u_1
            local v30 = v_u_1.Some(32):AndThen(function()
                -- upvalues: (ref) v_u_1
                return v_u_1.Some(10)
            end)
            expect(v30:IsSome()).to.equal(true)
            expect(v30:Unwrap()).to.equal(10)
        end)
    end)
    describe("Or", function()
        -- upvalues: (copy) v_u_1
        it("should return the first option if it is some", function()
            -- upvalues: (ref) v_u_1
            local v31 = v_u_1.Some(10)
            local v32 = v_u_1.Some(20)
            expect(v31:Or(v32)).to.equal(v31)
        end)
        it("should return the second option if the first one is none", function()
            -- upvalues: (ref) v_u_1
            local v33 = v_u_1.None
            local v34 = v_u_1.Some(20)
            expect(v33:Or(v34)).to.equal(v34)
        end)
    end)
    describe("OrElse", function()
        -- upvalues: (copy) v_u_1
        it("should return the first option if it is some", function()
            -- upvalues: (ref) v_u_1
            local v35 = v_u_1.Some(10)
            local v_u_36 = v_u_1.Some(20)
            expect(v35:OrElse(function()
                -- upvalues: (copy) v_u_36
                return v_u_36
            end)).to.equal(v35)
        end)
        it("should return the second option if the first one is none", function()
            -- upvalues: (ref) v_u_1
            local v37 = v_u_1.None
            local v_u_38 = v_u_1.Some(20)
            expect(v37:OrElse(function()
                -- upvalues: (copy) v_u_38
                return v_u_38
            end)).to.equal(v_u_38)
        end)
        it("should throw if the predicate does not return an option", function()
            -- upvalues: (ref) v_u_1
            local v_u_39 = v_u_1.None
            expect(function()
                -- upvalues: (copy) v_u_39
                v_u_39:OrElse(function() end)
            end).to.throw()
        end)
    end)
    describe("XOr", function()
        -- upvalues: (copy) v_u_1
        it("should return first option if first option is some and second option is none", function()
            -- upvalues: (ref) v_u_1
            local v40 = v_u_1.Some(1)
            local v41 = v_u_1.None
            expect(v40:XOr(v41)).to.equal(v40)
        end)
        it("should return second option if first option is none and second option is some", function()
            -- upvalues: (ref) v_u_1
            local v42 = v_u_1.None
            local v43 = v_u_1.Some(2)
            expect(v42:XOr(v43)).to.equal(v43)
        end)
        it("should return none if first and second option are some", function()
            -- upvalues: (ref) v_u_1
            local v44 = v_u_1.Some(1)
            local v45 = v_u_1.Some(2)
            expect(v44:XOr(v45)).to.equal(v_u_1.None)
        end)
        it("should return none if first and second option are none", function()
            -- upvalues: (ref) v_u_1
            local v46 = v_u_1.None
            local v47 = v_u_1.None
            expect(v46:XOr(v47)).to.equal(v_u_1.None)
        end)
    end)
    describe("Filter", function()
        -- upvalues: (copy) v_u_1
        it("should return none if option is none", function()
            -- upvalues: (ref) v_u_1
            local v48 = v_u_1.None
            expect(v48:Filter(function() end)).to.equal(v_u_1.None)
        end)
        it("should return none if option is some but fails predicate", function()
            -- upvalues: (ref) v_u_1
            local v49 = v_u_1.Some(10)
            expect(v49:Filter(function(_)
                return false
            end)).to.equal(v_u_1.None)
        end)
        it("should return self if option is some and passes predicate", function()
            -- upvalues: (ref) v_u_1
            local v50 = v_u_1.Some(10)
            expect(v50:Filter(function(_)
                return true
            end)).to.equal(v50)
        end)
    end)
    describe("Contains", function()
        -- upvalues: (copy) v_u_1
        it("should return true if some option contains the given value", function()
            -- upvalues: (ref) v_u_1
            local v51 = v_u_1.Some(32)
            expect(v51:Contains(32)).to.equal(true)
        end)
        it("should return false if some option does not contain the given value", function()
            -- upvalues: (ref) v_u_1
            local v52 = v_u_1.Some(32)
            expect(v52:Contains(64)).to.equal(false)
        end)
        it("should return false if option is none", function()
            -- upvalues: (ref) v_u_1
            local v53 = v_u_1.None
            expect(v53:Contains(64)).to.equal(false)
        end)
    end)
    describe("ToString", function()
        -- upvalues: (copy) v_u_1
        it("should return string of none option", function()
            -- upvalues: (ref) v_u_1
            local v54 = v_u_1.None
            expect((tostring(v54))).to.equal("Option<None>")
        end)
        it("should return string of some option with type", function()
            -- upvalues: (ref) v_u_1
            local v55 = {
                10,
                true,
                false,
                "test",
                {},
                function() end,
                coroutine.create(function() end),
                workspace
            }
            for _, v56 in ipairs(v55) do
                local v57 = ("Option<%s>"):format((typeof(v56)))
                local v58 = expect
                local v59 = v_u_1.Some
                v58((tostring(v59(v56)))).to.equal(v57)
            end
        end)
    end)
end