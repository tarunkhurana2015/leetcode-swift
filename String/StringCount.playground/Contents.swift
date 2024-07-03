import UIKit


extension String {
    
    var count: Int {
        var counter = 0
        for value in self.enumerated() {
            counter = value.0 + 1
        }
        return counter
    }
}

extension String {
    
    var count1: Int {
        let array = Array(self)
        return array.count
    }
}


var greeting = "Hello, playground"
greeting.count
greeting.count1
