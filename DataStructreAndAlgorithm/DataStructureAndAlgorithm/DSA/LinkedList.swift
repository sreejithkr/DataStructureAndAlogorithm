import Foundation



///Production Quality LinekdList Checklist
/*
 Properties :
 Head,
 Count,
 
 Methods:
 AddLast
 AddFirst
 RemoveLast
 RemoveFirst
 InsertAt
 
 Sort
 
 */


class LinkedListNode<T>:Node<T>{
    var value:T
    var prev:LinkedListNode<T>!

    var next:LinkedListNode<T>!
    init(_ value:T){
        self.value = value;
    }
}



class LinkedList<T>:DataStructure{
    
    var head:LinkedListNode<T>!
    var tail:LinkedListNode<T>!
    var count:Int = 0
    
    func addFirst(value:T){
        //TC : O(1)
        let node = LinkedListNode<T>(value);
        node.value = value;
        addFirst(node:node)
    }
    
    func addFirst(node:LinkedListNode<T>){
        //TC : O(1)
        if(head == nil){
            head = node;
            tail = node;
        }else{
            node.next = head;
            head.prev = node;
            head = node;
        }
       
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
            node.prev = current
        }else{
            
            head = node;
            tail = node;

        }
        count += 1
 
    }
    
    func insert(value:T,at index:UInt) throws{
        let node = LinkedListNode<T>(value);
        node.value = value;
        try insert(node: node, at: index)
        
    }
    func insert(node:LinkedListNode<T>,at index:UInt) throws{
        var position:Int = 0;
        if(count+1 < index){
            throw DSError.OutOfBound
        }
        if let _ = head{
            var current:LinkedListNode<T>! = head
            
            if(index == 0){
               self.addFirst(node: node)
                return
            }
            else{
                var insertPrevVal:LinkedListNode<T>! = nil;
                while (current.next != nil ){
                    position += 1
                    if(position == index){
                       insertPrevVal = current.next
                    }
                    current = current.next

                }
                if let temp = insertPrevVal{
                    insertPrevVal.next = node
                    node.next = temp
                    node.prev = current
                }
                
                
            }
           
           
        }else{
            
            head = node;
            tail = node;
            
        }
        count += 1

    }
    
    func removeLast() throws ->LinkedListNode<T>!{
        
        if(count == 0 || head == nil || tail == nil){
            throw DSError.OperationOnEmptyListError
        }
        let temp:LinkedListNode<T>;
        if(tail.prev == nil){
            temp = tail
            head = nil;
            tail = nil;
        }else{
             temp = tail.prev
            tail = temp;
            tail.next = nil;
        }
        
        count -= 1

        return temp;
        
    }
    @discardableResult func removeFirst() throws ->LinkedListNode<T>!{
        if(count == 0 || head == nil || tail == nil){
            throw DSError.OperationOnEmptyListError
        }
        let temp:LinkedListNode<T>;
        if(head.next == nil){
            temp = head
            head = nil;
            tail = nil;
        }else{
            temp = head
            head = temp.next;
            head.prev =  nil;
            temp.next = nil;
        }
        return temp;
    }
    @discardableResult func remove(value:LinkedListNode<T>)throws ->LinkedListNode<T>!{
        if(count == 0 || head == nil || tail == nil){
           throw DSError.OperationOnEmptyListError
        }
        var currentNode:LinkedListNode<T>! = head
        while (currentNode.next != nil) {
            if(currentNode === value){
                var tempVal = currentNode.next
                currentNode.next = currentNode.next.next
                currentNode.next.prev = currentNode
                tempVal?.prev = nil
                tempVal?.next = nil
                count -= 1
                return tempVal;
            }
            currentNode = currentNode.next
        }
        return nil
    }
//    @discardableResult func remove(at index:Int)throws ->LinkedListNode<T>!{
//        if(count == 0 || head == nil || tail == nil){
//            throw DSError.OperationOnEmptyListError
//        }
//        let temp:LinkedListNode<T>!;
//
//
//        return temp;
//    }
    
    
}






