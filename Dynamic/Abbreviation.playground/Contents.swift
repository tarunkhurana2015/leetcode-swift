/*
 You can perform the following operations on the string, :

 Capitalize zero or more of 's lowercase letters.
 Delete all of the remaining lowercase letters in .
 Given two strings,  and , determine if it's possible to make  equal to  as described. If so, print YES on a new line. Otherwise, print NO.

 For example, given  and , in  we can convert  and delete  to match . If  and , matching is not possible because letters may only be capitalized or discarded, not changed.

 Function Description

 Complete the function  in the editor below. It must return either  or .

 abbreviation has the following parameter(s):

 a: the string to modify
 b: the string to match
 Input Format

 The first line contains a single integer , the number of queries.

 Each of the next  pairs of lines is as follows:
 - The first line of each query contains a single string, .
 - The second line of each query contains a single string, .
 */

func abbreviation(a: String, b: String) -> Bool {
    
    let bArray = Array(b)
    var index = 0
    for char in a {
        if index >= b.count {
            if char.isUppercase {
                return false
            }
        }
        else if char.uppercased() == String(bArray[index]) {
            index += 1
            continue
        }
    }
    return index == b.count
}

let result = abbreviation(a: "AbcDE", b: "ABDE")
let result1 = abbreviation(a: "AbcDE", b: "AfDE")
let result2 = abbreviation(a: "daBcd", b: "ABC")
