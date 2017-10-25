//
//  HashTableTest.swift
//  DataStructureAndAlgorithmTests
//
//  Created by Sreejith K R on 10/23/17.
//  Copyright © 2017 Sreejith K R. All rights reserved.
//

import XCTest
@testable import DataStructureAndAlgorithm

class HashTableTest: XCTestCase {
    class Person{
        var name:String
        init(_ name:String){
            self.name = name;
        }
        
    }
    var hashTableInt:HashTable<Int,Person>!
    override func setUp() {
        super.setUp()
        hashTableInt = HashTable<Int,Person>(capacity:100);
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInsert() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(hashTableInt.count == 0)
        hashTableInt.insert(value: Person("Person 1"), forKey: 1)
        hashTableInt.insert(value: Person("Person 2"), forKey: 2)
        hashTableInt.insert(value: Person("Person 3"), forKey: 3)
        XCTAssert(hashTableInt.count == 3)
        var val1 = hashTableInt.get(valueForKey: 1)
        var val2 = hashTableInt.get(valueForKey: 2)
        var val3 = hashTableInt.get(valueForKey: 3)
        XCTAssert(val1 != nil)
        XCTAssert(val2 != nil)
        XCTAssert(val3 != nil)
        XCTAssert(val1?.name == "Person 1")
        XCTAssert(val2?.name == "Person 2")
        XCTAssert(val3?.name == "Person 3")
        hashTableInt.insert(value: Person("Person 4"), forKey: 3)
        hashTableInt.insert(value: Person("Person 5"), forKey: 2)
        hashTableInt.insert(value: Person("Person 6"), forKey: 1)

         val1 = hashTableInt.get(valueForKey: 1)
         val2 = hashTableInt.get(valueForKey: 2)
         val3 = hashTableInt.get(valueForKey: 3)
        XCTAssert(val3?.name == "Person 4")
        XCTAssert(val2?.name == "Person 5")
        XCTAssert(val1?.name == "Person 6")
        XCTAssert(hashTableInt.count == 3)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            hashTableInt.insert(value: Person("Person 4"), forKey: 3)
            // Put the code you want to measure the time of here.
        }
    }
    
}
