package main

import (
    "fmt"
    "io/ioutil"
)

func main() {

for i := 0; i < 1000000; i++ {

    b, err := ioutil.ReadFile("../input.txt")
    if err != nil {
        fmt.Println(err)
        return
    }
    if err = ioutil.WriteFile("output.txt", b, 0666); err != nil {
        fmt.Println(err)
    }
}
}
