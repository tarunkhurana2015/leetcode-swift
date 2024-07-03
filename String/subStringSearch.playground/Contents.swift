import UIKit

func string1(_ str: String, has subString: String) -> Bool {
    
    
    return str.contains(subString)
    
}

string1("abcddef", has: "cdd")
string1("abcddef", has: "abg")

//_______________

func string2(_ str: String, has subString: String) -> Bool {
    
    
    return str.range(of: subString) != nil
    
}

string2("abcddef", has: "cdd")
string2("abcddef", has: "abg")
