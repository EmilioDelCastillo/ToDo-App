//
//  AppData.swift
//  ToDo App
//
//  Created by Emilio Del Castillo on 13/02/2021.
//

import Foundation
import Firebase

class AppData {
    static let shared = AppData()
    
    var authentication: Auth!
    var rootNode: DatabaseReference!
    
    var items: Array<Item>!
    
    init() {
        FirebaseApp.configure()
        authentication = Auth.auth()
        rootNode = Database.database().reference()
    }
    
    class func populate()  {
        let item1 = Item(name: "Tap to deactivate", status: false)
        let item2 = Item(name: "Swipe left to delete", status: false)
        let item3 = Item(name: "Milk", status: true)
        let item4 = Item(name: "Bread", status: false)
        
        AppData.shared.items = [item1, item2, item3, item4]
    }
}
