//
//  SinglyLinkedList.swift
//  DataStructreAndAlgorithm
//
//  Created by Sreejith K R on 10/14/17.
//  Copyright © 2017 Sreejith K R. All rights reserved.
//

import Foundation


class SinglyLinkedList<T>:DataStructure{
    
    var head:LinkedListNode<T>!
    var count:Int = 0
    
    func addFirst(value:T){
        //TC : O(1)
        let node = LinkedListNode<T>(value);
        node.value = value;
        addFirst(node:node)
    }
    
    func addFirst(node:LinkedListNode<T>){
        //TC : O(1)
        node.next = head;
        head = node;
        count += 1
    }
    
    func addLast(value:T){
        let node = LinkedListNode<T>(value);
        node.value = value;
        addLast(node:node)
    }
    func addLast(node:LinkedListNode<T>){
        //TC : O(1)
        if let _ = head{
            var current:LinkedListNode<T>! = head;
            while (current.next != nil){
                current = current.next;
            }
            current.next = node;
        }else{
            head = node;
        }
        count += 1
        
    }
    
    func insertValue(value:T,at index:Int){
        let node = LinkedListNode<T>(value);
        node.value = value;
        insertValue(node: node, at: index)
        
    }
    func insertValue(node:LinkedListNode<T>,at index:Int){
        
        count += 1
        
    }
    
    func removeLast() throws ->LinkedListNode<T>!{
        
        if(count == 0 || head == nil){
            throw DSError.OperationOnEmptyListError
        }
        var current = head;
        var previous = head;
        while(current?.next != nil){
            current  = current?.next
            previous = current;
        }
        let temp = current!;
        previous?.next = nil;
        count -= 1
        
        return temp;
        
    }
    func removeFirst(){
        
    }
    
    
    
}
