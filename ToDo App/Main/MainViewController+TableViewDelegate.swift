//
//  MainViewController+TableView.swift
//  ToDo App
//
//  Created by Emilio Del Castillo on 13/02/2021.
//

import UIKit

extension MainViewController {
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle != .delete { return }
        
        var name: String!
        
        if indexPath.section == 0 { // Active items
            name = activeItems[indexPath.row].name
            activeItems.remove(at: indexPath.row)
            
        } else { // Done items
            name = doneItems[indexPath.row].name
            doneItems.remove(at: indexPath.row)
        }
        
        // Remove it from AppData too
        let deleteIndex = AppData.shared.items.firstIndex { (item) -> Bool in
            return item.name == name
        }!
        let itemToDelete = AppData.shared.items[deleteIndex]
        AppData.shared.items.remove(at: deleteIndex)
        
        AppData.shared.deleteItem(item: itemToDelete)
        ReadWrite.write()
        
        tableView.deleteRows(at: [indexPath], with: .left)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var thisItem: Item!
        if indexPath.section == 0 { // Active items
            thisItem = activeItems[indexPath.row]
            thisItem.status = true
            
            activeItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            doneItems.append(thisItem)
            let newIndexPath = IndexPath(row: doneItems.endIndex - 1, section: 1)
            tableView.insertRows(at: [newIndexPath], with: .fade)
            
        } else {
            thisItem = doneItems[indexPath.row]
            thisItem.status = false
            doneItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            activeItems.append(thisItem)
            let newIndexPath = IndexPath(row: activeItems.endIndex - 1, section: 0)
            tableView.insertRows(at: [newIndexPath], with: .fade)
        }
        
        // Update the model
        if let index = AppData.shared.items.firstIndex(where: {$0.name == thisItem.name}) {
            AppData.shared.items[index] = thisItem
            AppData.shared.writeItem(thisItem)
            ReadWrite.write()
        }
    }
}
