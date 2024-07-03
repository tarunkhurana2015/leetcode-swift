import UIKit

func fib(_ n: Int) -> Int {
    guard n > 2 else { return n }
    return fib(n-1) + fib(n-2)
}

fib(5) // 1 1 2 3 5 8 13

func fibIterative(_ n: Int) -> Int {
    var a = 1
    var b = 1
    guard n > 1 else { return a }
    
    (2...n).forEach { _ in
        (a,b) = (a+b, a)
    }
    return a
}
let result = fibIterative(5)
print(result)
