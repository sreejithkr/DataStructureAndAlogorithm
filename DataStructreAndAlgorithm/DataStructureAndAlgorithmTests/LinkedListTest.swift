//
//  LinkedListTest.swift
//  DataStructreAndAlgorithmTests
//
//  Created by Sreejith K R on 10/14/17.
//  Copyright © 2017 Sreejith K R. All rights reserved.
//

import XCTest
@testable import DataStructureAndAlgorithm

class LinkedListTest: XCTestCase {
    
    var linkedList:LinkedList<Int>!
    override func setUp() {
        super.setUp()
        linkedList = LinkedList();
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLikedListIsIntialised() {
        XCTAssert(linkedList != nil)
        XCTAssert(linkedList.count == 0)
        XCTAssert(linkedList.head == nil)
       
    }
    func testCountProperty(){
        var currentCount = linkedList.count;
        linkedList.addLast(value:1)
        currentCount += 1;
        XCTAssert(linkedList.count == currentCount)
        linkedList.addLast(value:2)
        currentCount += 1;
        XCTAssert(linkedList.count == currentCount)
        linkedList.addFirst(value:3)
        currentCount += 1;
        XCTAssert(linkedList.count == currentCount)

    }
    
    func testAddFirst(){
        linkedList.addFirst(node: LinkedListNode<Int>(8))
        XCTAssertNotNil(linkedList.head)
        XCTAssertNotNil(linkedList.tail)
        XCTAssert(linkedList.head === linkedList.tail)
        linkedList.addFirst(node: LinkedListNode<Int>(9))
        XCTAssertFalse(linkedList.head === linkedList.tail)
        linkedList.addFirst(node: LinkedListNode<Int>(9))
        XCTAssert(linkedList.count == 3)
    }
    func testInsert(){
        var currentCount:Int = linkedList.count;
        do {
            try linkedList.insert(node: LinkedListNode<Int>(9), at: 0)
        }catch{
            XCTAssert(false)
        }
        currentCount = linkedList.count;
        XCTAssert(currentCount == 1)
        do {
           try linkedList.insert(node: LinkedListNode<Int>(19), at: 1)
        }catch{
            XCTAssert(false)
        }
        currentCount = linkedList.count;
        XCTAssert(currentCount == 2)
        do {
            try linkedList.insert(node: LinkedListNode<Int>(23), at: 5)
        }catch(DSError.OutOfBound){
            XCTAssert(true)
        }catch{
            XCTAssert(false)
        }
        do {
            try linkedList.insert(node: LinkedListNode<Int>(1), at: 0)
        }catch{
            
        }
        
        
        XCTAssert(currentCount+1 == linkedList.count)
        currentCount = linkedList.count;
        XCTAssert(linkedList.head.value == 1)
        do {
            try linkedList.insert(node: LinkedListNode<Int>(10), at: 0)
            try linkedList.insert(node: LinkedListNode<Int>(11), at: 0)
            try linkedList.insert(node: LinkedListNode<Int>(12), at: 0)
            
        }catch{
            XCTAssert(false)
        }
        XCTAssert(linkedList.head.value == 12)
        XCTAssert(linkedList.head.next.value == 11)
        XCTAssert(linkedList.head.next.next.value == 10)
        XCTAssert(linkedList.head.next.next.next.value == 1)
        XCTAssert(linkedList.head.next.next.next.next.value == 9)
        XCTAssert(linkedList.head.next.next.next.next.next.value == 19)




    }
    func testRemove(){
        var currentCount:Int = linkedList.count;
        do {
            try linkedList.insert(node: LinkedListNode<Int>(9), at: 0)
        }catch{
            XCTAssert(false)
        }
        do {
            try linkedList.removeLast()
        }catch{
            XCTAssert(true)
        }
        XCTAssert(linkedList.head == nil)
        XCTAssert(linkedList.count == 0)

       
        do {
            try linkedList.insert(node: LinkedListNode<Int>(9), at: 0)
        }catch{
            XCTAssert(false)
        }
        do {
            try linkedList.removeFirst()
        }catch{
            XCTAssert(true)
        }
        do {
            try linkedList.insert(node: LinkedListNode<Int>(9), at: 0)
        }catch{
            XCTAssert(false)
        }
        var value = linkedList.head
        do {
            try linkedList.remove(value: value!)
        }catch{
            XCTAssert(true)
        }
        XCTAssert(linkedList.head == nil)
        XCTAssert(linkedList.count == 0)
        do {
            try linkedList.insert(node: LinkedListNode<Int>(1), at: 0)
            try linkedList.insert(node: LinkedListNode<Int>(2), at: 0)
            try linkedList.insert(node: LinkedListNode<Int>(3), at: 0)

        }catch{
            XCTAssert(false)
        }
        XCTAssert(linkedList.head.value == 3)
        value = linkedList.head
        do {
            try linkedList.remove(value: value!)
        }catch{
            XCTAssert(true)
        }
        XCTAssert(linkedList.head.value == 2)
        do {
            try linkedList.removeLast()
        }catch{
            XCTAssert(true)
        }
        XCTAssert(linkedList.head.value == 2)
        do {
            try linkedList.removeFirst()
        }catch{
            XCTAssert(true)
        }
        XCTAssert(linkedList.head == nil)
        XCTAssert(linkedList.count == 0)
        do {
            try linkedList.insert(node: LinkedListNode<Int>(1), at: 0)
            try linkedList.insert(node: LinkedListNode<Int>(2), at: 0)
            try linkedList.insert(node: LinkedListNode<Int>(3), at: 0)
            
        }catch{
            XCTAssert(false)
        }
        XCTAssert(linkedList.tail.value == 1)
        do {
            try linkedList.removeLast()
        }catch{
            XCTAssert(true)
        }
        XCTAssert(linkedList.head.value == 3)
        XCTAssert(linkedList.tail.value == 2)
        do {
            try linkedList.removeFirst()
        }catch{
            XCTAssert(true)
        }
        XCTAssert(linkedList.head === linkedList.tail)
        XCTAssert(linkedList.tail.value == 2)
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
