//
//  +LogIn.swift
//  ToDo App
//
//  Created by Emilio Del Castillo on 31/03/2021.
//

import UIKit

extension MainViewController {
    func logIn() {
        let loginAlert = UIAlertController(title: "Log in", message: "Please enter your email and password.", preferredStyle: .alert)
        
        loginAlert.addTextField { (email) in
            email.textAlignment = .center
            email.placeholder = "Email address"
        }
        
        loginAlert.addTextField { (password) in
            password.textAlignment = .center
            password.placeholder = "Password"
            password.isSecureTextEntry = true
        }
        
        loginAlert.addAction(UIAlertAction(title: "Log in", style: .default, handler: { (_) in
            let email = loginAlert.textFields![0].text!
            let password = loginAlert.textFields![1].text!
            
            AppData.shared.logIn(email: email, password: password) { (result) in
                switch result {
                case .success(_):
                    // Update the user items
                    AppData.shared.readAll { (found) in
                        if found {
                            self.separateItems()
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                    self.userButton.tintColor = .green
                    
                case .failure(let error):
                    self.handleError(error)
                    self.userButton.tintColor = .red
                }
            }
        }))
        
        loginAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(loginAlert, animated: true, completion: nil)
    }
}
