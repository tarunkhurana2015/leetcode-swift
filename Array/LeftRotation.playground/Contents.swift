import UIKit

func leftRotate(arr: [Int], by d: Int) -> [Int] {
    
    let count = arr.count
    var rotatedArray = Array(repeating: 0, count: count)
    
    for i in 0..<count {
        let index = (i + count - d) % count
        rotatedArray[index] = arr[i]
    }
    return rotatedArray
}

let arr = leftRotate(arr: [1,2,3,4,5], by: 2)
print(arr)

func rightRotate(arr: [Int], by d: Int) -> [Int] {
    
    let count = arr.count
    var rotatedArray = Array(repeating: 0, count: count)
    
    for i in 0..<count {
        let index = (i + count + d) % count
        rotatedArray[index] = arr[i]
    }
    return rotatedArray
}

let arr1 = rightRotate(arr: [1,2,3,4,5,6,7], by: 100)
print(arr1)
