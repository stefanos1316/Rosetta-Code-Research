require'strings media/wav'
morse=:[:; [:(' ',~' .-' {~ 3&#.inv)&.> (_96{.".0 :0-.LF) {~ a.&i.@toupper
 79 448 0 1121 0 0 484 214 644 0 151 692 608 455 205 242 161 134 125 122
 121 202 229 238 241 715 637 0 203 0 400 475 5 67 70 22 1 43 25 40 4 53
 23 49 8 7 26 52 77 16 13 2 14 41 17 68 71 76 214 0 644 0 401
)

onoffdur=: 0.01*100<.@*(1.2%[)*(4 4#:2 5 13){~' .-'i.]
playmorse=: 30&$: :((wavnote&, 63 __"1)@(onoffdur morse))
