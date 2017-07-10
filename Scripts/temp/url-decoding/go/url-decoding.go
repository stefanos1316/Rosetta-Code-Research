package main

import (
	"fmt"
	"log"
	"net/url"
)

func main() {

	for i := 0; i < 1000000; i++ {
		var urlString = "http%3A%2F%2Ffoo%20bar%2F"
	
		u, err := url.QueryUnescape(urlString)
		if err != nil {
			log.Println(err)
		
		}
		fmt.Println(u)
	}
}
