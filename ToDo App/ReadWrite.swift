//
//  ReadWrite.swift
//  ToDo App
//
//  Created by Emilio Del Castillo on 25/03/2021.
//

import Foundation

class ReadWrite {
    
    static let docsURL = try! FileManager.default.url(for: .documentDirectory,
                                                      in: .userDomainMask,
                                                      appropriateFor: nil,
                                                      create: false)
    
    static let dataFile = docsURL.appendingPathComponent("todo.plist")
    
    class func write() {
        do {
            
            // There must be something to write
            guard let items = AppData.items else { return }
            
            let archiver = try NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false)
            try archiver.write(to: dataFile)
            
        } catch {
            print(error)
        }
    }
    
    class func read() {
        
        // If the file exists and contains usable data
        if let data = try? Data(contentsOf: dataFile) {
            
            do {
                if let readArray = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Item] {
                    AppData.items = readArray
                }
                
            } catch {
                print(error)
                AppData.items = []
            }
            
        } else {
            AppData.items = []
            return
        }
    }
}
