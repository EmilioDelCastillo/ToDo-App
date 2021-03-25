//
//  MainViewController+SeparateItems.swift
//  ToDo App
//
//  Created by Emilio Del Castillo on 13/02/2021.
//

extension MainViewController {
    func separateItems () {
        for item in AppData.items {
            if item.status {
                doneItems.append(item)
            } else {
                activeItems.append(item)
            }
        }
    }
}
