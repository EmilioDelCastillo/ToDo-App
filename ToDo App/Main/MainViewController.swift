//
//  ViewController.swift
//  ToDo App
//
//  Created by Emilio Del Castillo on 13/02/2021.
//

import UIKit

class MainViewController: UITableViewController {
    
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var newItemTextField: UITextField!
    
    var activeItems = [Item]()
    var doneItems = [Item]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        
        if defaults.object(forKey: "firstUse") == nil {
            
            defaults.setValue("true", forKey: "firstUse")
            defaults.synchronize()
            AppData.populate()
            ReadWrite.write()
            
        } else {
            ReadWrite.read()
        }
        
        separateItems()
        
        tableView.tableHeaderView = headerView
        newItemTextField.delegate = self
        newItemTextField.autocapitalizationType = .sentences
        tableView.tableFooterView = UIView()
    }
}
