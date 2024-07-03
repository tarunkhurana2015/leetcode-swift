import UIKit

// solve using the sliding window algorithm
func longestSubStringWithoutRepeatingCharacters(_ str: String) -> Int {
    
    var maxLength = 0
    var charIndexMap = [Character: Int]()
    var startIndex = 0
    
    for (endIndex, char) in str.enumerated() {
        
        if let index = charIndexMap[char], index >= startIndex {
            startIndex = index + 1
        }
        
        
        charIndexMap[char] = endIndex
        
        maxLength = max(maxLength, endIndex - startIndex + 1)
    }
    
    return maxLength
}

longestSubStringWithoutRepeatingCharacters("abcabcbb")

longestSubStringWithoutRepeatingCharacters("abcdeabcbb")
