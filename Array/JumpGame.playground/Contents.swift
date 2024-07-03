import UIKit

/*
 You are given an integer array nums. You are initially positioned at the array's first index, and each element in the array represents your maximum jump length at that position.

 Return true if you can reach the last index, or false otherwise.

  

 Example 1:

 Input: nums = [2,3,1,1,4]
 Output: true
 Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
 Example 2:

 Input: nums = [3,2,1,0,4]
 Output: false
 Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.
 */

func jumpGame(_ nums: [Int]) -> Bool {
    
    var maxReach = 0
    let n = nums.count
    
    for index in 0..<n {
        if index > maxReach {
            return false
        }
        maxReach = max(maxReach, index + nums[index]) 
    }
    
    return maxReach >= n - 1
}

let result1 = jumpGame([2,3,1,1,4])
print(result1)

let result2 = jumpGame([3,2,1,0,4])
print(result2)
