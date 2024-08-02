func maxSubsetSum(arr: [Int]) -> Int {
    
    var currentSum = arr[0]
    var maxSum = arr[0]
    
    for i in 1..<arr.count {
        currentSum = max(arr[i], currentSum+arr[i])
        maxSum = max(maxSum, currentSum)
    }
    
    return maxSum
}

let nums1 = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
maxSubsetSum(arr: nums1)

let nums2 = [-2,1,3,-4,5]
maxSubsetSum(arr: nums2)

let nums3 = [3,7,4,6,5]
maxSubsetSum(arr: nums3)


func maxSubsetSumNonAdjacent(arr: [Int]) -> Int {
    
    if arr.isEmpty {
        return 0
    }
    
    if arr.count == 1 {
        return max(0, arr[0])
    }
    
    // initialize the dp array
    var dp = Array(repeating: 0, count: arr.count)
    dp[0] = max(0, arr[0])
    dp[1] = max(dp[0], arr[1])
    
    // fill the dp array
    for i in 2..<arr.count {
        dp[i] = max(dp[i-1], arr[i] + dp[i-2])
    }
    
    return dp[arr.count - 1]
}

maxSubsetSumNonAdjacent(arr: [3,7,4,6,5])
maxSubsetSumNonAdjacent(arr: [2,1,5,8,4])
maxSubsetSumNonAdjacent(arr: [3,5,-7,8,10])
