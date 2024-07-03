import UIKit

/*
 Given two strings word1 and word2, return the minimum number of operations required to convert word1 to word2.

 You have the following three operations permitted on a word:

 Insert a character
 Delete a character
 Replace a character
  

 Example 1:

 Input: word1 = "horse", word2 = "ros"
 Output: 3
 Explanation:
 horse -> rorse (replace 'h' with 'r')
 rorse -> rose (remove 'r')
 rose -> ros (remove 'e')
 Example 2:

 Input: word1 = "intention", word2 = "execution"
 Output: 5
 Explanation:
 intention -> inention (remove 't')
 inention -> enention (replace 'i' with 'e')
 enention -> exention (replace 'n' with 'x')
 exention -> exection (replace 'n' with 'c')
 exection -> execution (insert 'u')
 */


func minDistance(_ word1: String, _ word2: String) -> Int {
    
    var operationCount = 0
    
    let m = word1.count
    let n = word2.count
    
    let word1Array = Array(word1)
    let word2Array = Array(word2)
    
    let dp = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
    
    
}
