//
//  TodoLogic.swift
//  TodoApp
//
//  Created by Noah Bass on 1/25/18.
//  Copyright © 2018 Noah Bass. All rights reserved.
//

import Foundation

class TodoLogic {
    private var tasks: [Task] = []
    
    func getTasks() -> [Task] {
        return self.tasks
    }
    
    /**
     Adds a new task
     */
    func addTask(title: String, importance: Int = 1) -> Void {
        self.tasks.append(Task(title: title, importance: importance))
        self.sort()
    }
    
    /**
     Removes a task
     */
    func removeTask(at index: Int) -> Void {
        if index + 1 > self.tasks.count {
            return
        }

        self.tasks.remove(at: index)
    }
    
    /**
     Sorts the tasks by createdAt date (oldest first), then by title (descending),
     and then by importance (highest first)
     */
    func sort() -> Void {
        // TODO: find a better way to do this if there is one
        self.tasks.sort(by: { (left: Task, right: Task) -> Bool in
            if (left.createdAt == right.createdAt) {
                if (left.title == right.title) {
                    return left.importance.rawValue > right.importance.rawValue
                }
                
                return left.title < right.title
            }
            
            return left.createdAt < right.createdAt
        })
    }
}
