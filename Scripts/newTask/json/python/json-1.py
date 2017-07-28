import json

def main():

	for i in range(10000000):
	
		# load a JSON string into a data structure
		data = json.loads('{ "foo": 1, "bar": [10, "apples"] }')
	
		# store a data structure into JSON
		sample = { "blue": [1,2], "ocean": "water" }
		json_string = json.dumps(sample)
		print json_string

if __name__ == "__main__":
    main()
