func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
    
    var result: [[Int]] = []
    
    func backtrack(_ start: Int, _ combination: [Int], _ remaining: Int) {
        if combination.count == k {
            if remaining == 0 {
                result.append(combination)
            }
            return
        }
        
        for number in start...9 {
            if number > remaining {
                break
            }
            backtrack(number+1, combination + [number], remaining - number)
        }
        
    }
    backtrack(1, [], n)
    return result
}

print(combinationSum3(3,6))
