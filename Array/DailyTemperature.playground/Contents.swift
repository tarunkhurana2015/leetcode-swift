/*
 Given an array of integers temperatures represents the daily temperatures, return an array answer such that answer[i] is the number of days you have to wait after the ith day to get a warmer temperature. If there is no future day for which this is possible, keep answer[i] == 0 instead.
 
 Example 1:

 Input: temperatures = [73,74,75,71,69,72,76,73]
 Output: [1,1,4,2,1,1,0,0]
 Example 2:

 Input: temperatures = [30,40,50,60]
 Output: [1,1,1,0]
 Example 3:

 Input: temperatures = [30,60,90]
 Output: [1,1,0]
 */

func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
    
    var answer = Array(repeating: 0, count: temperatures.count)
    var stack = [(Int, Int)]()
            
    for index in 0..<temperatures.count {
        
        while let last = stack.last, temperatures[index] > last.0 {
            stack.popLast()
            answer[last.1] = (index - last.1)
        }
        
        stack.append((temperatures[index], index))
    }    
    
    return answer
}

let result = dailyTemperatures([73,74,75,71,69,72,76,73])
print(result)
