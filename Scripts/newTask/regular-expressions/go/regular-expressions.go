package main
import "regexp"

func main() {
  str := "this is a matching string"

  // Test
  for i := 0; i < 10000000; i++ {
  matched, _ := regexp.MatchString(".*string$", str)
  if matched { }

  // Substitute
  pattern := regexp.MustCompile("matching")
  result := pattern.ReplaceAllString(str, "istyfied")
  _ = result
  }

}
