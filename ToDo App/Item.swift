//
//  Item.swift
//  ToDo App
//
//  Created by Emilio Del Castillo on 13/02/2021.
//

import Foundation

class Item: NSObject, NSCoding {
    var name: String!
    /**
        True means done.
     */
    var status: Bool!
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(status.string, forKey: "status")
    }
    
    required convenience init?(coder: NSCoder) {
        let name = coder.decodeObject(forKey: "name") as! String
        let status = coder.decodeObject(forKey: "status") as! String
        
        self.init(name: name, status: status.bool)
    }
    
    /**
     - Parameter name: The name of the item.
     - Parameter status: True if the item is done, false otherwise.
     */
    init(name: String, status: Bool) {
        self.name = name
        self.status = status
    }
    
}
