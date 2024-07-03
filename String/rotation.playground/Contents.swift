import UIKit

func isRotation(_ str1: String, _ str2: String) -> Bool {
    
    guard str1.count == str2.count else {
        return false
    }
    
    let concatenatedString = str1 + str1
    return concatenatedString.contains(str2)
}

isRotation("waterbottle", "erbottlewat")

// *************************************************************** //

func rotate(_ str: String, _ d: Int) -> String {
    
    var rotatedStr = [String](repeating: "", count: str.count)
    
    let count = str.count
    for index in 0..<count {
        let adjustedIndex = (index + count + d) % count // right rotation
        rotatedStr[adjustedIndex] = String(str[str.index(str.startIndex, offsetBy: index)])
    }
    return rotatedStr.reduce(""){ $0 + $1 }
}
let result = rotate("hello", 1001)
