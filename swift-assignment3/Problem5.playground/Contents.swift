func isPalindrome(_ word: String) -> Bool {
    let characters = Array(word.lowercased().filter { $0.isLetter })
    let length = characters.count
    
    for i in 0..<length/2 {
        if characters[i] != characters[length - 1 - i] {
            return false
        }
    }
    
    return true
}

// Example usage:
let word1 = "racecar"
let word2 = "hello"

print(isPalindrome(word1))  // Output: true
print(isPalindrome(word2))  // Output: false
