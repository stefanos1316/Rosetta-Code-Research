import Foundation

for i in 0...1000000 {

let file: FileHandle? = FileHandle(forReadingAtPath: "../input.txt")

if file != nil {
    // Read all the data
    let data = file?.readDataToEndOfFile()

    // Close the file
    file?.closeFile()

    // Convert our data to string
    let text = String(data: data!, encoding: String.Encoding.utf8)
    let contains = text!
    let path = "output.txt"
	do {
    // Write contents to file 
   
    try contains.write(toFile: path, atomically: false, encoding: String.Encoding.utf8)
}
catch let error as NSError {
    print("Ooops! Something went wrong: \(error)")
}
}
else {
    print("Ooops! Something went wrong!")
}

}
