(be pythag (@N @X @Y @Z)
   (for @X @N)
   (for @Y @X @N)
   (for @Z @Y @N)
   (^ @
      (let (X (-> @X)  Y (-> @Y)  Z (-> @Z))
         (= (+ (* X X) (* Y Y)) (* Z Z)) ) ) )
