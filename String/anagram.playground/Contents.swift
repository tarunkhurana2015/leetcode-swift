import UIKit

func anagram1(_ str1: String, _ str2: String) -> Bool {
    
    let newStr1 = str1.lowercased().replacingOccurrences(of: " ", with: "")
    let newStr2 = str2.lowercased().replacingOccurrences(of: " ", with: "")
    
    return newStr1.sorted() == newStr2.sorted()
}
anagram1("cinema", "iceman")




func anagram2(_ str1: String, _ str2: String) -> Bool {
    
    let newStr1 = str1.lowercased().filter { $0.isLetter || $0.isNumber }
    let newStr2 = str2.lowercased().filter { $0.isLetter || $0.isNumber }
    
    return newStr1.sorted() == newStr2.sorted()
}
anagram2("cinema", "iceman")



func anagram3(_ str1: String, _ str2: String) -> Bool {
    
    var charMap = Dictionary<Character, Int>()
    
    for c in str1 {
        if charMap[c] != nil {
            charMap[c]! += 1
        } else {
            charMap[c] = 1
        }
    }
    
    for c in str2 {
        if charMap[c] != nil {
            charMap[c]! -= 1
        } else {
            charMap[c] = 1
        }
    }
    
    let sum = charMap.reduce(0) { (result, element) in
        return result + element.value
    }
    
    if sum == 0 {
        return true
    }
    
    return false
}
anagram3("cinema", "iceman")
