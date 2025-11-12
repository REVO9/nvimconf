return {
    s({ trig = "<-", },
        fmt(
            "\\leftarrow",
            {}
        )
    ),
    s({ trig = "->", },
        fmt(
            "\\rightarrow",
            {}
        )
    ),
    s({ trig = "<=", },
        fmt(
            "\\Leftarrow",
            {}
        )
    ),
    s({ trig = "=>", },
        fmt(
            "\\Rightarrow",
            {}
        )
    ),
    s({ trig = "mi", },
        fmta(
            "$ <> $",
            { i(1) }
        )
    ),
    s({ trig = "md", },
        fmta(
            "$$ <> $$",
            { i(1) }
        )
    ),
    s({ trig = "mb", },
        fmta(
            "\\mathbb{<>}",
            { i(1) }
        )
    ),
    s({ trig = "([A-Za-z])mb", regTrig = true, },
        fmta(
            "\\mathbb{<>}",
            { f(function(_, snip)
                return snip.captures[1]
            end) }
        )
    ),
    s({ trig = "(.)_(.?)", regTrig = true, wordTrig = false },
        fmta("<>_{<><>}",
            {
                f(function(args, snip)
                    return
                        snip.captures[1]
                end, {}),
                f(function(args, snip)
                    return
                        snip.captures[2]
                end, {}),
                i(1)
            }
        )
    ),
    s({ trig = "(.)^(.?)", regTrig = true, wordTrig = false },
        fmta("<>^{<><>}",
            {
                f(function(args, snip)
                    return
                        snip.captures[1]
                end, {}),
                f(function(args, snip)
                    return
                        snip.captures[2]
                end, {}),
                i(1)
            }
        )
    ),
    s({ trig = "(.)\'", regTrig = true, wordTrig = false },
        fmta("<>^{\\prime}",
            f(function(args, snip)
                return snip.captures[1]
            end)
        )
    ),
    s({ trig = "//", },
        fmta("\\frac{<>}{<>}", {
            i(1),
            i(2),
        })
    ),
    s(
        { trig = "([A-Za-z|0-9|\\]+)/", regTrig = true, },
        fmta("\\frac{<>}{<>}", {
            f(function(_, snip)
                return snip.captures[1]
            end, {}),
            i(1),
        })
    ),
    s({ trig = "^.*%)%/", regTrig = true, priority = 1000, wordTrig = false },
        fmta("<>{<>}", {
            f(function(_, snip)
                local stripped = snip.trigger:sub(1, -2)
                local depth = 0
                local i = #stripped
                while i > 0 do
                    local c = stripped:sub(i, i)
                    if c == ")" then depth = depth + 1 end
                    if c == "(" then depth = depth - 1 end
                    if depth == 0 then break end
                    i = i - 1
                end
                return stripped:sub(1, i - 1) .. "\\frac{" .. stripped:sub(i + 1, -2) .. "}"
            end, {}),
            i(1)
        })
    ),

    s({ trig = "ud", },
        fmta("\\underline{<>}", {
            i(1),
        })
    ),
    s(
        { trig = "([A-Z|a-z|0-9|ÄÖÜäöü]+)ud", regTrig = true, },
        fmta("\\underline{<><>}", {
            f(function(_, snip)
                return snip.captures[1]
            end, {}),
            i(1),
        })
    ),

}
