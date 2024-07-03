import UIKit

var name: Any
name = "Nilesh"
print(name)


// AnyObject can only hold the refernece type
class Employee {
    var name: String?
}

var country: AnyObject
country = Employee()


// Generic enables you to write reusable code.

// Generic vs. Any
// Generic is always type safe

