/*
 You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

 Find two lines that together with the x-axis form a container, such that the container contains the most water.

 Return the maximum amount of water a container can store.

 Notice that you may not slant the container.
 */


func maxArea(_ height: [Int]) -> Int {
    
    var firstIndex = 0
    var maxHeight = 0
    
    var secondIndex = 1
    var secondHeight = 1
    
    for index in 0..<height.count {
        
        if height[index] > maxHeight {
            maxHeight = height[index]
            firstIndex = index
        } else {
            if height[height.count-1] >= maxHeight {
                secondIndex = height.count - 1
                secondHeight = maxHeight
                break
            }
            else if height[index] >= secondHeight && height[index] < maxHeight {
                secondHeight = height[index]
                secondIndex = index
            }
        }
    }
    
    print(secondIndex)
    print(firstIndex)
    return (secondIndex - firstIndex) * min(secondHeight, maxHeight)
}

//print(maxArea([1,8,6,2,5,4,8,3,7]))
//print(maxArea([1,1]))
//print(maxArea([4,3,2,1,4]))
print(maxArea([1,2,1]))



func maxArea1(_ height: [Int]) -> Int {
    
    var left = 0
    var right = height.count-1
    var maxArea = 0
    
    while left < right {
        let width = right - left
        let area = min(height[left], height[right]) * width
        maxArea = max(maxArea, area)
        
        if height[left] < height[right] {
            left += 1
        } else {
            right -= 1
        }
    }
    
    return maxArea
}
print(maxArea1([1,8,6,2,5,4,8,3,7]))
print(maxArea1([1,1]))
print(maxArea1([4,3,2,1,4]))
print(maxArea1([1,2,1]))
