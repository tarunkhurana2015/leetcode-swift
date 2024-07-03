import UIKit

// The strStr() function in Swift is used to find the index of the first occurrence of a substring within a given string. You can implement this function using the range(of:) method provided by Swift's String type. Here's how you can do it

func strStr(_ haystack: String, _ needle: String) -> Int {
    guard !needle.isEmpty else {
        return -1
    }
    
    guard let range = haystack.range(of: needle) else {
        return -1
    }
    
    return haystack.distance(from: haystack.startIndex, to: range.lowerBound)
}
strStr("hello", "ll")
