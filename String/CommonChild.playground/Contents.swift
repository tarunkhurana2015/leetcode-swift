/*
 A string is said to be a child of a another string if it can be formed by deleting 0 or more characters from the other string. Letters cannot be rearranged. Given two strings of equal length, what's the longest string that can be constructed such that it is a child of both?

 Example



 These strings have two children with maximum length 3, ABC and ABD. They can be formed by eliminating either the D or C from both strings. Return .

 Function Description

 Complete the commonChild function in the editor below.

 commonChild has the following parameter(s):

 string s1: a string
 string s2: another string
 Returns

 int: the length of the longest string which is a common child of the input strings
 */

func commonChild(s1: String, s2: String) -> Int {
    
    let m = s1.count
    let n = s2.count
    let s1Array = Array(s1)
    let s2Array = Array(s2)
    
    // Create a 2D array to store lengths of longest common subsequence
    var dp = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
    
    // Fill the dp array
    for i in 1...m {
        for j in 1...n {
            if s1Array[i - 1] == s2Array[j-1] {
                dp[i][j] = dp[i - 1][j-1] + 1
            } else {
                dp[i][j] = max(dp[i - 1][j], dp[i][j-1])
            }
        }
    }
    
    return dp[m][n]
}

let count = commonChild(s1: "SHINCHAN", s2: "NOHARAAA")
