// Playground - noun: a place where people can play

import UIKit

// Data Structures - Hash Table
//

enum Either<T: Equatable> {
    
    case None
    case Some(Node<T>)
    
    func describe() {
        switch self {
        case .Some(let obj):
            println("Object with value: \(obj.value)")
        case .None:
            println("Nothing, no value.")
        }
    }
    
}

class Node<T: Equatable> {
    
    var key: Int
    var value: T
    
    init(key: Int, value: T) {
        self.key = key
        self.value = value
    }

}

class HashTable<T: Equatable> {
    
    var table = [Either<T>]()
    let size = 128
    
    init() {
        for index in 0..<size {
            table.append(.None)
        }
    }
    
    func hashForKey(key: Int) -> Int {
        let hash = key % size
        return hashForKey(key, usingLinearProbeHash: hash)
    }
    
    func hashForKey(key: Int, usingLinearProbeHash hash: Int) -> Int {
        let value = table[hash]
        switch value {
        case .Some(let obj):
            if obj.key == key {
                return hash
            } else {
                var newHash = (hash + 1) % size
                return hashForKey(key, usingLinearProbeHash: newHash)
            }
        case .None:
            return hash
        }
    }
    
    func value(key: Int) -> Either<T> {
        let hash = hashForKey(key)
        var value = table[hash]
        switch value {
        case .Some(let obj):
            return .Some(obj)
        case .None:
            return .None
        }
    }
    
    func setValue(value: T, forKey key: Int) {
        let node = Node(key: key, value: value)
        let hash = hashForKey(key)
        table[hash] = .Some(node)
    }
    
}

var hashTable = HashTable<Int>()
hashTable.setValue(3848484, forKey: 22)
hashTable.setValue(18575888, forKey: 57)
hashTable.value(22).describe()
hashTable.value(57).describe()
hashTable.value(100).describe()

var hashTable2 = HashTable<String>()
hashTable2.setValue("Garfield", forKey: 22)
hashTable2.value(22).describe()
hashTable2.value(149).describe()

//public class HashMap {
//
//    private final static int TABLE_SIZE = 128;
//    HashEntry[] table;
//
//    HashMap() {
//    table = new HashEntry[TABLE_SIZE];
//    for (int i = 0; i < TABLE_SIZE; i++)
//    table[i] = null;
//    }
//
//
//
//    public int get(int key) {
//
//    int hash = (key % TABLE_SIZE);
//
//    while (table[hash] != null && table[hash].getKey() != key)
//
//    hash = (hash + 1) % TABLE_SIZE;
//
//    if (table[hash] == null)
//
//    return -1;
//
//    else
//
//    return table[hash].getValue();
//
//    }
//
//
//
//    public void put(int key, int value) {
//
//    int hash = (key % TABLE_SIZE);
//
//    while (table[hash] != null && table[hash].getKey() != key)
//
//    hash = (hash + 1) % TABLE_SIZE;
//
//    table[hash] = new HashEntry(key, value);
//
//    }
//
//}
