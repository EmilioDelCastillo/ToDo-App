//
//  MainViewController+SeparateItems.swift
//  ToDo App
//
//  Created by Emilio Del Castillo on 13/02/2021.
//

extension MainViewController {
    func separateItems () {
        // Empty the arrays just in case, in order to avoid duplicates and a whole lot of crashes
        doneItems.removeAll()
        activeItems.removeAll()
        
        for item in AppData.shared.items {
            if item.status {
                doneItems.append(item)
            } else {
                activeItems.append(item)
            }
        }
    }
}
