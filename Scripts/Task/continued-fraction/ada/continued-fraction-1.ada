generic
   type Scalar is digits <>;

   with function A (N : in Natural)  return Natural;
   with function B (N : in Positive) return Natural;
function Continued_Fraction (Steps : in Natural) return Scalar;
