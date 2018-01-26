//
//  Task.swift
//  TodoApp
//
//  Created by Noah Bass on 1/25/18.
//  Copyright © 2018 Noah Bass. All rights reserved.
//

import Foundation

enum Importance: Int {
    case Low = 0
    case Normal = 1
    case High = 2
}

// A single task
struct Task {
    var id: Int
    var complete: Bool = false
    var title: String
    var importance: Importance
    var createdAt: Date = Date()
    var updatedAt: Date = Date()
    
    static var idFactory: Int = 0
    
    // increments idFactory, and returns, everytime a task is added, creating a unique id
    private static func getUniqueId() -> Int {
        idFactory += 1
        return idFactory
    }
    
    init(title: String) {
        self.title = title
        self.importance = Importance.Normal
        self.id = Task.getUniqueId()
    }
    
    init(title: String, importance: Int) {
        self.title = title
        self.importance = Importance(rawValue: importance)!
        self.id = Task.getUniqueId()
    }
}
