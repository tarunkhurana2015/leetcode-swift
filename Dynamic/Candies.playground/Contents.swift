/*
 Alice is a kindergarten teacher. She wants to give some candies to the children in her class.  All the children sit in a line and each of them has a rating score according to his or her performance in the class.  Alice wants to give at least 1 candy to each child. If two children sit next to each other, then the one with the higher rating must get more candies. Alice wants to minimize the total number of candies she must buy.

 Example


 She gives the students candy in the following minimal amounts: . She must buy a minimum of 10 candies.

 Function Description

 Complete the candies function in the editor below.

 candies has the following parameter(s):

 int n: the number of children in the class
 int arr[n]: the ratings of each student
 Returns

 int: the minimum number of candies Alice must buy
 */

func candies(arr: [Int]) -> ([Int], Int) {
    
    var candyDict = [Int: Int]() // [index: count]
    
    var prevIndex = 0
    
    for (index, rating) in arr.enumerated() {
        
        candyDict[index] = 1
        var candyPrevCount = candyDict[prevIndex]!
        
        if (prevIndex != index && rating > arr[prevIndex]) {
            candyDict[index] = candyPrevCount + 1
        } else if (prevIndex != index && rating < arr[prevIndex]) {
            
        }
        
        prevIndex = index
    }
    
      let count =   candyDict.reduce(0) {
            $0 + $1.value
        }
    return (candyDict.sorted(by: {$0.key < $1.key}).map {$0.value}, count)
    

}

let count = candies(arr: [4,6,4,5,6,2]) // 1,2,1,2,3,1
print(count)
let coun1 = candies(arr: [3,1,2,2])
print(coun1)
let coun2 = candies(arr: [10,2,4,2,6,1,7,8,9,2,1])
print(coun2)
let coun3 = candies(arr: [8,2,4,3,5,2,6,4,5])
print(coun3)
