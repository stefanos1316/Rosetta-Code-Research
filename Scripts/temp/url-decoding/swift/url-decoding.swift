import Foundation

for i in 0...1000000 {
	let encoded = "http%3A%2F%2Ffoo%20bar%2F"
	let encodedHost = encoded.removingPercentEncoding
	print(encodedHost as Any)
}
