import UIKit

func quickSort(_ array: [Int], low: Int, high: Int) {
    var i = low
    var j = high
    var tempArray = array
    
    var x = array[(i+j)/2]
    
    repeat {
        while array[i] < x { i += 1 }
        while array[j] > x { j -= 1 }
        if i <= j {
            var temp = tempArray[i]
            tempArray[i] = tempArray[j]
            tempArray[j] = temp
            i += 1
            j -= 1
        }
    } while i <= j
    
    if low < j {
        quickSort(tempArray, low: low, high: j)
    }
    if i < high {
        quickSort(tempArray, low: i, high: high)
    }
}

//quickSort([6,3,4,2,9,0,8,1,7,5], low: 0, high: 9)

func quickSort1(_ array: [Int]) -> [Int] {
    var less =  [Int]()
    var greater =  [Int]()
    var equal =  [Int]()
    
    if array.count > 1 {
        let pivot = array[array.count/2]
        for number in array {
            if number > pivot {
                greater.append(number)
            } else if number < pivot {
                less.append(number)
            } else {
                equal.append(number)
            }
        }
        return quickSort1(less) + equal + quickSort1(greater)
    }
    return array
}
quickSort1([6,3,4,2,9,0,8,1,7,5])
