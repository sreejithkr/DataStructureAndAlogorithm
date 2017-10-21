//
//  HashTable.swift
//  DataStructureAndAlgorithm
//
//  Created by Sreejith K R on 10/19/17.
//  Copyright © 2017 Sreejith K R. All rights reserved.
//

import Foundation

class HashTable<K,V> where K:Hashable {
    class HashTableNode{
        var key:K
        var hashTableItemValue:V
        init(_ key:K,_ value:V){
            self.key = key
            self.hashTableItemValue = value
        }
        
    }
    
    private var capacity:Int
    init(capacity:UInt){
        self.capacity = Int(capacity)
        hashTableDataHolderArray = [LinkedList<HashTableNode>](repeatElement(LinkedList<HashTableNode>(), count: self.capacity))
    }
    
    private var hashTableDataHolderArray:[LinkedList<HashTableNode>]
    
    private func findValueForKeyFromLinkedList(key:K,list:LinkedList<HashTableNode>)->V?{
        guard var currentNode = list.head else{
            return nil;
        }
        if(currentNode.value.key == key){
            return currentNode.value.hashTableItemValue
        }
        while (currentNode.next != nil) {
            currentNode = currentNode.next
            let hashNode = currentNode.value
            if(hashNode.key == key){
                return hashNode.hashTableItemValue
            }
        }
        return nil;
    }
    private func replaceOrInsertValueForKeyInLinkedList(key:K,list:LinkedList<HashTableNode>,value:V){
        guard var currentNode = list.head else{
         list.addFirst(value: HashTableNode(key,value));
         return
        }
        if(currentNode.value.key == key){
            currentNode.value.hashTableItemValue = value;
            return
        }
        while (currentNode.next != nil) {
            currentNode = currentNode.next
            let hashNode = currentNode.value
            if(hashNode.key == key){
                hashNode.hashTableItemValue = value;
                return
            }
        }
        
        list.addLast(value: HashTableNode(key,value))
    }
    
    private func removeValueForKeyInLinkedList(key:K,list:LinkedList<HashTableNode>){
        guard var currentNode = list.head else{
            return
        }
        if(currentNode.value.key == key){
            if(list.count > 0){
                try! list.removeFirst()
            }
            return
        }
        
        while (currentNode.next != nil) {
            currentNode = currentNode.next
            let hashNode = currentNode.value
            if(hashNode.key == key){
                do{
                    try  list.remove(value: currentNode)
                }catch{
                    
                }
                return
            }
        }
    }
    private func findPositionForKey(key:K)->Int{
        return abs(key.hashValue % capacity)
    }
    
    func insert(value:V,forKey key:K){
        let list = hashTableDataHolderArray[findPositionForKey(key: key)]
        replaceOrInsertValueForKeyInLinkedList(key: key, list: list, value: value)
    }
    
    func remove(valueForKey key:K){
        let list = hashTableDataHolderArray[findPositionForKey(key: key)]
         removeValueForKeyInLinkedList(key: key, list: list)
    }
    
    
    
    
}
