//
//  AppData.swift
//  ToDo App
//
//  Created by Emilio Del Castillo on 13/02/2021.
//

import Foundation
import Firebase

extension AppData {
    func logIn(email: String, password: String, completion: @escaping (_ result: Bool) -> Void) {
        
        authentication.signIn(withEmail: email, password: password) { (result, error) in
            if error == nil {
                
                completion(true)
            } else {
                print(error!.localizedDescription)
                completion(false)
            }
        }
    }
}
