//
//  LinkedListTest.swift
//  DataStructreAndAlgorithmTests
//
//  Created by Sreejith K R on 10/14/17.
//  Copyright © 2017 Sreejith K R. All rights reserved.
//

import XCTest
@testable import DataStructreAndAlgorithm

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
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
