//
//  ListViewController.swift
//  TodoApp
//
//  Created by Noah Bass on 1/25/18.
//  Copyright © 2018 Noah Bass. All rights reserved.
//

import UIKit

class TaskListViewController: UITableViewController {
    private var todo: TodoLogic = TodoLogic() // used as a data model for UITableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        title = "Todo List"
        
        // add a new task button
        let newTaskButton: UIButton = UIButton(type: .system)
        newTaskButton.setTitle("Add Task", for: .normal)
        // newTaskButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControlEvents#>)
        
        self.addRow(title: "My first task")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // from UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.getTasks().count
    }
    
    // from UITableViewDataSource
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row: Int = indexPath.row
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = todo.getTasks()[row].title
        return cell
    }
    
    // from UITableViewDataSource
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.removeRow(at: indexPath)
        }
    }
    
    /**
     */
    func addRow(title: String, importance: Int = 1) {
        // tell tableView that we're updating
        tableView.beginUpdates()
        
        // add a new task to the data model
        todo.addTask(title: title, importance: importance)
        tableView.insertRows(at: [IndexPath(row: todo.getTasks().count-1, section: 0)], with: .automatic)
        
        // tell tableView that we're done updating
        tableView.endUpdates()
    }
    
    /**
     Remove a row given an IndexPath object
     */
    func removeRow(at indexPath: IndexPath) {
        let row: Int = indexPath.row
        tableView.beginUpdates()
        todo.removeTask(at: row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }
    
    /**
     Remove a row given its index
     */
//    func removeRow(at row: Int) {
//        tableView.beginUpdates()
//        todo.removeTask(at: row)
//        tableView.deleteRows(at: [IndexPath(row: todo.getTasks().count, section: 0)], with: .automatic)
//        tableView.endUpdates()
//    }
}
