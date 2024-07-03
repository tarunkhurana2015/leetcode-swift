/*
 }

 print(longestSubarray([1,4,3,3,2]))
 /** Expected: 2
 Explanation:

 The strictly increasing subarrays of nums are [1], [2], [3], [3], [4], and [1,4].

 The strictly decreasing subarrays of nums are [1], [2], [3], [3], [4], [3,2], and [4,3].
 */

 print(longestSubarray([3,3,3,3])) // Expected: 1
 print(longestSubarray([3,2,1])) // Expected: 3
 */

func longestSubArray(_ array: [Int]) -> Int {
    
    var maxCount = 0
    var diffCount = 0
    
    var startIndex = 0
    var dict = [Int: Int]()
    
    for (endIndex, number) in array.enumerated() {
        
        if let index = dict[number], index >= startIndex {
            startIndex = index + 1
        }
        
        maxCount = max(maxCount, endIndex - startIndex + 1)
        dict[number] = endIndex
        
    }
    return maxCount
}

let result = longestSubArray([3,4,5,3,4,5,6,1])


func longestSubArray1(_ array: [Int]) -> Int {
    
    var maxCount = 0
    var minCount = 0
    var diffCountForIncreasiung = 0
    var diffCountForDecreasing = 0
    var counterForIncreasing = 0
    var counterForDecreasing = 0
    
    for index in 0..<array.count-1 {
        
        if array[index+1] > array[index] {
            
            diffCountForDecreasing = counterForDecreasing
            counterForDecreasing = 0
            minCount = 1
            
            
            counterForIncreasing += 1
            if counterForIncreasing == diffCountForIncreasiung {
                maxCount += 1
            }
            else if counterForIncreasing > diffCountForIncreasiung {
                maxCount = 1
            }
        } else if array[index+1] < array[index] {
            diffCountForIncreasiung = counterForIncreasing
            counterForIncreasing = 0
            maxCount = 1
            
            
            counterForDecreasing += 1
            if counterForDecreasing == diffCountForDecreasing {
                minCount += 1
            }
            else if counterForDecreasing > diffCountForDecreasing {
                minCount = 1
            }
        }
    }
    
    return max(maxCount, minCount)
}

let result1 = longestSubArray1([1,4,3,3,2])





func findIncreasingAndDecreasingSubarrays(_ nums: [Int]) -> (increasing: [[Int]], decreasing: [[Int]]) {
    var increasingSubarrays: [[Int]] = []
    var decreasingSubarrays: [[Int]] = []
    
    var increasing: [Int] = []
    var decreasing: [Int] = []
    
    // Helper function to append subarray and reset the array
    func appendSubarray(_ array: inout [Int], to subarrays: inout [[Int]]) {
        if array.count > 1 {
            subarrays.append(array) // [1,4]
        }
        array = []
    }
    
    // Iterate through the array
    for i in 0..<nums.count {
        // Append the current element to the increasing subarray
        increasing.append(nums[i]) // 1,4 // 3 2
        
        // If it's strictly increasing or the last element, append the subarray
        if i == nums.count - 1 || nums[i] >= nums[i + 1] {
            appendSubarray(&increasing, to: &increasingSubarrays)
        }
        
        // Append the current element to the decreasing subarray
        decreasing.append(nums[i]) // 4,3,2
        
        // If it's strictly decreasing or the last element, append the subarray
        if i == nums.count - 1 || nums[i] <= nums[i + 1] {
            appendSubarray(&decreasing, to: &decreasingSubarrays)
        }
    }
    
    return (increasingSubarrays, decreasingSubarrays)
}

// Example usage
//let nums = [1, 2, 3, 2, 1, 4, 5, 6, 3, 2]
let nums = [1,4,3,2]
let (increasing, decreasing) = findIncreasingAndDecreasingSubarrays(nums)
print("Increasing subarrays:", increasing)
print("Decreasing subarrays:", decreasing)
