import UIKit

func hasUniqueCharacters1(_ str1: String) -> Bool {
    
    var isUnique: Bool = true
    
    let strSorted = str1.lowercased().sorted()
    
    var currentCharacter: Character? = nil
    var countCharacter = 0
    for char in strSorted {
        if char == currentCharacter {
            isUnique = false
        }
        currentCharacter = char
    }
    
    return isUnique
}

hasUniqueCharacters1("abcdefr")

// // // // // // // // // // // // // // //

func hasUniqueCharacters2(_ str1: String) -> Bool {
    
    var seenCharacters = Set<Character>()
    
    for char in str1 {
        if seenCharacters.contains(char) {
            return false
        }
        seenCharacters.insert(char)
    }
    return true
}
