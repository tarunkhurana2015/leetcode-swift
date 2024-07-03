import UIKit

func addBinary(_ a: String, _ b: String) -> String {
    
    let maxLength = max(a.count, b.count)
    var aa = String(repeating: "0", count: maxLength-a.count) + a
    var bb = String(repeating: "0", count: maxLength-b.count) + b
    
    var sum = ""
    var carry = 0
    for index in (0..<maxLength).reversed() {
        
        let int1 = Int(String(aa[aa.index(aa.startIndex, offsetBy: index)])) ?? 0
        let int2 = Int(String(bb[bb.index(bb.startIndex, offsetBy: index)])) ?? 0
        
        var intSum = carry+int1+int2
        
        sum = String(intSum % 2) + sum
        carry = intSum/2
    }
    if carry > 0 {
        sum = String(carry) +  sum
    }
    
    
    return sum
}

let result = addBinary("1010", "1011")
print(result)
