//////////////////////////////////////////
// Data Structures - Binary Search Tree //
//////////////////////////////////////////

// Hierarchical structure with root node, subtrees, and children/leaf nodes.
// Ordered or sorted binary tree (specialized type of tree, where each node has at most two children.
// The left subtree of a node contains only nodes with keys less than the node's key.
// The right subtree of a node contains only nodes with keys greater than the node's key.
// The left and right subtree each must be a binary search tree.
// Each node can have up to two successor nodes.
// There must be no duplicate nodes.
// A unique path exists from the root to every other node.
// O(log n)

import Foundation

class Node<T: Comparable> {
    
    var value : T
    var leftNode : Node?
    var rightNode : Node?
    
    init(value: T) {
        self.value = value
    }
    
}

class BinarySearchTree<T: Comparable> {
    
    var root : Node<T>?
    
    func insert(value: T) {
        var newNode = Node(value: value)
        
        // If root does not exist, set as root
        if root == nil {
            self.root = newNode
        } else {
            var currentNode = self.root
            
            // Recursion
            while newNode.value > currentNode?.value && currentNode?.rightNode != nil || newNode.value < currentNode?.value && currentNode?.leftNode != nil {
                if value > currentNode?.value {
                    // Moving to the right...
                    currentNode = currentNode?.rightNode
                } else if value < currentNode?.value {
                    // Moving to the left...
                    currentNode = currentNode?.leftNode
                }
            }
            
            if newNode.value > currentNode?.value {
                // Setting the right node...
                currentNode?.rightNode = newNode
            } else if newNode.value < currentNode?.value {
                // Setting the left node...
                currentNode?.leftNode = newNode
            } else {
                println("This node already exists.")
            }
        }
    }
    
    func remove(value: T) {
        var node = Node(value: value)
        
        // Check to see if node is root node
        // What do I do here if there's a left and right node
        // if only left, change that node to root.  If only right, vice versa.
        
        // Rebalance node tree
    }
    
    var description : String {
        return Traverser.inorderTraversal(self.root)
    }

}

class Traverser<T: Comparable> {
    
    class func preorderTraversal(node: Node<T>?) -> String {
        var string = ""
        if node != nil {
            string += "\(node!.value) "
            string += preorderTraversal(node?.leftNode)
            string += preorderTraversal(node?.rightNode)
        }
        
        return string
    }
    
    class func postorderTraversal(node: Node<T>?) -> String {
        var string = ""
        if node != nil {
            string += preorderTraversal(node?.leftNode)
            string += preorderTraversal(node?.rightNode)
            string += "\(node!.value) "
        }
        
        return string
    }
    
    class func inorderTraversal(node: Node<T>?) -> String {
        var string = ""
        if node != nil {
            string += preorderTraversal(node?.leftNode)
            string += "\(node!.value) "
            string += preorderTraversal(node?.rightNode)
        }
        
        return string
    }
}

var bst = BinarySearchTree<Int>()

bst.insert(30)
bst.root

bst.insert(10)
bst.root

bst.insert(50)
bst.root

bst.description
Traverser.inorderTraversal(bst.root)

bst.insert(20)
bst.root

bst.insert(30)

