//
//  +SignUp.swift
//  ToDo App
//
//  Created by Emilio Del Castillo on 31/03/2021.
//

import UIKit

extension MainViewController {
    func signUp() {
        let registerAlert = UIAlertController(title: "Sign up", message: "Please enter your email and password.", preferredStyle: .alert)
        
        registerAlert.addTextField { (email) in
            email.textAlignment = .center
            email.placeholder = "Email address"
        }
        
        registerAlert.addTextField { (password) in
            password.textAlignment = .center
            password.placeholder = "Password"
            password.isSecureTextEntry = true
        }
        
        registerAlert.addAction(UIAlertAction(title: "Register", style: .default, handler: { (_) in
            let email = registerAlert.textFields![0].text!
            let password = registerAlert.textFields![1].text!
            
            AppData.shared.signUp(email: email, password: password) { (result) in
                if result {
                    self.userButton.tintColor = .green
                } else {
                    self.userButton.tintColor = .red
                }
            }
        }))
        
        registerAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(registerAlert, animated: true, completion: nil)
    }
}
