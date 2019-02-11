//
//  ViewController.swift
//  ToDoList
//
//  Created by Subash on 11/02/19.
//  Copyright © 2019 Subash. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemsArr = ["Reckon","ADSO","Cavalier","Focus","Brn"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Mark :- Tableview DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = itemsArr[indexPath.row]
        
        return cell
    }
    
    // Mark :- Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemsArr[indexPath.row])
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
             tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
             tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    


}

