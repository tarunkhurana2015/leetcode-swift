import UIKit

func merge( left: [Int],  right: [Int]) -> [Int] {
    
    var mergedArray = [Int]()
    var leftIndex = 0
    var rightIndex = 0
    
    while leftIndex < left.count && rightIndex < right.count {
        if left[leftIndex] < right[rightIndex] {
            mergedArray.append(left[leftIndex])
            leftIndex += 1
        } else {
            mergedArray.append(right[rightIndex])
            rightIndex += 1
        }
    }
    
    mergedArray += Array(left[leftIndex...])
    mergedArray += Array(right[rightIndex...])
    
    return mergedArray
}
func mergeSort(array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    
    let middleIndex = array.count/2
    let leftArray = mergeSort(array: Array(array[..<middleIndex]))
    let rightArray = mergeSort(array: Array(array[middleIndex...]))
    
    return merge(left: leftArray, right: rightArray)
}

let array = [38,27,43,3,9,82,10]
let result = mergeSort(array: array)
print(result)
