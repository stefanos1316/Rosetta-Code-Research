-- CARPET MODEL

-- sierpinskiCarpet :: Int -> [[Bool]]
on sierpinskiCarpet(n)

    -- rowStates :: Int -> [Bool]
    script rowStates
        on lambda(x, _, xs)

            -- cellState :: Int -> Bool
            script cellState
                -- inCarpet :: Int -> Int -> Bool
                on inCarpet(x, y)
                    if (x = 0 or y = 0) then
                        true
                    else
                        not ((x mod 3 = 1) and ¬
                            (y mod 3 = 1)) and ¬
                            inCarpet(x div 3, y div 3)
                    end if
                end inCarpet

                on lambda(y)
                    inCarpet(x, y)
                end lambda
            end script

            map(cellState, xs)
        end lambda
    end script

    map(rowStates, range(0, (3 ^ n) - 1))
end sierpinskiCarpet


-- TEST

on run
    -- Carpets of orders 1, 2, 3

    set strCarpets to ¬
        intercalate(linefeed & linefeed, ¬
            map(showCarpet, range(1, 3)))

    set the clipboard to strCarpets

    return strCarpets
end run


-- CARPET DISPLAY

-- showCarpet :: Int -> String
on showCarpet(n)
    -- showRow :: [Bool] -> String
    script showRow
        -- showBool :: Bool -> String
        script showBool
            on lambda(bool)
                if bool then
                    character id 9608
                else
                    " "
                end if
            end lambda
        end script

        on lambda(xs)
            intercalate("", map(my showBool, xs))
        end lambda
    end script

    intercalate(linefeed, map(showRow, sierpinskiCarpet(n)))
end showCarpet


---------------------------------------------------------------------------

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

-- intercalate :: Text -> [Text] -> Text
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
