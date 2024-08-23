import UIKit

func subArrySumEqualsK(_ array: [Int], _ k: Int) -> Int {
    
    var count: Int = 0
    
    var sum = 0
    
    for index in 0..<array.count {
        sum = 0
        for currentIndex in index..<array.count {
            sum += array[currentIndex]
            if sum == k {
                count += 1
            }
        }
    }
    
    return count
}

let array = [1,2,3,4,9]
let count = subArrySumEqualsK(array, 10)




func subArrySumEqualsK1(_ array: [Int], _ k: Int) -> Int {
    
    var count: Int = 0
    var sum = 0
    var sumFreq: [Int: Int] = [0:1]
    
    for num in array {
        sum += num
        let diff = sum - k
        if let freq = sumFreq[diff] {
            count += freq
        }
        sumFreq[sum, default: 0] += 1
        print(sumFreq)
    }
    
    return count
}

//let count1 = subArrySumEqualsK1(array, 10)
subArrySumEqualsK1([1,2,3,4], 5)

/*
 
 [1,2,3]
 k = 3
 
 sum = 0
 sumFreq = [0:1]
 count = 0
 
 sum = 1
 (sum - k) = -2 {-}
 sumFreq = [0:1, 1:1]
 count = 0
 
 sum = 3
 (sum - k) = 0 { count = 1 }
 sumFreq = [0:1, 1:1, 3:1]
 
 sum = 6
 (sum - k) = 3 { count = 2 }
 sumFeq = [0:1, 1:1, 3:1, 6:1]
*/
