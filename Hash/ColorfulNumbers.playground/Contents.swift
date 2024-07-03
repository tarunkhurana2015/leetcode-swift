import UIKit

func isColorful(_ number: Int) -> Bool {
    
    let digits = Array(String(number).compactMap({$0.wholeNumberValue})) // convert number to Array
    print(digits)
    var products = Set<Int>()
    
    for i in 0..<digits.count {
        var product = 1
        for j in i..<digits.count {
            product *= digits[j]
            if products.contains(product) {
                return false
            }
            products.insert(product)
        }
    }
    
    
    return true
}

isColorful(2631)
