//
//  MainViewController+TextFieldDelegate.swift
//  ToDo App
//
//  Created by Emilio Del Castillo on 13/02/2021.
//

import UIKit

// MARK: TextField delegate
extension MainViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        textField.placeholder = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if let newName = textField.text {
            if newName.isEmpty {
                return true
            }
            textField.text = ""
            
            
            // Do not allow duplicates. If the user enters a duplicate, it will be moved to the top and
            // marked as not done yet
            if let index = AppData.shared.items.firstIndex(where: {$0.name.lowercased() == newName.lowercased()}){
                let currentItem = AppData.shared.items[index]
                if currentItem.status { // If it's done
                    AppData.shared.items[index].status = false
                    let doneIndex = doneItems.firstIndex(where: {$0.name.lowercased() == AppData.shared.items[index].name.lowercased()})!
                    let thisItem = doneItems[doneIndex]
                    thisItem.status = false
                    
                    activeItems.insert(thisItem, at: 0)
                    doneItems.remove(at: doneIndex)
                    
                } else {
                    let activeIndex = activeItems.firstIndex(where: {$0.name.lowercased() == AppData.shared.items[index].name.lowercased()})!
                    let thisItem = activeItems[activeIndex]
                    activeItems.insert(thisItem, at: 0)
                    activeItems.remove(at: activeIndex + 1)
                }
                
                tableView.reloadSections(IndexSet(integersIn: 0...1), with: .automatic)
                
                AppData.shared.writeItem(currentItem)
                ReadWrite.write()
                return true
            }
            
            let newItem = Item(name: newName, status: false)
            
            AppData.shared.items.append(newItem)
            activeItems.insert(newItem, at: 0)
            
            tableView.performBatchUpdates {
                let newIndexPath = IndexPath(row: 0 , section: 0)
                tableView.insertRows(at: [newIndexPath], with: .top)
            }
            AppData.shared.writeItem(newItem)
            ReadWrite.write()
        }
        
        return true
    }
}
