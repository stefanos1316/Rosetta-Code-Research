func step_up() {
  while !step() {
    step_up()
  }
}
