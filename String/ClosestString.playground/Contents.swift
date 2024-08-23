/*
 1657. Determine if Two Strings Are Close
 Medium
 Topics
 Companies
 Hint
 Two strings are considered close if you can attain one from the other using the following operations:

 Operation 1: Swap any two existing characters.
 For example, abcde -> aecdb
 Operation 2: Transform every occurrence of one existing character into another existing character, and do the same with the other character.
 For example, aacabb -> bbcbaa (all a's turn into b's, and all b's turn into a's)
 You can use the operations on either string as many times as necessary.

 Given two strings, word1 and word2, return true if word1 and word2 are close, and false otherwise.
 
 Example 1:

 Input: word1 = "abc", word2 = "bca"
 Output: true
 Explanation: You can attain word2 from word1 in 2 operations.
 Apply Operation 1: "abc" -> "acb"
 Apply Operation 1: "acb" -> "bca"
 Example 2:

 Input: word1 = "a", word2 = "aa"
 Output: false
 Explanation: It is impossible to attain word2 from word1, or vice versa, in any number of operations.
 Example 3:

 Input: word1 = "cabbba", word2 = "abbccc"
 Output: true
 Explanation: You can attain word2 from word1 in 3 operations.
 Apply Operation 1: "cabbba" -> "caabbb"
 Apply Operation 2: "caabbb" -> "baaccc"
 Apply Operation 2: "baaccc" -> "abbccc"
 */

func closestStrings(_ word1: String, _ word2: String) -> Bool {
    
    // Operation 1 - swap characters
    // Operation 2 - transform occurance of a charcacter with other character
    
    // check the length
    if word1.count != word2.count {
        return false
    }
    
    // check frequnecy distributions
    let freq1 = Array(word1).reduce(into: [:]) {
        $0[$1, default: 0] += 1
    }
    let freq2 = Array(word2).reduce(into: [:]) {
        $0[$1, default: 0] += 1
    }
    
    let keys1 = Set(freq1.keys)
    let keys2 = Set(freq2.keys)
    
    print(freq1)
    print(keys1)
    print(freq2)
    print(keys2)
    
    // the keys should match
    if keys1 != keys2 {
            return false
        }
    
    // the frequency should match
    let values1 = freq1.values.sorted()
    let values2 = freq2.values.sorted()
    print(values1)
    print(values2)
        
        return values1 == values2
    
}

print(closestStrings("abc", "bca"))
print(closestStrings("cabbba", "abbccc"))
