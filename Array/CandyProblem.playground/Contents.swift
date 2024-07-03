import UIKit

func candy(_ ratings: [Int]) -> Int {
    
    var candyDict = [Int: Int]() // rating: count
    
    var prevIndex = 0
    for (index, rating) in ratings.enumerated() {
        
        candyDict[index] = 1
        let prevCandyCount = candyDict[prevIndex]!
        
        if prevIndex != index && rating > ratings[prevIndex] {
            candyDict[index] = prevCandyCount + 1
        } else if prevIndex != index && rating < ratings[prevIndex] {
            if candyDict[prevIndex]! <= candyDict[index]!  {
                candyDict[prevIndex] = prevCandyCount + 1
            }
        }
        
        prevIndex = index
        
        
    }
    
    return candyDict.reduce(0) {
        $0 + $1.value
    }
}

print(candy([1,2,0,3,2]))
print(candy([1,0,2]))
print(candy([1,2,2]))
