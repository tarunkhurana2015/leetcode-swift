import UIKit

func palindrome1(_ str: String) -> Bool {
    
    var isPalindrome = true
    let filteredString = str.lowercased().filter { $0.isLetter || $0.isNumber }
    for i in 0..<filteredString.count/2 {
        let c1 = filteredString[filteredString.index(filteredString.startIndex, offsetBy: i)]
        let c2 = filteredString[filteredString.index(filteredString.endIndex, offsetBy: -(i+1))]
        if c1 != c2 {
            isPalindrome = false
        }
    }
    
    return isPalindrome
}
palindrome1("A man, a plan, a canal: Panama")
palindrome1("race a car")
palindrome1("madaM")

// // // // // // // // // // // // // // // //


func palindrome2(_ str: String) -> Bool {
    
    var isPalindrome = true
    let filteredString = str.lowercased().filter { $0.isLetter || $0.isNumber }
    
    isPalindrome = filteredString == String(filteredString.reversed())
    
    return isPalindrome
}
palindrome2("A man, a plan, a canal: Panama")
palindrome2("race a car")
palindrome2("madaM")

// // // // // // // // // // // // // // // //

func palindrome3(_ num: Int) -> Bool {
    var isPalindrome = true
    let str = String(num)
    
    isPalindrome = str == String(str.reversed())
    return isPalindrome
}
palindrome3(1233211)

func palindrome4(_ num: Int) -> Bool {
    var isPalindrome = true
    
    var number = num
    var reverNumber = 0
    while number > 0 {
        let reminder = number % 10
        reverNumber = reverNumber * 10 + reminder
        number = number / 10
    }
    
    return num == reverNumber
}
palindrome4(123321)

