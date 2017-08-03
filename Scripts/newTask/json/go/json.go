package main

import "encoding/json"

func main() {

	for i := 0; i < 10000000; i++ {
    		var data interface{}
    		jsonString := json.Unmarshal([]byte(`{"foo":1, "bar":[10, "apples"]}`), &data)
		_ = jsonString
	}
}
