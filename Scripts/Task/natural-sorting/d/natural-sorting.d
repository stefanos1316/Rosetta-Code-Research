import std.stdio, std.string, std.algorithm, std.array, std.conv,
       std.ascii, std.range;

string[] naturalSort(string[] arr) /*pure @safe*/ {
    static struct Part {
        string s;

        int opCmp(in ref Part other) const pure {
            return (s[0].isDigit && other.s[0].isDigit) ?
                   cmp([s.to!ulong], [other.s.to!ulong]) :
                   cmp(s, other.s);
        }
    }

    static mapper(in string txt) /*pure nothrow @safe*/ {
        auto r = txt
                 .strip
                 .tr(whitespace, " ", "s")
                 .toLower
                 .groupBy!isDigit
                 .map!(p => Part(p.text))
                 .array;
        return (r.length > 1 && r[0].s == "the") ? r.dropOne : r;
    }

    return arr.schwartzSort!mapper.release;
}

void main() /*@safe*/ {
    auto tests = [
    // Ignoring leading spaces.
    ["ignore leading spaces: 2-2", " ignore leading spaces: 2-1", "
     ignore leading spaces: 2+1", "  ignore leading spaces: 2+0"],

    // Ignoring multiple adjacent spaces (m.a.s).
    ["ignore m.a.s spaces: 2-2", "ignore m.a.s  spaces: 2-1",
     "ignore m.a.s   spaces: 2+0", "ignore m.a.s    spaces: 2+1"],

    // Equivalent whitespace characters.
    ["Equiv. spaces: 3-3", "Equiv.\rspaces: 3-2",
     "Equiv.\x0cspaces: 3-1", "Equiv.\x0bspaces: 3+0",
     "Equiv.\nspaces: 3+1", "Equiv.\tspaces: 3+2"],

    // Case Indepenent sort.
    ["cASE INDEPENENT: 3-2", "caSE INDEPENENT: 3-1",
     "casE INDEPENENT: 3+0", "case INDEPENENT: 3+1"],

    // Numeric fields as numerics.
    ["foo100bar99baz0.txt", "foo100bar10baz0.txt",
     "foo1000bar99baz10.txt", "foo1000bar99baz9.txt"],

    // Title sorts.
    ["The Wind in the Willows", "The 40th step more",
     "The 39 steps", "Wanda"]];

    foreach (test; tests)
        writeln(test, "\n", test.naturalSort, "\n");
}
