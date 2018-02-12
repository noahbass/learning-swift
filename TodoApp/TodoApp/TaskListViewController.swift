//
//  ListViewController.swift
//  TodoApp
//
//  Created by Noah Bass on 1/25/18.
//  Copyright © 2018 Noah Bass. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var todo: TodoLogic = TodoLogic() // used as a data model for UITableView
    
    var headerView: UIView = UIView()
    var tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let headerHeight: CGFloat = 64
        let safeAreaTop = view.safeAreaInsets.top
        
        tableView = UITableView(frame: CGRect(x: 0, y: safeAreaTop + headerHeight, width: view.frame.width, height: view.frame.height - headerHeight))
        
        // setup the header
        headerView = UIView(frame: CGRect(x: 0, y: safeAreaTop, width: view.frame.width, height: headerHeight))
        headerView.backgroundColor = UIColor.purple
        
        // Add an input text field to the header
        let textInputWidth: CGFloat = view.frame.width * 0.75
        let textInput: UITextField = UITextField(frame: CGRect(x: 12, y: 12 + safeAreaTop, width: textInputWidth, height: 40))
        textInput.placeholder = "New task"
        headerView.addSubview(textInput)
        
        // Add a button to the header
        let buttonWidth: CGFloat = view.frame.width * 0.25
        let buttonInput: UIButton = UIButton(frame: CGRect(x: textInputWidth, y: 12 + safeAreaTop, width: buttonWidth, height: 40))
        buttonInput.setTitle("Add", for: .normal)
        headerView.addSubview(buttonInput)
        
        // add both header and table to
        view.addSubview(headerView)
        view.addSubview(tableView)
        
        // add a new task button
        let newTaskButton: UIButton = UIButton(type: .system)
        newTaskButton.setTitle("Add Task", for: .normal)
        // newTaskButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControlEvents#>)
        
        self.addRow(title: "My first task")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // from UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.getTasks().count
    }

    // from UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row: Int = indexPath.row
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = todo.getTasks()[row].title
        return cell
    }

    // from UITableViewDataSource
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
