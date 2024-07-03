import UIKit

func maxProfit(_ prices: [Int]) -> Int {
    
    var maximumProfit = Int.min
    var minPrice = Int.max
    for (index,price) in prices.enumerated() {
        
        minPrice = min(minPrice, price)
        maximumProfit = max(maximumProfit, price - minPrice)
    }
    
    return maximumProfit
}

maxProfit([7,1,5,3,6,4])
maxProfit([7,6,4,3,1])
