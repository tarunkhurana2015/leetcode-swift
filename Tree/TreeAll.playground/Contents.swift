import UIKit

let binaryTree1 = BinaryTree<Int>()
binaryTree1.insert(5)
binaryTree1.insert(3)
binaryTree1.insert(7)
binaryTree1.insert(2)
binaryTree1.insert(4)
binaryTree1.insert(6)
binaryTree1.insert(8)
binaryTree1.insert(9)
binaryTree1.insert(10)
binaryTree1.insert(11)

print(binaryTree1)
binaryTree1.inOrderTraversal(binaryTree1.root)

print(binaryTree1.size())

print(binaryTree1.maxDepth())

print(binaryTree1.minValue())

print(binaryTree1.isBST())
