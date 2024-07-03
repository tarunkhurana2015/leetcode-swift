import UIKit

func findFlavors(prices: [Int], money: Int) -> (Int, Int) {
    var flavorsIndices = [Int: Int]() // Dictionary of price->flavor //
    
    for (flavorIndex1, price) in prices.enumerated() { // 0, 1 | (1, 4) | (2,5) | (3,3)
        let remainingBalance = money - price // 3 0 -1 1
        if let flavorIndex2 = flavorsIndices[remainingBalance] { // nil nil nil [1,0]
            return (flavorIndex2 + 1,flavorIndex1 + 1)
        }
        flavorsIndices[price] = flavorIndex1 // [1,0] [4,1] [5,2]
    }
    
    return (-1,-1)
}


let prices = [1,4,5,3,2]
let money = 4
let (flavors1, flavors2) = findFlavors(prices: prices, money: money) // 4,1
print(flavors1)
print(flavors2)
