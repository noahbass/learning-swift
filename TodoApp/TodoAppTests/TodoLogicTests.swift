//
//  TodoLogicTests.swift
//  TodoAppTests
//
//  Created by Noah Bass on 1/27/18.
//  Copyright © 2018 Noah Bass. All rights reserved.
//

import XCTest
@testable import TodoApp

class TodoLogicTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNewTodoLogic() {
        let logic: TodoLogic = TodoLogic()
        XCTAssert(logic.getTasks().count == 0)
    }
    
    func testAddItems() {
        let logic: TodoLogic = TodoLogic()
        logic.addTask(title: "Cool Task")
        logic.addTask(title: "Cooler Task")
        
        XCTAssert(logic.getTasks().count == 2)
    }
    
    func testAddItemsAndSort1() {
        let logic: TodoLogic = TodoLogic()
        logic.addTask(title: "First Task")
        sleep(1)
        logic.addTask(title: "Second Task")
        sleep(1)
        logic.addTask(title: "Third Task")
        
        XCTAssert(logic.getTasks().count == 3)
        // ensure it is ordered by importance
        XCTAssert(logic.getTasks()[0].title == "First Task")
        XCTAssert(logic.getTasks()[1].title == "Second Task")
        XCTAssert(logic.getTasks()[2].title == "Third Task")
    }
    
    func testRemoveItem() {
        let logic: TodoLogic = TodoLogic()
        logic.addTask(title: "Cool Task")
        logic.addTask(title: "Cooler Task")
        
        // remove the first task
        logic.removeTask(at: 0)
        
        XCTAssert(logic.getTasks().count == 1)
        XCTAssert(logic.getTasks()[0].title == "Cooler Task")
    }
    
    func testRemoveItems() {
        let logic: TodoLogic = TodoLogic()
        logic.addTask(title: "Cool Task")
        logic.addTask(title: "Cooler Task")
        
        // remove both tasks
        logic.removeTask(at: 0)
        logic.removeTask(at: 0)
        
        XCTAssert(logic.getTasks().count == 0)
    }
}
