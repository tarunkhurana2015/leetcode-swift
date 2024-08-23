/*
 Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

 You must write an algorithm that runs in O(n) time and without using the division operation.
 */

func productExceptSelf(_ nums: [Int]) -> [Int] {
    
    var result = Array(repeating: 1, count: nums.count)
    
    var left = 1
    for i in 0..<nums.count {
        result[i] = left // [1, 1, 2, 6]
        left *= nums[i]  // [1, 2, 6, 24]
    }
    
    var right = 1
    for i in (0..<nums.count).reversed() {
        result[i] *= right  // [,,8,6
        right *= nums[i]    // [4,16
    }
    
    return result
}

print(productExceptSelf([1,2,3,4]))

