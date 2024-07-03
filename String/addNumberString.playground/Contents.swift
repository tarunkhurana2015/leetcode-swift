import UIKit

func addNumberString(_ num1: String, num2: String) -> String {
    
    var result = ""
    var carry = 0
    var i = num1.count - 1  // 4 - 1 = 3
    var j = num2.count - 1  // 3 - 1 = 2
    
    while i >= 0 || j >= 0 || carry > 0 {
        let digit1 = i >= 0 ? Int(String(num1[num1.index(num1.startIndex, offsetBy: i)]))! : 0
        print(digit1)
        let digit2 = j >= 0 ? Int(String(num2[num2.index(num2.startIndex, offsetBy: j)]))! : 0
        print(digit2)
        
        let sum = digit1 + digit2 + carry
        result = String(sum % 10) + result
        carry = sum / 10
        
        i -= 1
        j -= 1
    }
    
    return result
}

addNumberString("1112", num2: "997")


func addNumberStringNew(_ num1: String, num2: String) -> String {
    
    // Add padding "0", if the count does not match
    let maxLength = max(num1.count, num2.count)
    let adjustedNum1 = String(repeating: "0", count: maxLength - num1.count) + num1
    let adjustedNum2 = String(repeating: "0", count: maxLength - num2.count) + num2
    
    // Add the numbers
    var sum = ""
    var carry = 0
    for i in (0..<maxLength).reversed() {
        let digit1 = Int(String(adjustedNum1[adjustedNum1.index(adjustedNum1.startIndex, offsetBy: i)])) ?? 0
        let digit2 = Int(String(adjustedNum2[adjustedNum2.index(adjustedNum2.startIndex, offsetBy: i)])) ?? 0
        let digitSum = digit1 + digit2 + carry
        sum = String(digitSum % 10) + sum
        carry = digitSum / 10
    }
    
    if carry > 0 {
        sum = String(carry) + sum
    }
    
    return sum
}

addNumberStringNew("1112", num2: "997")


func aVeryBigSum(_ array: [Int]) -> Int {
    
    var arrayString = array.map({ "\($0)" }) // O(n)
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
    
    return Int(sum) ?? 0
}
let arr = [1000000001, 1000000002, 1000000003, 1000000004, 1000000005]
//let arr = [88, 990]
print(aVeryBigSum(arr))


func addDecimalString(_ num1: String, num2: String) -> String {
    
    // Separte the integer and decimal
    let components1 = num1.components(separatedBy: ".")
    let components2 = num2.components(separatedBy: ".")
    
    var intergerPart1 = components1.first ?? "0"
    var decimalPart1 = components1.count > 1 ? components1[1] : ""
    
    var intergerPart2 = components2.first ?? "0"
    var decimalPart2 = components2.count > 1 ? components2[1] : ""
    
    var sum = ""
    var carry = 0
    
    // pad the decimal with the zeros to make them equal in length; the padding of 0 goes after the number
    let decimalMaxLength = max(decimalPart1.count, decimalPart2.count)
    decimalPart1 = decimalPart1 + String(repeating: "0", count: decimalMaxLength - decimalPart1.count)
    decimalPart2 = decimalPart2 + String(repeating: "0", count: decimalMaxLength - decimalPart2.count)
    
    for i in (0..<decimalMaxLength).reversed() {
        let digit1 = Int(String(decimalPart1[decimalPart1.index(decimalPart1.startIndex, offsetBy: i)])) ?? 0
        let digit2 = Int(String(decimalPart2[decimalPart2.index(decimalPart2.startIndex, offsetBy: i)])) ?? 0
        let digitSum = digit1 + digit2 + carry
        sum = String(digitSum % 10) + sum
        carry = digitSum / 10
    }
    
    // pad the decimal with the zeros to make them equal in length; the padding of 0 goes before the number
    let integerMaxLength = max(intergerPart1.count, intergerPart2.count)
    intergerPart1 = String(repeating: "0", count: integerMaxLength - intergerPart1.count) + intergerPart1
    intergerPart2 = String(repeating: "0", count: integerMaxLength - intergerPart2.count) + intergerPart2
    
    for i in (0..<integerMaxLength).reversed() {
        let digit1 = Int(String(intergerPart1[intergerPart1.index(intergerPart1.startIndex, offsetBy: i)])) ?? 0
        let digit2 = Int(String(intergerPart2[intergerPart2.index(intergerPart2.startIndex, offsetBy: i)])) ?? 0
        let digitSum = digit1 + digit2 + carry
        sum = String(digitSum % 10) + sum
        carry = digitSum / 10
    }
    
    if carry > 0 {
        sum = String(carry) + sum
    }
    
    let decimalIndex = sum.index(sum.endIndex, offsetBy: -decimalMaxLength)
    sum.insert(".", at: decimalIndex)
    
    
    return sum
}

addDecimalString("12.89", num2: "65.201")
