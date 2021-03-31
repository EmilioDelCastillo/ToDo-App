//
//  AppData.swift
//  ToDo App
//
//  Created by Emilio Del Castillo on 13/02/2021.
//

import Foundation

extension AppData {
    func signUp(email: String, password: String, completion: @escaping (_ result: Bool) -> Void) {
        
        authentication.createUser(withEmail: email, password: password) { (result, error) in
            if error == nil {
                self.writeAllItems()
                completion(true)
            } else {
                print(error!.localizedDescription)
                completion(false)
            }
        }
        
    }
}
