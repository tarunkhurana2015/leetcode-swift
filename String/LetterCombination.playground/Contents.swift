/*
 Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

 A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
 */



func letterCombination(_ digits: String) -> [String] {
    
    if digits.isEmpty { return []}
    let phone = [
        "2": ["a", "b", "c"],
                "3": ["d", "e", "f"],
                "4": ["g", "h", "i"],
                "5": ["j", "k", "l"],
                "6": ["m", "n", "o"],
                "7": ["p", "q", "r", "s"],
                "8": ["t", "u", "v"],
                "9": ["w", "x", "y", "z"]
    ]
    
    var result = [String]()
    
    func backtrack(_ combination: String, _ nextDigits: String) {
        if nextDigits.isEmpty {
            result.append(combination)
        } else {
            let digit = nextDigits.first! // 2
            if let letters = phone[String(digit)] { // a,b,c
                for letter in letters {// a
                    backtrack(combination+letter, String(nextDigits.dropFirst())) // (a, "3") (ad, "")
                }
            }
        }
        
        
    }
    backtrack("", digits) // ("", "23")
    return result
    
}
print(letterCombination("23"))
print(letterCombination(""))

