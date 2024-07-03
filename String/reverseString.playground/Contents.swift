import UIKit


func reverseString1(_ str: String) -> String {
    
    var reverse = str.reversed()
    return String(reverse)
}
reverseString1("meta")

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

func reverseString2(_ str: String) -> String {
    
    var reverse = ""
    
    for i in (0..<str.count).reversed() {
        reverse += String(str[str.index(str.startIndex, offsetBy: i)])
    }
    
    
    return reverse
}
reverseString2("meta")

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
func reverseString3(_ str: String) -> String {

    var reverse = ""

    for i in 1...str.count {
        reverse += String(str[str.index(str.endIndex, offsetBy: -i)])
    }

    return reverse
}
reverseString3("meta")

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

func reverseString4(_ str: String) -> String {
    
    var reverse = ""
    
    for char in str {
        reverse = String(char) + reverse
    }
    
    
    return reverse
}
reverseString4("meta")

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

func reverseString5(_ str: String) -> String {
    
    var reverse = ""
    
    reverse = str.reduce("") {
        String($1) + $0
    }
    
    
    return reverse
}
reverseString5("meta")

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
