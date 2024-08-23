import UIKit

/*
Symbol    Value
I    1
V    5
X    10
L    50
C    100
D    500
M    1000
 
 If the value does not start with 4 or 9, select the symbol of the maximal value that can be subtracted from the input, append that symbol to the result, subtract its value, and convert the remainder to a Roman numeral.
 
 If the value starts with 4 or 9 use the subtractive form representing one symbol subtracted from the following symbol, for example, 4 is 1 (I) less than 5 (V): IV and 9 is 1 (I) less than 10 (X): IX. Only the following subtractive forms are used: 4 (IV), 9 (IX), 40 (XL), 90 (XC), 400 (CD) and 900 (CM).
*/

func integerToRoman(_ num: Int) -> String {
    
    let romanValues: [(Int, String)] = [
        (1000, "M"),
        (900, "CM"),
        (500, "D"),
        (400, "CD"),
        (100, "C"),
        (90, "XC"),
        (50, "L"),
        (40, "XL"),
        (10, "X"),
        (9, "IX"),
        (5, "V"),
        (4, "IV"),
        (1, "I")
    ]
    
    var result = ""
    var remaining = num
    
    for (index, (value, symbol)) in romanValues.enumerated() {
        while remaining >= value {
//            print("remaining - \(remaining) \(result)")
//            if (remaining / value == 4 || remaining / value == 9) && index-1 > 0 {
//                result += symbol
//                result += romanValues[index-1].1
//                remaining -= (romanValues[index-1].0 - value)
//            } else if remaining == 9 {
//                remaining = 0
//                result += "IX"
//            } else if remaining == 4 {
//                remaining = 0
//                result += "IV"
//            }
//            else {
                result += symbol
                remaining -= value
//            }
        }
    }
    print("final -  \(result)")
    return result
}

integerToRoman(1994)
/*
 3000 = MMM as 1000 (M) + 1000 (M) + 1000 (M)
  700 = DCC as 500 (D) + 100 (C) + 100 (C)
   40 = XL as 10 (X) less of 50 (L)
    9 = IX as 1 (I) less of 10 (X)
 Note: 49 is not 1 (I) less of 50 (L) because the conversion is based on decimal places
 */
