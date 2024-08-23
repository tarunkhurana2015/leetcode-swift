class TreeNode {
    var left: TreeNode?
    var value: Int
    var right: TreeNode?
    
    init(left: TreeNode? = nil, value: Int, right: TreeNode? = nil) {
        self.left = left
        self.value = value
        self.right = right
    }
}
extension TreeNode:CustomStringConvertible {
    var description: String {
        return "\(String(describing: left)) <- \(value) -> \(String(describing: right))"
    }
}

class BinaryTree: CustomStringConvertible {
    var root: TreeNode?
    
    var description: String {
        return "\(String(describing: root))"
    }
    
    init(root: TreeNode) {
        self.root = root
    }
    
    
    func insertNode(_ value: Int) {
        
        let node = TreeNode(value: value)
        
        if root == nil {
           root = node
            return
        }
        var visitedNode = root
        
        while (visitedNode != nil ) {
            if value <= visitedNode?.value ?? 0 {
                if visitedNode?.left == nil {
                    visitedNode?.left = node
                    visitedNode = visitedNode?.left
                }
                visitedNode = visitedNode?.left
            } else {
                
                if visitedNode?.right == nil {
                    visitedNode?.right = node
                    visitedNode = visitedNode?.right
                }
                visitedNode = visitedNode?.right
            }
        }
        
    }
    
    func preOrderTraversal(_ node: TreeNode?) { //
        var node = node
        if node != nil {
            print(node?.value ?? 0)
            preOrderTraversal(node?.left)
            preOrderTraversal(node?.right)
        }
    }
    
    
    
    func zigzagTraversal(_ root: TreeNode?) {
     
        guard let root = root else { return }
        var result = [[Int]]()
        
        var currentLevel = [TreeNode]()
        var nextLevel = [TreeNode]()
        
        var traverseLeftToRight = false
        
        currentLevel.append(root)
        while !currentLevel.isEmpty {
            var levelResult = [Int]()
            
            while !currentLevel.isEmpty {
                let node = currentLevel.removeLast()
                levelResult.append(node.value)
                
                if traverseLeftToRight {
                    if let left = node.left {
                        nextLevel.append(left)
                    }
                    if let right = node.right {
                        nextLevel.append(right)
                    }
                } else {
                    if let right = node.right {
                        nextLevel.append(right)
                    }
                    if let left = node.left {
                        nextLevel.append(left)
                    }
                }
            }
            
            result.append(levelResult)
            currentLevel = nextLevel
            nextLevel = [TreeNode]()
            traverseLeftToRight.toggle()
        }
      print(result)
    }
    
}

extension BinaryTree {
    
    func size(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let size = size(root.left) + 1 + size(root.right)
        
        
        return size
    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let lDepth = maxDepth(root.left)
        let rDepth = maxDepth(root.right)
        return max(lDepth, rDepth) + 1
    }
    
    func minValue(_ root: TreeNode?) -> Int {
        var node = root
        while node?.left != nil {
            node = node?.left
        }
        return node?.value ?? -1
    }
    
    func maxValue(_ root: TreeNode?) -> Int {
        var node = root
        while node?.right != nil {
            node = node?.right
        }
        return node?.value ?? -1
    }
    
    func isBST(root: TreeNode?) -> Bool {
        guard let root = root else { return true }
               
        if root.left != nil && maxValue(root.left) > root.value {
            return false
        }
        
        if root.right != nil && minValue(root.right) < root.value {
            return false
        }
        
        return isBST(root: root.left) && isBST(root: root.right)
    }
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        return checkHeight(root) != -1
    }
    
    private func checkHeight(_ root: TreeNode?) -> Int {
        if root == nil {
            return -1
        }
        
        let leftHeight = checkHeight(root?.left)
        if leftHeight == -1 {
            return -1
        }
        
        let rightHeight = checkHeight(root?.right)
        if rightHeight == -1 {
            return -1
        }
        
        if abs(leftHeight - rightHeight) > 1 {
            return -1
        } else {
            return max(leftHeight, rightHeight)
        }
        
    }
}




let root = TreeNode(value: 4)
var binaryTree = BinaryTree(root: root)
binaryTree.insertNode(3)
binaryTree.insertNode(8)
binaryTree.insertNode(1)
binaryTree.insertNode(2)
binaryTree.insertNode(6)
binaryTree.insertNode(7)
print(binaryTree)

binaryTree.preOrderTraversal(root)
binaryTree.zigzagTraversal(root)
binaryTree.size(root)
binaryTree.maxDepth(root)
binaryTree.minValue(root)
binaryTree.maxValue(root)
binaryTree.isBST(root: root)
binaryTree.isBalanced(root)

