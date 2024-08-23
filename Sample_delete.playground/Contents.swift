
var string: String = "abcdefgh"
for index in (0..<string.count).reversed() {
    let value = String((string[string.index(string.startIndex, offsetBy: index)]))
    print(value)
}


func longestSubstring(_ str: String) -> Int {
    
    var maxLength = 0
    var charIndexMap = [Character: Int]()
    var startIndex = 0
    
    for (endIndex, char) in str.enumerated() {
        
        if let index = charIndexMap[char], index >= startIndex {
            startIndex += index
        }
        charIndexMap[char] = endIndex
        
        maxLength = max(maxLength, endIndex-startIndex+1)
    }
    
}
