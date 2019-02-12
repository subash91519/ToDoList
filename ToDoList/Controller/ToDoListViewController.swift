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
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("item.plist")


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        print(dataFilePath!)
        
        loadItems()

        
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
        saveData()
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
            self.saveData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "add new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    // Mark : Data Manipulation Methods
    
    func saveData() {
        
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(self.itemsArr)
           try data.write(to: dataFilePath!)
        } catch {
            print("error encoding,\(error)")
        }
        
        self.tableView.reloadData()
        
    }
    
    func loadItems() {
        
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                itemsArr = try decoder.decode([item].self, from: data)
            } catch {
                print("decoder error,\(error)")
            }
        }
        
        
    }
    

}

