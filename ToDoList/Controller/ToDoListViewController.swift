//
//  ViewController.swift
//  ToDoList
//
//  Created by Subash on 11/02/19.
//  Copyright © 2019 Subash. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemsArr = [item]()
    
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let newItem1 = item()
        newItem1.itemName = "Vikram"
        newItem1.done = true
        itemsArr.append(newItem1)
        
        let newItem2 = item()
        newItem2.itemName = "Sai"
        itemsArr.append(newItem2)
        
        let newItem3 = item()
        newItem3.itemName = "Subhash"
        itemsArr.append(newItem3)
        
        let newItem5 = item()
        newItem5.itemName = "Manju"
        itemsArr.append(newItem5)
        
        let newItem6 = item()
        newItem6.itemName = "Sai"
        itemsArr.append(newItem6)
        
        let newItem7 = item()
        newItem7.itemName = "Subhash"
        itemsArr.append(newItem7)
        
        let newItem8 = item()
        newItem8.itemName = "Manju"
        itemsArr.append(newItem8)
        
        let newItem9 = item()
        newItem9.itemName = "Sai"
        itemsArr.append(newItem9)
        
        let newItem10 = item()
        newItem10.itemName = "Subhash"
        itemsArr.append(newItem10)
        
        let newItem11 = item()
        newItem11.itemName = "Manju"
        itemsArr.append(newItem11)
        
        let newItem12 = item()
        newItem12.itemName = "Sai"
        itemsArr.append(newItem12)
        
        let newItem13 = item()
        newItem13.itemName = "Subhash"
        itemsArr.append(newItem13)
        
        let newItem14 = item()
        newItem14.itemName = "Manju"
        itemsArr.append(newItem14)


        
        
        
        if let items = defaults.array(forKey: "TodoListArray") as? [item] {
            itemsArr = items
        }
    }
    
    // Mark :- Tableview DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = itemsArr[indexPath.row].itemName
        print(itemsArr[indexPath.row].itemName)
        
        cell.accessoryType = itemsArr[indexPath.row].done ? .checkmark : .none
        
        return cell
    }
    
    // Mark :- Tableview Delegate Methods
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemsArr[indexPath.row])
        
        itemsArr[indexPath.row].done = !itemsArr[indexPath.row].done
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
     // Mark :- new item Action
    
    @IBAction func newItemAction(_ sender: Any) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = item()
            newItem.itemName = textField.text!
            self.itemsArr.append(newItem)
            
            self.defaults.setValue(self.itemsArr, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "add new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    

}

