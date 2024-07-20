import UIKit

func minimumSwaps(arr: [Int]) -> Int {
    var arr = arr
    var swaps = 0
    var indexDict = [Int: Int]()
    
    for i in 0..<arr.count {
        indexDict[arr[i]] = i // [4:0, 3:1, 1:2, 2:3]
    }
    
    for i in 0..<arr.count {
        if arr[i] != i + 1 {
            let correctedValueIndex = indexDict[i+1] // i=0; (i+1) = 2
            
            indexDict[arr[i]] = correctedValueIndex //[4:2]
            indexDict[i + 1] = i // [1:0]
            
            arr.swapAt(i, correctedValueIndex ?? 0) // (0,2)
            
            swaps += 1
        }
    }
    
    return swaps
}

let array = [4,3,1,2]
print(minimumSwaps(arr: array))
