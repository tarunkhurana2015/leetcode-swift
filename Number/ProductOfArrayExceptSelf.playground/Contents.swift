import UIKit

/*
 Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

 You must write an algorithm that runs in O(n) time and without using the division operation.

  

 Example 1:

 Input: nums = [1,2,3,4]
 Output: [24,12,8,6]
 Example 2:

 Input: nums = [-1,1,0,-3,3]
 Output: [0,0,9,0,0]
 */


func productOFArray(_ array: [Int]) -> [Int] {
    
    var products = [Int]()
    
    for (index1, number1) in array.enumerated() {
        var product = 1
        for (index2, number2) in array.enumerated() {
            if index1 != index2 {
                product *= number2
            }
        }
        products.append(product)
    }
    
    return products
}

let result = productOFArray([1,2,3,4])
print(result)



func productOFArray1(_ nums: [Int]) -> [Int] {
    
    let n = nums.count
    var result = Array(repeating: 1, count: n)
    
    var leftProduct = 1
    for i in 0..<n { // 1 2 3 4
        result[i] *= leftProduct // 1 1 2 6
        leftProduct *= nums[i] // 1 2 6 24
    }
    
    var rightProduct = 1
    for i in (0..<n).reversed() {
        result[i] *= rightProduct //     24   12   8 6
        rightProduct *= nums[i] //       24   24   12  4
    }
    
    return result
}

let result1 = productOFArray1([1,2,3,4])
print(result1)
