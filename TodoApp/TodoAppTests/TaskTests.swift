//
//  TaskTests.swift
//  TodoAppTests
//
//  Created by Noah Bass on 1/25/18.
//  Copyright © 2018 Noah Bass. All rights reserved.
//

import XCTest
@testable import TodoApp

class TaskTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNewTask() {
        let task: Task = Task(title: "My Task")
        XCTAssert(task.importance == Importance.Normal)
    }
    
    func testNewTaskWithImportance() {
        let task: Task = Task(title: "My Task", importance: 0)
        XCTAssert(task.importance == Importance.Low)
    }
    
    func testMultipleNewTasks() {
        let task1: Task = Task(title: "Task 1")
        let task2: Task = Task(title: "Task 2", importance: 2)
        XCTAssert(task1.importance == Importance.Normal)
        XCTAssert(task2.importance == Importance.High)
    }
}
