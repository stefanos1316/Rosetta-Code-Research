-- Int -> Int -> Int -> [[Int]]
on spiral(lngRows, lngCols, nStart)
    if lngRows > 0 then
        {range(nStart, (nStart + lngCols) - 1)} & ¬
            map(my _reverse, ¬
                transpose(spiral(lngCols, lngRows - 1, nStart + lngCols)))
    else
        {{}}
    end if
end spiral


-- TEST
on run
    set n to 5
    set lstSpiral to spiral(n, n, 0)

    -- {{0, 1, 2, 3, 4}, {15, 16, 17, 18, 5}, {14, 23, 24, 19, 6},
    --  {13, 22, 21, 20, 7}, {12, 11, 10, 9, 8}}

    wikiTable(lstSpiral, ¬
        false, ¬
        "text-align:center;width:12em;height:12em;table-layout:fixed;")
end run


-- WIKI TABLE FORMAT

-- wikiTable :: [Text] -> Bool -> Text -> Text
on wikiTable(lstRows, blnHdr, strStyle)
    script fWikiRows
        on lambda(lstRow, iRow)
            set strDelim to cond(blnHdr and (iRow = 0), "!", "|")
            set strDbl to strDelim & strDelim
            linefeed & "|-" & linefeed & strDelim & space & ¬
                intercalate(space & strDbl & space, lstRow)
        end lambda
    end script

    linefeed & "{| class=\"wikitable\" " & ¬
        cond(strStyle ≠ "", "style=\"" & strStyle & "\"", "") & ¬
        intercalate("", ¬
            map(fWikiRows, lstRows)) & linefeed & "|}" & linefeed
end wikiTable


-- GENERIC LIBRARY FUNCTIONS

-- map :: (a -> b) -> [a] -> [b]
on map(f, xs)
    tell mReturn(f)
        set lng to length of xs
        set lst to {}
        repeat with i from 1 to lng
            set end of lst to lambda(item i of xs, i, xs)
        end repeat
        return lst
    end tell
end map

-- transpose :: [[a]] -> [[a]]
on transpose(xss)
    script column
        on lambda(_, iCol)
            script row
                on lambda(xs)
                    item iCol of xs
                end lambda
            end script

            map(row, xss)
        end lambda
    end script

    map(column, item 1 of xss)
end transpose

-- _reverse :: [a] -> [a]
on _reverse(xs)
    if class of xs is text then
        (reverse of characters of xs) as text
    else
        reverse of xs
    end if
end _reverse

-- Text -> [Text] -> Text
on intercalate(strText, lstText)
    set {dlm, my text item delimiters} to {my text item delimiters, strText}
    set strJoined to lstText as text
    set my text item delimiters to dlm
    return strJoined
end intercalate

-- range :: Int -> Int -> [Int]
on range(m, n)
    if n < m then
        set d to -1
    else
        set d to 1
    end if
    set lst to {}
    repeat with i from m to n by d
        set end of lst to i
    end repeat
    return lst
end range

-- cond :: Bool -> (a -> b) -> (a -> b) -> (a -> b)
on cond(bool, f, g)
    if bool then
        f
    else
        g
    end if
end cond

-- Lift 2nd class handler function into 1st class script wrapper
-- mReturn :: Handler -> Script
on mReturn(f)
    if class of f is script then
        f
    else
        script
            property lambda : f
        end script
    end if
end mReturn
