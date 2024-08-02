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


let binaryTree2 = BinaryTree<Int>()
binaryTree2.insert(3)
binaryTree2.insert(5)
binaryTree2.insert(2)
binaryTree2.insert(1)
binaryTree2.insert(4)
binaryTree2.insert(6)
binaryTree2.insert(7)
binaryTree2.getHeight(root: binaryTree2.root)
