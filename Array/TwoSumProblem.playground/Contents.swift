import UIKit

func TwoSumProblem(_ input: [Int], target: Int) -> Int {
    var count = 0
    
    // Approach 1
    for (index1, input1) in input.enumerated() {
        for (index2, input2) in input.enumerated() {
            if target == input[index1] + input[index2] {
                count += 1
                print("(\(input1), \(input2))")
            }
        }
    }
    return count
    
}


TwoSumProblem([2,1,8,9], target: 10)

print("*************************************")

func TwoSumProblem2(_ input: [Int], target: Int) -> Int {
    var count = 0
    var dict = [Int: Int]()
    
    // Approach 1
    for number in input {
        let diff = target - number
        if let _ = dict[diff] {
            count += 1
            print("(\(number), \(diff))")
        }
        dict[number] = number
    }
    
    return count
    
}

TwoSumProblem2([2,1,8,9], target: 10)
print("*************************************")

// easiest solution
func TwoSumProblem22(_ input: [Int], target: Int) -> Int {
    var dict = [Int: Int]()
    var count = 0
    
    for (index, number) in input.enumerated() {
        if let otherIndex = dict[target - number], otherIndex != index {
            print("(\(input[index]), \(input[otherIndex]))")
            count += 1
        }
        dict[number] = index
    }
    return count
}

//
TwoSumProblem22([1,2,3,4,5], target: 6)

print("*************************************")

func TwoSumProblem3(_ input: [Int], target: Int) -> Int {
    var count = 0
    let sortedInput = input.sorted()
    
    // Approach 1
    var left = 0
    var right = sortedInput.count - 1
    while left < right {
        if left != 0 && sortedInput[left] == sortedInput[left-1] {
            left += 1
            continue
        }
        let sum = sortedInput[left] + sortedInput[right]
        if sum == target {
            print("(\(sortedInput[left]), \(sortedInput[right]))")
            left += 1
            right -= 1
            count += 1
        } else if sum > target {
            right -= 1
        } else {
            left += 1
        }
    }
    
    return count
    
}

//
TwoSumProblem3([1,1,1,2,0], target: 2)
