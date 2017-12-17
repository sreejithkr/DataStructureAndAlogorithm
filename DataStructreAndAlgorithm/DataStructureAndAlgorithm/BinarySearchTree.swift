//
//  BinaryTree.swift
//  DataStructreAndAlgorithm
//
//  Created by Sreejith K R on 7/12/17.
//  Copyright © 2017 Sreejith K R. All rights reserved.
//

import Foundation


/*
 The operation include
 
 Inserting an element into tree
 Deleting an element from tree
 Searching for an element
 Traversing the tree
 
 
 Finding height of tree
 Finding size of tree
 Finding the level which has maximum sum
 Finding the least common ancestor for a given pair of nodes
 
 */

class BinaryTreeNode<T>:Node<T> where T:Comparable{
    
    var data:T;
    var right:BinaryTreeNode<T>!
    var left:BinaryTreeNode<T>!
    init(data:T) {
        self.data = data;
    }
}

class  BinarySearchTree<T>:DataStructure where T:Comparable {
    
    var root:BinaryTreeNode<T>!;
    
    init() {
        
    }
    func insert(data:T){
        self.insert(node: BinaryTreeNode<T>(data:data))
    }
    func insert(node:BinaryTreeNode<T>){
        if var currentData = root{
            while(true){
                if(currentData.data >= node.data){
                    if(currentData.left != nil){
                        currentData = currentData.left
                        continue;
                    }
                    if(currentData.left == nil){
                        
                        currentData.left = node
                        break
                    }
                }
                if(currentData.data < node.data){
                    if(currentData.right != nil){
                        currentData = currentData.right
                        continue;
                    }
                    if(currentData.right == nil){
                        currentData.right = node
                        break
                    }
                }
            }
            
        }else{
            root = node;
        }
        
    }
    /*L Root R*/
    func inOrderTraversal(root:BinaryTreeNode<T>!,action:(_ data:T)->() = { data in print("The data for the node is \(data)")}){
        
        if let _ = root{
            inOrderTraversal(root: root.left, action: action)
            action(root.data)
            inOrderTraversal(root: root.right, action: action)
        }else{
            return
        }
        
    }
    /*L R Root */
    func postOrderTraversal(root:BinaryTreeNode<T>!,action:(_ data:T)->() = { data in print("The data for the node is \(data)")}){
        if let _ = root{
            postOrderTraversal(root: root.left, action: action)
            postOrderTraversal(root: root.right, action: action)
            action(root.data)
            
        }else{
            return
        }
        
    }
    /*Root L R*/
    
    func preOrderTraversal(root:BinaryTreeNode<T>!,action:(_ data:T)->() = { data in print("The data for the node is \(data)")}){
        if let _ = root{
            action(root.data)
            preOrderTraversal(root: root.left, action: action)
            preOrderTraversal(root: root.right, action: action)
            
            
        }else{
            return
        }
        
    }
    
    func inOrderTraversalUsingStack(action:(_ data:T)->() = { data in print("inOrderTraversalUsingStack The data for the node is \(data)")}){
        
        let stack:StackArray<BinaryTreeNode<T>> = StackArray<BinaryTreeNode<T>>()
        if let _ = root{
            var exitWhileLoop = false
            var top:BinaryTreeNode<T>! =  root!
            stack.push(value: root)
            
            while(!exitWhileLoop){
                if let _ = top{
                    if let _ = top.left{
                        stack.push(value: top.left)
                        top = top.left
                        continue
                    }else{
                        if(!stack.isEmpty()){
                            let val = try! stack.pop()
                            action(val.data)
                            top = val.right
                            if let _ = val.right{
                                stack.push(value: val.right)
                            }
                            continue
                        }else{
                            exitWhileLoop = true
                        }
                    }
                }else{
                    if(!stack.isEmpty()){
                        let val = try! stack.pop()
                        action(val.data)
                        top = val.right
                        if let _ = val.right{
                            stack.push(value: val.right)
                        }
                        continue
                        
                        
                    }else{
                        exitWhileLoop = true
                    }
                }
            }
        }
        
    }
    /*Root L R*/
    func preOrderTraversalUsingStack(action:(_ data:T)->() = { data in print("preOrderTraversalUsingStack The data for the node is \(data)")}){
        let stack:StackArray<BinaryTreeNode<T>> = StackArray<BinaryTreeNode<T>>()
        var exitWhileLoop = false
        var current  = root
        while(!exitWhileLoop){
            if let c = current{
                 action(c.data)
               
                if(c.left != nil){
                    if(c.right != nil){
                        stack.push(value: c.right)
                    }
                    current = c.left
                    continue
                }
                
                if(c.right != nil){
                   
                    current = c.right
                    continue
                }
            }
            current = try? stack.pop()
            if(current == nil){
                exitWhileLoop = true
            }
        }
    }
    
    /*Root L R*/
    func postOrderTraversalUsingStack(action:(_ data:T)->() = { data in print("preOrderTraversalUsingStack The data for the node is \(data)")}){
        let stack:StackArray<BinaryTreeNode<T>> = StackArray<BinaryTreeNode<T>>()
       
    }
    
    func delete(){
        
    }
    func inOrderTraversal(action:(_ data:T)->() = { data in print("The data for the node is \(data)")}){
        
        
    }
    
}

