NB. check points on a regular grid within the bounding box


N=: 400  NB. grids in each dimension.  Controls accuracy.


'X Y R'=: |: XYR=: (_&".;._2~ LF&=)0 :0
 1.6417233788  1.6121789534 0.0848270516
-1.4944608174  1.2077959613 1.1039549836
 0.6110294452 -0.6907087527 0.9089162485
 0.3844862411  0.2923344616 0.2375743054
-0.2495892950 -0.3832854473 1.0845181219
 1.7813504266  1.6178237031 0.8162655711
-0.1985249206 -0.8343333301 0.0538864941
-1.7011985145 -0.1263820964 0.4776976918
-0.4319462812  1.4104420482 0.7886291537
 0.2178372997 -0.9499557344 0.0357871187
-0.6294854565 -1.3078893852 0.7653357688
 1.7952608455  0.6281269104 0.2727652452
 1.4168575317  1.0683357171 1.1016025378
 1.4637371396  0.9463877418 1.1846214562
-0.5263668798  1.7315156631 1.4428514068
-1.2197352481  0.9144146579 1.0727263474
-0.1389358881  0.1092805780 0.7350208828
 1.5293954595  0.0030278255 1.2472867347
-0.5258728625  1.3782633069 1.3495508831
-0.1403562064  0.2437382535 1.3804956588
 0.8055826339 -0.0482092025 0.3327165165
-0.6311979224  0.7184578971 0.2491045282
 1.4685857879 -0.8347049536 1.3670667538
-0.6855727502  1.6465021616 1.0593087096
 0.0152957411  0.0638919221 0.9771215985
)

bbox=: (<./@:- , >./@:+)&R
BBOXX=: bbox X
BBOXY=: bbox Y

grid=: 3 : 0
'MN MX N'=. y
D=. MX-MN
EDGE=. D%N
(MN(+ -:)EDGE)+(D-EDGE)*(i. % <:)N
)

assert 2.2 2.6 3 3.4 3.8 -: grid 2 4 5

GRIDDED_SAMPLES=: BBOXX {@:;&(grid@:(,&N)) BBOXY

Note '4 4{.GRIDDED_SAMPLES'  NB. example
┌─────────────────┬─────────────────┬─────────────────┬─────────────────┐
│_2.59706 _2.20043│_2.59706 _2.19774│_2.59706 _2.19505│_2.59706 _2.19236│
├─────────────────┼─────────────────┼─────────────────┼─────────────────┤
│_2.59434 _2.20043│_2.59434 _2.19774│_2.59434 _2.19505│_2.59434 _2.19236│
├─────────────────┼─────────────────┼─────────────────┼─────────────────┤
│_2.59162 _2.20043│_2.59162 _2.19774│_2.59162 _2.19505│_2.59162 _2.19236│
├─────────────────┼─────────────────┼─────────────────┼─────────────────┤
│_2.58891 _2.20043│_2.58891 _2.19774│_2.58891 _2.19505│_2.58891 _2.19236│
└─────────────────┴─────────────────┴─────────────────┴─────────────────┘
)
XY=: >,GRIDDED_SAMPLES  NB. convert to an usual array of floats.

mp=: $:~ :(+/ .*)  NB. matrix product
assert (*: 5 13) -: (mp"1) 3 4,:5 12

in=: *:@:{:@:] >: [: mp (- }:)    NB. logical function
assert 0 0 in 1 0 2         NB. X Y  in  X Y R
assert 0 0 (-.@:in) 44 2 3

CONTAINED=: XY in"1/XYR NB. logical table of circles containing each grid
FRACTION=: CONTAINED (+/@:(+./"1)@:[ % *:@:]) N
AREA=: BBOXX*&(-/)BBOXY  NB. area of the bounding box.
FRACTION*AREA

NB. result is 21.5645
