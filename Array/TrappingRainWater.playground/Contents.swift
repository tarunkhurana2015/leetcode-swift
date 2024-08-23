/*
 Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.
 */

func trap(_ height: [Int]) -> Int {
    
    let n = height.count
    if n == 0 { return 0 }
    
    var leftMax = Array(repeating: 0, count: n)
    var rightMax = Array(repeating: 0, count: n)
    
    leftMax[0] = height[0]
    for i in 1..<n {
        leftMax[i] = max(leftMax[i-1], height[i])
    }
    rightMax[n-1] = height[n-1]
    for i in (0..<n-1).reversed() {
        rightMax[i] = max(rightMax[i+1], height[i])
    }
    
    print(leftMax)
    print(rightMax)
    
    var water = 0
    for i in 0..<n {
        water += min(leftMax[i], rightMax[i]) - height[i]
    }
    
    return water
}

let result = trap([0,1,0,2,1,0,1,3,2,1,2,1])
print(result)

func trap1(_ height: [Int]) -> Int {
    guard height.count > 2 else {
        return 0
    }
    
    var left = 0
    var right = height.count - 1
    var left_max = 0
    var right_max = 0
    var waterTrapped = 0
    
    while left < right {
        if height[left] < height[right] {
            if height[left] >= left_max {
                left_max = height[left]
            } else {
                waterTrapped += left_max - height[left]
            }
            left += 1
        } else {
            if height[right] >= right_max {
                right_max = height[right]
            } else {
                waterTrapped += right_max - height[right]
            }
            right -= 1
        }
    }
    
    return waterTrapped
}
