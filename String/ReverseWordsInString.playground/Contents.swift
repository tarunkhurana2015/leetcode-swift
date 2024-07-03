import UIKit

/*
 Given an input string s, reverse the order of the words.

 A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space.

 Return a string of the words in reverse order concatenated by a single space.

 Note that s may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.

  

 Example 1:

 Input: s = "the sky is blue"
 Output: "blue is sky the"
 Example 2:

 Input: s = "  hello world  "
 Output: "world hello"
 Explanation: Your reversed string should not contain leading or trailing spaces.
 Example 3:

 Input: s = "a good   example"
 Output: "example good a"
 Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.
 */

func reverseWords(_ s: String) -> String {
    
    var stack = [String]()
    
    var word = ""
    var spaceFound = false
    for character in s {
        if String(character) != " " {
            word += String(character)
            spaceFound = false
        } else {
            if !spaceFound {
                if !word.isEmpty {
                    stack.append(word)
                    word = ""
                }
            }
            spaceFound = true
        }
    }
    if !spaceFound && word != " " {
        stack.append(word)
    }
    
    var newword = stack.reduce("") {
        $1 + " " + $0
    }
    newword.removeLast()
    return newword
}

let result = reverseWords("  hello world  ")
print(result)


func reverseWords1(_ s: String) -> String {
    
    let words = s.split(separator: " ")
    let reverseWords = words.reversed()
    return reverseWords.joined(separator: " ")
}
print(reverseWords1("  hello world  "))
