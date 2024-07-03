import UIKit

func myPow(_ x: Double, _ n: Int) -> Double {
    if n == 0 { return 1 }
    
    var result = myPow(x, n/2)
    result *= result
    
    if n % 2 != 0 {
        result *= x
    }
    
    return result
}

myPow(2.0, 2)
