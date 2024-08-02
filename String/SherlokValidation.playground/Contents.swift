/*
 Sherlock considers a string to be valid if all characters of the string appear the same number of times. It is also valid if he can remove just  character at  index in the string, and the remaining characters will occur the same number of times. Given a string , determine if it is valid. If so, return YES, otherwise return NO.

 Example

 This is a valid string because frequencies are .


 This is a valid string because we can remove one  and have  of each character in the remaining string.


 This string is not valid as we can only remove  occurrence of . That leaves character frequencies of .

 Function Description

 Complete the isValid function in the editor below.

 isValid has the following parameter(s):

 string s: a string
 */

func isValid(s: String) -> String {
    
    var charFrequency = [Character: Int]()
    var frequecyCount = [Int: Int]()
    
    var onceReduced = false
    for c in s {
        
        charFrequency[c,default: 0] += 1
    }
    
    for freq in charFrequency.values {
        frequecyCount[freq, default: 0] += 1
    }
    
    if frequecyCount.count == 1 { //[2: 7] [3:1]
        return "YES"
    }
    
    if frequecyCount.count == 2 {
        let keys = Array(frequecyCount.keys)
        let key1 = keys[0], key2 = keys[1]
        
        if (frequecyCount[key1] == 1 && (key1 - 1 == key2 || key1 - 1 == 0)) ||
            (frequecyCount[key2] == 1 && (key2 - 1 == key1 || key2 - 1 == 0)) { //key1 = 2; key2 = 3; (1 == 1 && (2 == 2 || 1 == 0))
            return "YES"
        }
    }
    
    return "NO"
}

print(isValid(s: "abc"))
print(isValid(s: "abcc"))
print(isValid(s: "abccc"))
print(isValid(s: "aabbcd"))
print(isValid(s: "abcdefghhgfedecba"))
