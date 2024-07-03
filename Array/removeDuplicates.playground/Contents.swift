import UIKit

func removeDuplicates1(_  nums: [Int]) -> [Int] {
    
    var output = [Int]()
    var count = 1
    var outputIndex = 0
    for (index, num) in nums.enumerated() {
                
        if output.count > 0 && num == output[outputIndex-1] && count < 2 {
            count += 1
            output.append(num)
            outputIndex += 1
        } else {
            output.append(num)
            outputIndex += 1
        }
    }
    return output
}

print(removeDuplicates1([1,1,1,2,2,3]))



func removeDuplicates(_ nums: inout [Int]) -> Int {
        
    var k: Int = 1
    var count = 1
    for (index, num) in nums.enumerated() {
        if index < nums.count-1 && nums[index] == nums[index+1] {
            if count < 2 {
                 k += 1
            } else {
                nums[index+1] = -1
            }
            count += 1
        } else {
            k += 1
            count = 1
        }
    }
    nums = nums.filter{ $0 != -1}
    return k
}

var nums = [0,0,1,1,1,1,2,3,3]
let result = removeDuplicates(&nums)
(0..<result).forEach { index in
    print(nums[index])
}

