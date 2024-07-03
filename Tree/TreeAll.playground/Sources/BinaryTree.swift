import Foundation

public class BinaryTree<Type> {
    
    public var root: TreeNode<Type>?
    
    public init() {
        self.root = nil
    }
    
    var isEmpty: Bool {
        return root == nil
    }
}

extension BinaryTree: CustomStringConvertible {
    
    public var description: String {
        if isEmpty {
            return "Empty Tree"
        }
        return "\(String(describing: root!))"
    }
}

extension BinaryTree {
    func insertRecursive(_ node: TreeNode<Type>?, _ value: Type) -> TreeNode<Type> {
        guard let node = node else {
            return TreeNode(value: value)
        }
        
        if let nodeValue = node.value as? Int, let value1 = value as? Int {
            if value1 < nodeValue {
                node.left = insertRecursive(node.left, value)
            } else {
                node.right = insertRecursive(node.right, value)
            }
        }
        
        return node
    }
}

extension BinaryTree {
    public func insert(_ value: Type) {
        root = insertRecursive(root, value)
    }
}

extension BinaryTree {
    public func inOrderTraversal(_ node: TreeNode<Type>?) {
        guard let node = node else {
            return
        }
        inOrderTraversal(node.left)
        print(node.value)
        inOrderTraversal(node.right)
    }
}


extension BinaryTree {
    func size(_ node: TreeNode<Type>?) -> Int {
        if node == nil {
            return 0
        } else {
            return size(node?.left) + 1 + size(node?.right)
        }
    }
    public func size() -> Int {
        size(root)
    }
}

extension BinaryTree {
    func maxDepth(_ node: TreeNode<Type>?) -> Int {
        if node == nil {
            return 0
        }
        let lDepth = maxDepth(node?.left)
        let rDepth = maxDepth(node?.right)
        return max(lDepth, rDepth) + 1
    }
    public func maxDepth() -> Int {
        maxDepth(root)
    }
}

extension BinaryTree {
    func minValue(_ node: TreeNode<Type>?) -> Int {
        var current = node
        while current?.left != nil {
            current = current?.left
        }
        return current?.value as! Int
    }
    public func minValue() -> Int {
        minValue(root)
    }
}

extension BinaryTree {
    func maxValue(_ node: TreeNode<Type>?) -> Int {
        var current = node
        while current?.right != nil {
            current = current?.right
        }
        return current?.value as! Int
    }
    public func maxValue() -> Int {
        maxValue(root)
    }
}

extension BinaryTree {
    
    func isBST(_ node: TreeNode<Type>?) -> Bool {
        if node == nil {
            return true
        }
        
        guard let nodeValue = node?.value as? Int else {
            return false
        }
        
        if node?.left != nil && maxValue(node?.left) > nodeValue {
            return false
        }
        
        if node?.right != nil && minValue(node?.right) <= nodeValue {
            return false
        }
        
        return isBST(node?.left) && isBST(node?.right)
        
    }
    public func isBST() -> Bool {
        isBST(root)
    }
    
}
