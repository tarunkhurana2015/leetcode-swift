/*
 There is a string, , of lowercase English letters that is repeated infinitely many times. Given an integer, , find and print the number of letter a's in the first  letters of the infinite string.

 Example


 The substring we consider is , the first  characters of the infinite string. There are  occurrences of a in the substring.

 Function Description

 Complete the repeatedString function in the editor below.

 repeatedString has the following parameter(s):

 s: a string to repeat
 n: the number of characters to consider
 Returns

 int: the frequency of a in the substring

 */

func repeatedString(s: String, n: Int) -> Int {
    
    if s == "a" { return n }
    
    if Array(s).filter({ String($0) == "a" }).count == s.count { return n * s.count }
    
    let repeatCount = (n % s.count) == 0 ? (n / s.count) : (n / s.count) + 1
    let newS = String(repeating: s, count: repeatCount)
    let finalS = newS[newS.startIndex...newS.index(newS.startIndex, offsetBy: n-1)]
    
    let count = Array(finalS).filter { String($0) == "a"}.count
    
    
    return count
}

let count = repeatedString(s: "aba", n: 10)
print(count)

let count1 = repeatedString(s: "a", n: 1000000)
print(count1)

//let count2 = repeatedString(s: "ojowrdcpavatfacuunxycyrmpbkvaxyrsgquwehhurnicgicmrpmgegftjszgvsgqavcrvdtsxlkxjpqtlnkjuyraknwxmnthfpt", n: 685118368975)
//print(count2)
