//
//  AppData.swift
//  ToDo App
//
//  Created by Emilio Del Castillo on 13/02/2021.
//

import Foundation

class AppData {
    static var items: Array<Item>!
    
    class func populate()  {
        let item1 = Item(name: "Tap to deactivate", status: false)
        let item2 = Item(name: "Swipe left to delete", status: false)
        let item3 = Item(name: "Milk", status: true)
        let item4 = Item(name: "Bread", status: false)
        
        items = [item1, item2, item3, item4]
    }
}
