import UIKit

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    
    var totalGas = 0
    var totalCost = 0
    var tank = 0
    var startStation = 0
    
    for i in 0..<gas.count {
        totalGas += gas[i]
        totalCost += cost[i]
        tank += gas[i] - cost[i]
        
        if tank < 0 {
            tank = 0
            startStation = i + 1
        }
    }
    
    return totalGas >= totalCost ? startStation : -1
}

let gas = [1,2,3,5,4]
let cost = [3,4,5,2,1]
print(canCompleteCircuit(gas, cost))
