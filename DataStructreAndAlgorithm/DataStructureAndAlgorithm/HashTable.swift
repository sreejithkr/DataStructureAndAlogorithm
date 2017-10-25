//
//  HashTable.swift
//  DataStructureAndAlgorithm
//
//  Created by Sreejith K R on 10/19/17.
//  Copyright © 2017 Sreejith K R. All rights reserved.
//

import Foundation

class HashTable<K,V>:DataStructure where K:Hashable {
    class HashTableNode{
        var key:K
        var hashTableItemValue:V
        init(_ key:K,_ value:V){
            self.key = key
            self.hashTableItemValue = value
        }
        
    }
    
    
    private var capacity:Int
    var count:Int = 0
    init(capacity:UInt){
        self.capacity = Int(capacity)
        hashTableDataHolderArray = []
       // let arr:Repeated<LinkedList<HashTableNode>> = repeatElement(LinkedList<HashTableNode>(), count: Int(capacity))
       // hashTableDataHolderArray.append(contentsOf: arr);
        // Array<LinkedList<HashTableNode>>()
    
        var ct = 0;
        repeat{
            hashTableDataHolderArray.append(LinkedList<HashTableNode>());
            ct += 1
        }while(ct < capacity)
      
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
    private func replaceOrInsertValueForKeyInLinkedList(key:K, list:inout LinkedList<HashTableNode>,value:V){
        guard var currentNode = list.head else{
            count += 1
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
        count += 1

    }
    
    private func removeValueForKeyInLinkedList(key:K, list:inout LinkedList<HashTableNode>){
        guard var currentNode = list.head else{
            return
        }
        if(currentNode.value.key == key){
            if(list.count > 0){
                try! list.removeFirst()
                count -= 1

            }
            return
        }
        
        while (currentNode.next != nil) {
            currentNode = currentNode.next
            let hashNode = currentNode.value
            if(hashNode.key == key){
                do{
                    try  list.remove(value: currentNode)
                    count -= 1
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
        var list = hashTableDataHolderArray[findPositionForKey(key: key)]
        replaceOrInsertValueForKeyInLinkedList(key: key,  list: &list, value: value)
        hashTableDataHolderArray[findPositionForKey(key: key)] = list;
    }
    
    func remove(valueForKey key:K){
        var list = hashTableDataHolderArray[findPositionForKey(key: key)]
         removeValueForKeyInLinkedList(key: key, list: &list)
    }
    
    func get(valueForKey key:K)->V!{
        let list = hashTableDataHolderArray[findPositionForKey(key: key)]
        if(list.count == 0){
            return nil;
        }else if(list.count == 1){
            if(list.head.value.key == key){
                return list.head.value.hashTableItemValue
            }
        }else{
            var currentval = list.head;
            while(currentval?.next != nil){
                
                currentval = currentval?.next;
                if(currentval!.value.key == key){
                    return currentval?.value.hashTableItemValue
                }
            }
            
        }
        return nil

    }
    
    
    
    
}
