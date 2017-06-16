-- showCharRange :: String -> String -> [String]
on showCharRange(strFrom, strTo)
    -- showChar :: Int -> String
    script showChar
        on lambda(intID)
            character id intID
        end lambda
    end script

    map(showChar, range(id of strFrom, id of strTo))
end showCharRange


-- TEST
on run

    {showCharRange("a", "z"), ¬
        showCharRange("🐐", "🐟")}

end run


---------------------------------------------------------------------------
-- GENERIC FUNCTIONS

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
