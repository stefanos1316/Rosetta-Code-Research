library(rjson)

for (i in 0:10000000) {
data <- fromJSON('{ "foo": 1, "bar": [10, "apples"] }')

toJSON(data)
}
