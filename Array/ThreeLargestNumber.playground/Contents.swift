import UIKit

// Given an array return 3 largest numbers in asc order

func threeLargestNumbers(_ array: [Int]) -> [Int] {
    
    if array.isEmpty {
        return []
    }
    
    var result = Array(repeating: Int.min, count: 3)
    
    for num in array {
        rearrange(number: num, result: &result)
    }
    
    return result
}

func rearrange(number: Int, result: inout [Int]) {
    // Determine the largest number vlaid criteria
    var toBeInsertedIndex = -1
    if number > result[2] {
        toBeInsertedIndex = 2
    } else if number > result[1] {
        toBeInsertedIndex = 1
    } else if number > result[0] {
        toBeInsertedIndex = 0
    } else {
        return
    }
    
    var currentIndex = toBeInsertedIndex
    
    // shifting the result
    while currentIndex > 0 {
        let temp = result[currentIndex - 1]
        result[currentIndex - 1] = result[toBeInsertedIndex]
        currentIndex -= 1
        result[toBeInsertedIndex] = number
    }
    
}

let result = threeLargestNumbers([11,20,34,100,95,99,8,9])
print(result)
