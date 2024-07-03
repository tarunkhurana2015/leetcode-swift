import UIKit

// Delegation Pattern
protocol ViewController1Delegate : AnyObject {
    func reload(_ data: String)
}
class ViewController1 {
    weak var delegate: ViewController1Delegate?
    
    func trigger() {
        delegate?.reload("triggered")
    }
    
    deinit {
        print("deinit ViewController1 ")
    }
    
}

class ViewController2: ViewController1Delegate {
    
    func reload(_ data: String) {
        print(data)
    }
    deinit {
        print("deinit ViewController2 ")
    }
    
}

var controller: ViewController1? = ViewController1()
let controller2: ViewController2 = ViewController2()
controller?.delegate = controller2
controller?.trigger()
controller = nil


// closure

struct ViewController3 {
    func performTask( completion: (String) -> ()) {
        completion("done")
    }
}

let controller123 = ViewController3()
controller123.performTask { string in
    print("string")
}
