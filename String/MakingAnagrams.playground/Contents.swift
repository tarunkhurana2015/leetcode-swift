import UIKit

/*
 A student is taking a cryptography class and has found anagrams to be very useful. Two strings are anagrams of each other if the first string's letters can be rearranged to form the second string. In other words, both strings must contain the same exact letters in the same exact frequency. For example, bacdc and dcbac are anagrams, but bacdc and dcbad are not.

 The student decides on an encryption scheme that involves two large strings. The encryption is dependent on the minimum number of character deletions required to make the two strings anagrams. Determine this number.

 Given two strings,  and , that may or may not be of the same length, determine the minimum number of character deletions required to make  and  anagrams. Any characters can be deleted from either of the strings.

 Example


 Delete  from  and  from  so that the remaining strings are  and  which are anagrams. This takes  character deletions.

 Function Description

 Complete the makeAnagram function in the editor below.

 makeAnagram has the following parameter(s):

 string a: a string
 string b: another string
 Returns

 int: the minimum total characters that must be deleted
 Input Format

 The first line contains a single string, .
 The second line contains a single string, .
 */

func makeAnagrams(a: String, b: String) -> Int {
    
    
    //var a = a.sorted()
    //var b = b.sorted()
    
    let minCount = min(a.count, b.count)
    
    var dict = [Character: Int]()
    for index in 0..<minCount {
        dict[a[a.index(a.startIndex, offsetBy: index)], default: 0] += 1
        dict[b[b.index(b.startIndex, offsetBy: index)], default: 0] += -1
        print(dict)
    }
    if a.count > b.count {
        for index in minCount..<a.count {
            dict[a[a.index(a.startIndex, offsetBy: index)], default: 0] += 1
        }
    } else if b.count > a.count {
        for index in minCount..<b.count {
            dict[b[b.index(b.startIndex, offsetBy: index)], default: 0] -= 1
        }
    }
    print("=== \(dict)")
    
    return dict.reduce(0) {
        $0 + abs($1.value)
    }
}

let deletionCount = makeAnagrams(a: "cde", b: "def")
print(deletionCount)

let deletionCount1 = makeAnagrams(a: "cde", b: "abc")
print(deletionCount1)

let deletionCount2 = makeAnagrams(a: "fcrxzwscanmligyxyvym", b: "jxwtrhvujlmrpdoqbisbwhmgpmeoke")
print("Sorted A = \("fcrxzwscanmligyxyvym".sorted())")
print("Sorted B = \("jxwtrhvujlmrpdoqbisbwhmgpmeoke".sorted())")
print(deletionCount2)

let deletionCount4 = makeAnagrams(a: "showman", b: "woman") //ahmnosw amnow
print(deletionCount4)
