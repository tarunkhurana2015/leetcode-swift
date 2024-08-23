/*
 334. Increasing Triplet Subsequence
 Medium
 Topics
 Companies
 Given an integer array nums, return true if there exists a triple of indices (i, j, k) such that i < j < k and nums[i] < nums[j] < nums[k]. If no such indices exists, return false.
 */

func increasingTriplet(_ nums: [Int]) -> Bool {
    
    var first = Int.max
    var second = Int.max
    
    for num in nums {
        if num <= first {
            first = num
        } else if num <= second {
            second = num
        } else {
            return true
        }
    }
    return false
}

print(increasingTriplet([5,4,3,2,1]))
print(increasingTriplet([2,1,5,0,4,6]))
print(increasingTriplet([20,100,10,12,5,13]))
