import UIKit

func longestCommonPrefix(_ array: [String]) -> String {
    
    var commonPrefix = ""
    let firstString = array[0]
    
    for (index, char) in firstString.enumerated() {
        for str in array {
            if index >= str.count || str[str.index(str.startIndex, offsetBy: index)] != char {
                return commonPrefix
            }
        }
        commonPrefix.append(char)
    }
    
    return commonPrefix
}

longestCommonPrefix(["flower", "flow", "flight"])
