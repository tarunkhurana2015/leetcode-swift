import Foundation

public class TreeNode<Type> {
    var value: Type
    var left: TreeNode?
    var right: TreeNode?
    
    public init(value: Type, left: TreeNode? = nil, right: TreeNode? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

extension TreeNode: CustomStringConvertible {
    
    public var description: String {
        return "\(String(describing: left)) <- \(value) -> \(String(describing: right))"
    }
}

