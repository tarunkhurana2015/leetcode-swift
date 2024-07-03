import UIKit

func multiply(_ a: String, _ b: String) -> String {
    
    let maxCount = max(a.count, b.count)
    var aa = a
    var bb = b 
    
    var additionArray = [String]()
    
    for indexbb in (0..<bb.count).reversed() {
        let intbb = Int(String(bb[bb.index(bb.startIndex, offsetBy: indexbb)])) ?? 0
        var result = ""
        var carry = 0
        for indexaa in (0..<aa.count).reversed() {
            let intaa = Int(String(aa[aa.index(aa.startIndex, offsetBy: indexaa)])) ?? 0
            let multiply = carry + ( intaa * intbb )
            result = String(multiply % 10) + result
            carry = multiply / 10
        }
        if carry > 0 {
            result = String(carry) + result
        }
        additionArray.append(result + String(repeating: "0", count: (bb.count - indexbb-1)))
        print(additionArray)
    }
    return aVeryBigSum(additionArray)
}

func aVeryBigSum(_ array: [String]) -> String {
    
    var arrayString = array
    let maxString = arrayString.max(by: {$1.count > $0.count})
    let maxLength = maxString?.count
    print(maxLength!)
    
    for i in 0..<arrayString.count { // O(n)
        arrayString[i] = String(repeating: "0", count: maxLength! - arrayString[i].count) + arrayString[i]
    }
    print(arrayString)
        
    var sum = ""
    var carry = 0
    for i in (0..<maxLength!).reversed() {
        var digitSum = 0
        for str in arrayString {
            let digit = Int(String(str[str.index(str.startIndex, offsetBy: i)])) ?? 0
            digitSum = digitSum + digit
        }
        digitSum = digitSum + carry
        sum = String(digitSum % 10) + sum
        carry = digitSum / 10
    }
    if carry > 0 {
        sum = String(carry) + sum
    }
    
    return sum
}



print(multiply("9133", "0"))
