   require'convert'
   numbers=: 16b7f 16b4000 0 16b3ffffe 16b1fffff 200000
   av vlq=: vfi numbers
127 129 128 0 0 129 255 255 126 255 255 127 140 154 64
   av (vfi 1 2 3 4 5 6) +&.ifv vlq
129 0 129 128 2 3 130 128 128 2 129 128 128 4 140 154 70
