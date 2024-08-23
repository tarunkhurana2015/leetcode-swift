
/*
 Design a data structure that supports adding numbers from a stream and finding the median of the added numbers.
 */


extension Array where Element: Comparable {
    
    func insertionIndex(_ value: Int) -> Int {
        var low = 0
        var high = self.count - 1
        
        while low <= high {
            let mid = (low+high)/2
            if self[low] > self[mid] {
                low = mid + 1
            } else if self[low] > self[mid] {
                low = mid - 1
            } else {
                return mid
            }
        }
        return low
    }
}
struct MedianFinder {
    
    var numbers = [Int]()
    
    mutating func addNum(num: Int) {
        let index = numbers.insertionIndex(num)
        numbers.insert(num, at: index)
    }
    func median() -> Float {
        
        let index = numbers.count / 2
        if numbers.count % 2 == 0 {
            return (Float(numbers[index]) + Float(numbers[index-1]))/2
        } else {
            return Float(numbers[index])
        }
    }
}

var mf = MedianFinder()
mf.addNum(num: 1)
mf.addNum(num: 2)
print(mf.median())
mf.addNum(num: 3)
print(mf.median())

