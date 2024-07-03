import UIKit

func binarySearch(_ array: [Int], searchVal: Int) -> Bool {
    if array.count == 0 {
        return false
    }
    
    var startIndex = 0
    var endIndex = array.count-1
    
    while endIndex >= startIndex {
        let midIndex = (startIndex + endIndex)/2
        if searchVal == array[midIndex] {
            return true
        } else if searchVal > array[midIndex] {
            startIndex = midIndex + 1
        } else {
            endIndex = midIndex - 1
        }
    }
        
    return false
}
let array = [2,3,4,5,6,7,8,9]
binarySearch(array, searchVal: 10)
