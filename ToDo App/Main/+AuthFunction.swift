//
//  +AuthFunction.swift
//  ToDo App
//
//  Created by Emilio Del Castillo on 30/03/2021.
//

import UIKit

extension MainViewController {
    @IBAction func authAction(_ sender: UIButton) {
        let authAlert = UIAlertController(title: "Authentication", message: "What would you like to do?", preferredStyle: .actionSheet)
        
        // If logged in
        if AppData.shared.authentication.currentUser != nil {
            // Log out here
            let logoutAction = UIAlertAction(title: "Log out", style: .default) { (action) in
                self.logOut()
            }
            
            authAlert.addAction(logoutAction)
        } else {
            // Log in or sign up here
            let loginAction = UIAlertAction(title: "Log in", style: .default) { (action) in
                self.logIn()
            }
            
            let signUpAction = UIAlertAction(title: "Sign up", style: .default) { (action) in
                self.signUp()
            }
            
            authAlert.addAction(loginAction)
            authAlert.addAction(signUpAction)
        }
        
        
        authAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(authAlert, animated: true)
        
    }
}
