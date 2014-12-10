//////////////////////////////////
// Data Structures - Hash Table //
//////////////////////////////////

// Hash tables are data structures that can map keys to values.
// The key component to a hash table is a hash function. Given a key, the hash function computes an index to store the values in a backing array.
// On average, hash tables have an O(1) constant time look up.
// Ideally the hash function will assign each key to a unique index, but usually in practice you have collisions that are handled by linked lists.

import Foundation

class Node {
    
    var key : String?
    var value : String?
    var next : Node?
    
}

class HashTable {
    
    var size : Int?
    var bucketArray = [Node]() // Initializes backing array
    var filledBuckets : Float = 0 // For dynamic resizing of hash table
    
    // Creating the bucket array
    init(size: Int) {
        self.size = size
        for index in 0..<size {
            var node = Node()
            self.bucketArray.append(node)
        }
    }
    
    // Hash function
    func hash(key: String) -> Int {
        var total = 0
        for character in key.unicodeScalars {
            var asc = Int(character.value)
            total += asc
        }
        
        // Returns index of bucket array using modulus operator
        return total % self.size!
    }
    
    func setValue(value: String, key: String) {
        var node = Node()
        node.key = key
        node.value = value
        node.next = nil
        
        // Dynamic resizing
        self.filledBuckets++ // Increases bucket count
        if self.filledBuckets >= Float(self.bucketArray.count) * 0.7 {
            // At 70% threshold, create a empty array
            var newBucketArray = [Node]()
            // Double the size of current array
            for index in 0..<self.size! * 2 {
                var node = Node()
                newBucketArray.append(node)
            }
            
            // Update hash table size
            self.size = newBucketArray.count
            
            // Migrate nodes from smaller array to larger array
            for headNode in self.bucketArray {
                if headNode.value != nil {
                    var newIndex = self.hash(headNode.key!)
                    var newNode = Node()
                    //println("Head node: \(headNode.value!)")
                    newNode.value = headNode.value
                    newNode.key = headNode.key
                    newNode.next = headNode.next
                    newBucketArray[newIndex] = newNode
                    
                    var currentNode = headNode
                    while currentNode.next != nil {
                        currentNode = currentNode.next!
                        var linkedIndex = self.hash(currentNode.key!)
                        var linkedNode = Node()
                        linkedNode.value = currentNode.value
                        linkedNode.key = currentNode.key
                        linkedNode.next = currentNode.next
                        newBucketArray[linkedIndex] = linkedNode
                    }
                }
            }
            
            // Replace the smaller array with the larger array
            self.bucketArray = newBucketArray
        }
        
        // Hash function to determine index
        var index = self.hash(key)
        if self.bucketArray[index].value == nil {
            //println(index)
            //println(self.bucketArray[index].key)
            self.bucketArray[index] = node // Sets node at hashed index of bucketArray
        } else {
            // Handling collisions
            // Set the next pointer of current node to head node
            var headNode = self.bucketArray[index]
            node.next = headNode
            
            /* Alternative method
            // Walk the linked list when head exists at bucketArray
            var currentNode = self.bucketArray[index]
            while currentNode.next != nil {
                currentNode = currentNode.next!
            }
            
            // Add node to end of linked list
            currentNode.next = node
            */
        }
    }
    
    func removeObjectForKey(key: String) {
        var index = self.hash(key)
        var node = self.bucketArray[index]
        var previousNode : Node? = nil
        
        // If node at index exists
        if node.value != nil {
            
            // Walk the list. Break loop if keys match or reach end of linked list.
            while node.key != key && node.next != nil {
                previousNode = node
                //node = node?.next
            }
            
            // If the current node is the same value...
            if node.key == key {
                if node.key == self.bucketArray[index].key && node.next == nil { // HEAD ONLY
                    self.bucketArray[index] = nil
                } else if node.key == self.bucketArray[index].key { // HEAD+
                    self.bucketArray[index] = node.next
                } else if node.next == nil { // TAIL
                    previousNode?.next = nil
                } else {
                    previousNode?.next = node.next
                }
            }
        }
        
        self.filledBuckets--
    }
    
}

var hashTable = HashTable(size: 2)

hashTable.size!
hashTable.bucketArray[0].key
hashTable.bucketArray[1].key

hashTable.hash("Brad")
hashTable.setValue("bradleyjohnson@bradleyjohnson.com", key: "Brad")
hashTable.size!
hashTable.bucketArray[0].key
hashTable.bucketArray[1].key

hashTable.hash("John")
hashTable.setValue("johnnyclemson@johnclem.com", key: "John")
hashTable.size!
hashTable.bucketArray[0].key
hashTable.bucketArray[1].key
hashTable.bucketArray[2].key
hashTable.bucketArray[3].key

hashTable.hash("Brad")
hashTable.hash("John")
hashTable.hash("Kevin")
hashTable.setValue("kevin@kevinpham.com", key: "Kevin")
hashTable.size!
hashTable.bucketArray[0].value
hashTable.bucketArray[1].value
hashTable.bucketArray[2].value
hashTable.bucketArray[3].value
hashTable.bucketArray[4].value
hashTable.bucketArray[5].value
hashTable.bucketArray[6].value
hashTable.bucketArray[7].value

hashTable.hash("Brad")
hashTable.hash("John")
hashTable.hash("Kevin")
hashTable.hash("Richard")
hashTable.setValue("richard@richardsherman.com", key: "Richard")
hashTable.size!
hashTable.bucketArray[0].value
hashTable.bucketArray[1].value
hashTable.bucketArray[2].value
hashTable.bucketArray[3].value
hashTable.bucketArray[4].value
hashTable.bucketArray[5].value
hashTable.bucketArray[6].value
hashTable.bucketArray[7].value

hashTable.hash("Russell")
hashTable.setValue("dangeruss@russellwilson.com", key: "Russell")
hashTable.bucketArray[0].value
hashTable.bucketArray[1].value
hashTable.bucketArray[2].value
hashTable.bucketArray[3].value
hashTable.bucketArray[4].value
hashTable.bucketArray[5].value
hashTable.bucketArray[6].value
hashTable.bucketArray[7].value

hashTable.hash("Marshawn")
hashTable.setValue("beastmode@beastmode.com", key: "Marshawn")
hashTable.bucketArray[0].value
hashTable.bucketArray[1].value
hashTable.bucketArray[2].value
hashTable.bucketArray[3].value
hashTable.bucketArray[4].value
hashTable.bucketArray[5].value
hashTable.bucketArray[6].value
hashTable.bucketArray[7].value
hashTable.bucketArray[8].value
hashTable.bucketArray[9].value
hashTable.bucketArray[10].value
hashTable.bucketArray[11].value
hashTable.bucketArray[12].value
hashTable.bucketArray[13].value
hashTable.bucketArray[14].value
hashTable.bucketArray[15].value

hashTable.hash("Brad")
hashTable.hash("John")
hashTable.hash("Kevin")
hashTable.hash("Richard")
hashTable.hash("Russell")
hashTable.hash("Marshawn")
