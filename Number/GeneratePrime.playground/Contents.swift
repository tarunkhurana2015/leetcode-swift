import UIKit

func generarePrime(for limit: Int) -> [Int] {
    
    guard limit > 1 else {return [] }
    
    var map = Array(repeating: true, count: limit+1)
    map[0] = false
    map[1] = false
    
    var primes = [Int]()
    
    for number in 2...limit {
        if map[number] {
            primes.append(number)
            
            
            var multiple = number * number
            while multiple <= limit {
                map[multiple] = false
                multiple += number
            }
            
            
        }
        
    }
    return primes
}
 
let result = generarePrime(for: 16)
print(result)
