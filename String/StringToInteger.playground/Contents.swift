import UIKit

func aToI(_ str: String) -> Int? {
    return Int(str)
}

func atoIAscii(_ str: String) -> Int? {
    
    let strLower = str.map { $0.lowercased() }
    var strInt: Int = 0
    for char in str {
        let ascii = Int(char.asciiValue!) - 48
        strInt = strInt * 10 + ascii
    }
    return strInt
}
atoIAscii("123")
