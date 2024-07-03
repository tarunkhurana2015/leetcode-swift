import UIKit

func rotateArray(_ arr : inout [Int], _ k: Int) {
    
    guard arr.count > 1 else { return }
    let rotations = k % arr.count
    
    reverse(&arr, start: 0, end: arr.count - 1)
    reverse(&arr, start: 0, end: rotations - 1)
    reverse(&arr, start: rotations, end: arr.count - 1)
}

func reverse(_ nums: inout [Int], start: Int, end: Int) {
    var left = start
    var right = end
    
    while left < right {
        nums.swapAt(left, right)
        left += 1
        right -= 1
    }
}

var arr: [Int] = [1,2,3,4,5,6,7]
rotateArray(&arr, 2)
print(arr)
