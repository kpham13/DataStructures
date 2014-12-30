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
        println("Removing node with value of: \(value)")
        var nodeToRemove : Node<T>?
        
        if root != nil {
            var node = root
            
            // Locating the node with the desired value to remove
            while value > node?.value && node?.rightNode != nil || value < node?.value && node?.leftNode != nil {
                if value > node?.value {
                    // Moving to the right...
                    node = node?.rightNode
                } else if value < node?.value {
                    // Moving to the left...
                    node = node?.leftNode
                }
            }
            
            // Located node to remove
            var nodeToRemove = node
            var previousNode : Node<T>? = nil
            
            // Locating replacement node
            if node?.rightNode != nil {
                // Move to the right, then...
                node = node?.rightNode
                
                // Case 1
                if node?.leftNode != nil {
                    // Recursion left
                    while node?.leftNode != nil {
                        previousNode = node
                        node = node?.leftNode
                    }
                    
                    // Case 1.1: Change the value of the nodeToRemove to next valid number in binary search tree
                    nodeToRemove?.value = node!.value // Changing the value of a node doesn't require changing the pointers to it
                    
                    // Remove node used to replace value
                    if node?.rightNode != nil {
                        // Case 1.2: If last left child node has a right node, set previousNode's left node to this node
                        previousNode?.leftNode = node?.rightNode
                    } else {
                        // Case 1.3: If no other child nodes exist in subtree, set previousNode's left node to nil
                        previousNode?.leftNode = nil
                    }
                } else {
                    // Case 2: If there are no nodes to the left, take the current node
                    nodeToRemove?.value = node!.value
                    
                    if node?.rightNode != nil {
                        // Case 2.1: If current node has a child...
                        nodeToRemove?.rightNode = node?.rightNode
                    } else {
                        // Case 2.2: Current node has no child
                        nodeToRemove?.rightNode = nil
                    }
                }
                
            } else {
                // Move to the left, then...
                node = node?.leftNode
                
                // Case 3
                if node?.rightNode != nil {
                    // Recursion right
                    while node?.rightNode != nil {
                        previousNode = node
                        node = node?.rightNode
                    }
                    
                    // Case 3.1: Change the value of the nodeToRemove to next valid number in binary search tree
                    nodeToRemove?.value = node!.value
                    
                    // Remove node used to replace value
                    if node?.leftNode != nil {
                        // Case 3.2: Last right child has a left node
                        previousNode?.rightNode = node?.leftNode
                    } else {
                        // Case 3.3: No other child nodes exist in subtree
                        previousNode?.rightNode = nil
                    }
                } else {
                    // Case 4: No nodes to the right
                    nodeToRemove?.value = node!.value
                    
                    if node?.leftNode != nil {
                        // Case 4.1: Current node has a child
                        nodeToRemove?.leftNode = node?.leftNode
                    } else {
                        // Case 4.2: Current node has no child
                        nodeToRemove?.leftNode = nil
                    }
                }
            }
            
        } else {
            println("Binary search tree does not exist.")
        }
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
Traverser.preorderTraversal(bst.root)
Traverser.postorderTraversal(bst.root)
Traverser.inorderTraversal(bst.root)

bst.insert(20)
bst.root

bst.insert(30)

// TODO: Rebalance tree
