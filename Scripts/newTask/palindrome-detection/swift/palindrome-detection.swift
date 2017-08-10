extension String {
    
    /**
     Checks if string is a palindrome, ignoring spaces and capitalization. [Source on GitHub](http://bit.ly/SwiftStringPalindromeExtension)
     - note:
     [What's a palindrome?](https://en.wikipedia.org/wiki/Palindrome)
     - returns: Bool
     */
    public func isPalindrome() -> Bool {
        var s = String(self.characters.filter { $0 != Character(" ") }).lowercased()
        return s == String(s.characters.reversed())
    }
    
}

for i in 0...100000000 {
 let data = "saippuakivikauppias"
 data.isPalindrome()   // true
}
