import UIKit

/*
 Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

  

 Example 1:

 Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].
 */

struct Interval {
    var start: Int
    var end: Int
    
    init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
    
    
}

extension Interval: CustomStringConvertible {
    var description: String {
        String("(\(start), \(end))")
    }
}

func mergeIntervals(_ matrix: [Interval]) -> [Interval] {
    
    var result = [Interval]()

    // sort the intervals based on the start time
    let sortedIntervals = matrix.sorted { $0.start < $1.start }
    
    print(sortedIntervals)
    
    var currentInterval = sortedIntervals[0]
    
    for i in 1..<sortedIntervals.count {
        let interval = sortedIntervals[i]
        if interval.start <= currentInterval.end {
            currentInterval.end = max(currentInterval.end, interval.end)
        } else {
            result.append(currentInterval)
            currentInterval = interval
        }
    }
    
    result.append(currentInterval)
    
    
    
    return result
}


let intervals = [
    Interval(1, 3),
    Interval(2, 6),
    Interval(8, 10),
    Interval(15, 18)
]
print(mergeIntervals(intervals))
