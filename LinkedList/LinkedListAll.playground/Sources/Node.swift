import Foundation

public class Node<Type> {
    
    public var value: Type
    public var next: Node<Type>?
    
    public init(value: Type, next: Node<Type>? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value)" + "->" + "\(next)"
    }
}
