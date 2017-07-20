package main


func main() {
for i := 0; i < 1000000; i++ {
   list := []int{16,93,-99,95,-96,-24,-53,-71,96,-66,-21,72,-12,-32,-96,62,-42,-50,49,53,-65,52,-25,-69,88,-43,60,66,-94,-69,53,-71,-17,-58,-30,32,-16,-94,-42,-86,59,-53,94,97,-12,15,65,-35,-12,-82,-82,48,-48,66,-42,-63,33,-49,41,-85,94,66,-60,60,-65,-73,-50,-9,-48,-3,15,-77,81,95,-93,83,-21,34,-78,-61,-22,-58,65,78,41,-7,-59,20,88,-38,-15,-69,42,97,-35,61,8,2,-22,-85}
    quicksort(list)
}
}

func quicksort(a []int) {
    var pex func(int, int)
    pex = func(lower, upper int) {
        for {
            switch upper - lower {
            case -1, 0: // 0 or 1 item in segment.  nothing to do here!
                return
            case 1: // 2 items in segment
                // < operator respects strict weak order
                if a[upper] < a[lower] {
                    // a quick exchange and we're done.
                    a[upper], a[lower] = a[lower], a[upper]
                }
                return
            // Hoare suggests optimized sort-3 or sort-4 algorithms here,
            // but does not provide an algorithm.
            }

            // Hoare stresses picking a bound in a way to avoid worst case
            // behavior, but offers no suggestions other than picking a
            // random element.  A function call to get a random number is
            // relatively expensive, so the method used here is to simply
            // choose the middle element.  This at least avoids worst case
            // behavior for the obvious common case of an already sorted list.
            bx := (upper + lower) / 2
            b := a[bx]  // b = Hoare's "bound" (aka "pivot")
            lp := lower // lp = Hoare's "lower pointer"
            up := upper // up = Hoare's "upper pointer"
        outer:
            for {
                // use < operator to respect strict weak order
                for lp < upper && !(b < a[lp]) {
                    lp++
                }
                for {
                    if lp > up {
                        // "pointers crossed!"
                        break outer
                    }
                    // < operator for strict weak order
                    if a[up] < b {
                        break // inner
                    }
                    up--
                }
                // exchange
                a[lp], a[up] = a[up], a[lp]
                lp++
                up--
            }
            // segment boundary is between up and lp, but lp-up might be
            // 1 or 2, so just call segment boundary between lp-1 and lp.
            if bx < lp {
                // bound was in lower segment
                if bx < lp-1 {
                    // exchange bx with lp-1
                    a[bx], a[lp-1] = a[lp-1], b
                }
                up = lp - 2
            } else {
                // bound was in upper segment
                if bx > lp {
                    // exchange
                    a[bx], a[lp] = a[lp], b
                }
                up = lp - 1
                lp++
            }
            // "postpone the larger of the two segments" = recurse on
            // the smaller segment, then iterate on the remaining one.
            if up-lower < upper-lp {
                pex(lower, up)
                lower = lp
            } else {
                pex(lp, upper)
                upper = up
            }
        }
    }
    pex(0, len(a)-1)
}
