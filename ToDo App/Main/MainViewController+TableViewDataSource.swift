//
//  MainViewController+TableViewDataSource.swift
//  ToDo App
//
//  Created by Emilio Del Castillo on 13/02/2021.
//

import UIKit

extension MainViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (section == 0) ? "Active Items" : "Done Items"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (section == 0) ? activeItems.count : doneItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        
       
        let thisItem = (indexPath.section == 0) ? activeItems[indexPath.row] : doneItems[indexPath.row]
        // let thisItem = AppData.shared.items[indexPath.row]
        
        let attrString = NSMutableAttributedString(string: thisItem.name)
        
        if thisItem.status {
            
            attrString.addAttribute(.strikethroughStyle, value: 2.0, range: NSMakeRange(0, attrString.length))

            cell.backgroundColor = .systemBackground
            cell.accessoryType = .checkmark
        } else {
            // Because the table view dequeues cells, we need to remove this attribute when it is not needed
            attrString.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, attrString.length))
            
            cell.backgroundColor = .systemBackground
            cell.accessoryType = .none
        }
        
        cell.textLabel?.attributedText = attrString
        
        return cell
    }
}
