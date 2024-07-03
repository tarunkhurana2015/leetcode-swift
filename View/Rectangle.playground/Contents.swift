import UIKit

struct Point {
    let x: Int
    let y: Int
}
struct Rectangle {
    let topLeft: Point
    let bottomRight: Point
}

func isRactangleInside(_ inner: Rectangle, _ outer: Rectangle) -> Bool {
    let innerTopLeft = inner.topLeft
    let innerBottomRight = inner.bottomRight
    
    let outerTopLeft = outer.topLeft
    let outerBottomRight = outer.bottomRight
    
    return innerTopLeft.x >= outerTopLeft.x &&
    innerTopLeft.y >= outerTopLeft.y &&
    innerBottomRight.x <= outerBottomRight.x &&
    innerBottomRight.y <= outerBottomRight.y
}
