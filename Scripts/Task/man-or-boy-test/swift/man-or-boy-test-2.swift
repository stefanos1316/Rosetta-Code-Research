func A(var k: Int, x1: () -> Int, x2: () -> Int, x3: () -> Int, x4: () -> Int, x5: () -> Int) -> Int {
  var B: (() -> Int)!
  B = {
    k--
    return A(k, B, x1, x2, x3, x4)
  }
  if k <= 0 {
    return x4() + x5()
  } else {
    return B()
  }
}

println(A(10, {1}, {-1}, {-1}, {1}, {0}))
