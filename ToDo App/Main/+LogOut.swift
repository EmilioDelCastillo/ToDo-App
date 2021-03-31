//
//  +LogOut.swift
//  ToDo App
//
//  Created by Emilio Del Castillo on 31/03/2021.
//

import Foundation

extension MainViewController {
    func logOut() {
        do {
            try AppData.shared.authentication.signOut()
            self.userButton.tintColor = view.tintColor
        } catch {
            print(error.localizedDescription)
            self.userButton.tintColor = .orange
        }
    }
}
