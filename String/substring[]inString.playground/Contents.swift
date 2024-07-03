import UIKit

// The strStr() function in Swift is used to find the index of the first occurrence of a substring within a given string. You can implement this function using the range(of:) method provided by Swift's String type. Here's how you can do it

func findAllOcuurance(of subArray: [String], in string: String) -> [String: [Int]] {
    
    //var dict = [String: [NSRange]]()
    var dict2 = [String: [Int]]()
    for item in subArray {
        let ranges = string.ranges(of: item)
        //dict[item] = ranges.compactMap { NSRange($0, in:string) }
        dict2[item] = ranges.compactMap { string.distance(from: string.startIndex, to: $0.lowerBound) }
    }
    return dict2
}
let range = findAllOcuurance(of: ["abc","heg","acbf"], in: "abchegacbfabc")
print("\(range)")
