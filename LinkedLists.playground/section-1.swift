// Playground - noun: a place where people can play

import UIKit

func doSomething<T>(a: T, b: T) {
    
    println("hello")
}

struct Stack <T> {
    
    private var items = [T]()
    
    mutating func push(item: T) {
        self.items.append(item)
    }
    
    mutating func pop() -> T {
        var itemToPop = self.items.last
        self.items.removeLast()
        return itemToPop!
    }
}

// Syntax is of Struct
var myStack = Stack<String>()

myStack.push("Alex")
myStack.push("Stacy")
myStack.push("Stacy's mom")
myStack.pop()
myStack.items

class Node <T> {
    
    var value : T?
    var next : Node?
}

class LinkedList <T: Equatable> {
    
    var head : Node <T>?
    
    func insert(value: T) {
        // First case (0th) if list is empty
        if head == nil {
            var node = Node<T>()
            node.value = value
            node.next = nil
            head = node
            return
        }
        
        // Walking the list...
        var currentNode = head
        while currentNode?.next != nil {
            println("Going to next node...")
            currentNode = currentNode?.next
        }
        
        // Adding new node at end of LinkedList
        var node = Node<T>()
        node.value = value
        node.next = nil
        currentNode?.next = node
    }
    
    func remove(value: T) {
        if head != nil {
            var node = head
            var previousNode : Node<T>? = nil
            while node?.value != value && node?.next != nil {
                // Changed LinkedList to conform to Equatable protocol because of error
                previousNode = node
                node = node?.next
            }
            
            // If the current node is the same value...
            if node?.value == value {
                if node?.next != nil {
                    // Remove current node by unlinking previous node
                    previousNode?.next = nil
                } else {
                    // In essence, making the previous node link into nil
                    previousNode?.next = node?.next
                }
            }
            
        }
    }
}

var node2 = Node<Int>()
node2.value = 200

var node1 = Node<Int>()
node1.value = 100
node2.next = node1

var node394 = Node<Int>()
node394.value = 39400
node1.next = node394

println(node2.value!)

var linkedList = LinkedList<Int>()
linkedList.insert(20)
linkedList.insert(10)

linkedList.remove(20)



/*
// Big O?
class NodeO {
    
    var value : Int
    
    var leftNode : NodeO?
    var rightNode : NodeO?
    
    init(value: Int) {
        self.value = value
    }
    
    func addNode(newNode : NodeO) {
        if newNode.value < self.value {
            
            // if less than, go to the left
            if leftNode == nil {
                self.leftNode = newNode
            } else {
                // recursion
                self.leftNode?.addNode(newNode)
            }
            
        } else if newNode.value > self.value {
            
            // if greater than, go to the right
            if rightNode == nil {
                self.rightNode = newNode
            } else {
                self.rightNode?.addNode(newNode)
            }
        }
    }

}
*/