/*
 A string is said to be a special string if either of two conditions is met:

 All of the characters are the same, e.g. aaa.
 All characters except the middle one are the same, e.g. aadaa.
 A special substring is any substring of a string which meets one of those criteria. Given a string, determine how many special substrings can be formed from it.

 Example

  contains the following  special substrings: .

 Function Description

 Complete the substrCount function in the editor below.

 substrCount has the following parameter(s):

 int n: the length of string s
 string s: a string
 Returns
 - int: the number of special substrings
 */

func isSpecial1Str(s: String) -> Bool {
    // all characters are same ?
    let sArray = Array(s)
    let filteredArray = sArray.filter { sArray[0] == $0 }
    return filteredArray.count == sArray.count
    
}
func isSpecial2Str(s: String) -> Bool {
    
    let count = s.count
    if count % 2 == 0 {
        return false // if count is even it's not valid
    }
    let array = Array(s)
    var left = 0
    var right = count-1
    
    var leftStr = ""
    var rightStr = ""
    
    while left < right {
        if array[left] != array[right] { // left and right characters did not match
            return false
        } else {
            leftStr = leftStr + String(array[left])
            rightStr = String(array[right]) + rightStr
        }
        left += 1
        right -= 1
    }
    
    return leftStr == rightStr // right and left are same strings
}
func substrCount(s: String) -> Int {
    
    var subStr = [String]()
    let array = Array(s)
    
    for (index1,char1) in array.enumerated() { // O(n)
        subStr.append(String(char1))
        var tempStr = String(char1)
        for index2 in (index1+1)..<array.count { // O(n-1)
            let char2 = array[index2]
            tempStr = tempStr + String(char2)
            if isSpecial1Str(s: tempStr) {
                subStr.append(tempStr)
            }
            else if isSpecial2Str(s: tempStr) {
                subStr.append(tempStr)
            }
            print("tempStr : \(tempStr) * subStr: \(subStr)")
        }
    }
    print(subStr)
    return subStr.count
}

//let count = substrCount(s: "asasd")
//let count2 = substrCount(s: "mnonopoo")
let count3 = substrCount(s: "abcbaba") // a b c b a b a; bcb bab aba
