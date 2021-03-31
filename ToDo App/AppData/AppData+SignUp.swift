//
//  AppData.swift
//  ToDo App
//
//  Created by Emilio Del Castillo on 13/02/2021.
//

import Firebase

extension AppData {
    func signUp(email: String, password: String, completion: @escaping (Result<AuthDataResult?, Error>) -> Void) {
        
        authentication.createUser(withEmail: email, password: password) { (result, error) in
            if error == nil {
                self.writeAllItems()
                completion(.success(result))
            } else {
                print(error!.localizedDescription)
                completion(.failure(error!))
            }
        }
        
    }
}
