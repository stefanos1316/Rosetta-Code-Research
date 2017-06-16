use framework "Foundation"


-- stripChars :: String -> String -> String
on stripChars(strNeedles, strHaystack)

    intercalate("", splitRegex("[" & strNeedles & "]", strHaystack))

end stripChars


-- TEST
on run

    stripChars("aei", "She was a soul stripper. She took my heart!")

    --> "Sh ws  soul strppr. Sh took my hrt!"
end run



-- GENERIC LIBRARY FUNCTIONS

-- splitRegex :: RegexPattern -> String -> [String]
on splitRegex(strRegex, str)
    set lstMatches to regexMatches(strRegex, str)
    if length of lstMatches > 0 then
        script preceding
            on lambda(a, x)
                set iFrom to start of a
                set iLocn to (location of x)

                if iLocn > iFrom then
                    set strPart to text (iFrom + 1) thru iLocn of str
                else
                    set strPart to ""
                end if
                {parts:parts of a & strPart, start:iLocn + (length of x) - 1}
            end lambda
        end script

        set recLast to foldl(preceding, {parts:[], start:0}, lstMatches)

        set iFinal to start of recLast
        if iFinal < length of str then
            parts of recLast & text (iFinal + 1) thru -1 of str
        else
            parts of recLast & ""
        end if
    else
        {str}
    end if
end splitRegex

-- regexMatches :: RegexPattern -> String -> [{location:Int, length:Int}]
on regexMatches(strRegex, str)
    set ca to current application
    set oRgx to ca's NSRegularExpression's regularExpressionWithPattern:strRegex ¬
        options:((ca's NSRegularExpressionAnchorsMatchLines as integer)) |error|:(missing value)
    set oString to ca's NSString's stringWithString:str
    set oMatches to oRgx's matchesInString:oString options:0 range:{location:0, |length|:oString's |length|()}

    set lstMatches to {}
    set lng to count of oMatches
    repeat with i from 1 to lng
        set end of lstMatches to range() of item i of oMatches
    end repeat
    lstMatches
end regexMatches

-- foldl :: (a -> b -> a) -> a -> [b] -> a
on foldl(f, startValue, xs)
    tell mReturn(f)
        set v to startValue
        set lng to length of xs
        repeat with i from 1 to lng
            set v to lambda(v, item i of xs, i, xs)
        end repeat
        return v
    end tell
end foldl

-- intercalate :: Text -> [Text] -> Text
on intercalate(strText, lstText)
    set {dlm, my text item delimiters} to {my text item delimiters, strText}
    set strJoined to lstText as text
    set my text item delimiters to dlm
    return strJoined
end intercalate

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
