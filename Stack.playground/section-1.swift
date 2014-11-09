// Playground - noun: a place where people can play

import UIKit

// Data Structures - Stack
// Stacks are Last In, First Out (LIFO)

class Stack {
    
    var stackArray = [String]()
    
    // Pushing onto stack by adding to the end of array
    func push(stringToPush: String) {
        stackArray.append(stringToPush)
    }
    
    // Popping off the stack by removing the last
    func pop() -> String? {
        if !self.stackArray.isEmpty {
            var stringToReturn = stackArray.last
            stackArray.removeLast()
            return stringToReturn!
        } else {
            return nil
        }
    }
    
    func peek() -> String? {
        if let string = stackArray.last {
            return string
        } else {
            return nil
        }
    }
    
}

var myStack = Stack()
myStack.push("Push")
myStack.push("Pop")
myStack.push("n")
myStack.push("Lock")
myStack.pop()
println(myStack.stackArray)
myStack.peek()