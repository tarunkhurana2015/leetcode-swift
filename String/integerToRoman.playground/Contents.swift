import UIKit

func integerToRoman(_ num: Int) -> String {
    
    let romanValues: [(Int, String)] = [
        (100, "C"), (90, "XC"), (50, "L"), (40, "XL"),
        (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
    ]
    
    var result = ""
    var remaining = num
    
    for (value, symbol) in romanValues {
        if remaining >= value {
            result += symbol
            remaining -= value
        }
    }
    
    return result
}

integerToRoman(50)
