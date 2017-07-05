package main

import (
    "fmt"
    "net/url"
)

func main() {
  for i := 0; i < 1000000; i++ {
    fmt.Println(url.QueryEscape("http://foo bar/"))
  }
}
