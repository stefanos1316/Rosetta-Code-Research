// Fibonacci using BigInt with Stream.foldLeft optimized for GC (Scala v2.9 and above)
// Does not run out of memory for very large Fibonacci numbers
def fib(n:Int) = {

  def series(i:BigInt,j:BigInt):Stream[BigInt] = i #:: series(j, i+j)

  series(1,0).take(n).foldLeft(BigInt("0"))(_+_)
}

// Small test
(0 to 13) foreach {n => print(fib(n).toString + " ")}

// result: 0 1 1 2 3 5 8 13 21 34 55 89 144 233
