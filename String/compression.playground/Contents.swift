import UIKit


// input aaabbbcccdaa
// output a3b3c3d1a2
func compression(_ str: String) -> String {
    
    var compressedString = ""
    var currentChar: Character?
    var charCount = 0
    
    for character in str {
        if character == currentChar {
            charCount += 1
        } else {
            if let current = currentChar {
                compressedString += String(current)+String(charCount)
            }
            currentChar = character
            charCount = 1
        }
    }
    if let current = currentChar {
        compressedString += String(current)+String(charCount)
    }
    
    return compressedString
}

compression("aaabbbcccdaa")

func compress(_ chars: [Character]) -> Int {
    
    var compressedString = ""
    var currentChar: Character?
    var charCount = 0
    
    for character in chars {
        if character == currentChar {
            charCount += 1
        } else {
            if let current = currentChar {
                compressedString += String(current)+String(charCount)
            }
            currentChar = character
            charCount = 1
        }
    }
    if let current = currentChar {
        compressedString += String(current)+String(charCount)
    }
    
    return compressedString.count
}

compress(["a","a","b","b","c","c","c"])
