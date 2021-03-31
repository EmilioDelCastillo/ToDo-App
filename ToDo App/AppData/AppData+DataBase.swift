//
//  AppData+DataBase.swift
//  ToDo App
//
//  Created by Emilio Del Castillo on 31/03/2021.
//

import Foundation

extension AppData {
    /**
     Write or update a single item to the Firebase database.
     - Parameter item: The item to store in the database.
     */
    func writeItem(_ item: Item) {
        guard let id = authentication.currentUser?.uid else {
            return
        }
        
        let update = ["/data/\(id)/\(item.name.lowercased())" : item.dictionary]
        rootNode.updateChildValues(update)
        
    }
    
    /**
     Writes all the items in the Firebase database
     */
    func writeAllItems() {
        guard let id = authentication.currentUser?.uid else {
            return
        }
        
        var updates = [String: Any]()
        
        for item in items {
            updates["/data/\(id)/\(item.name.lowercased())"] = item.dictionary
        }
        rootNode.updateChildValues(updates)
        
    }
    
    /**
     Deletes an item from the Firebase database.
     - Parameter item: The item to delete.
     */
    func deleteItem (item: Item) {
        guard let id = authentication.currentUser?.uid else { return }
        
        rootNode.child("data").child(id).child(item.name.lowercased()).removeValue()
    }
}
