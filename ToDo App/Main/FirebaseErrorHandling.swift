//
//  FirebaseErrorHandling.swift
//  ToDo App
//
//  Created by Emilio Del Castillo on 31/03/2021.
//

import Firebase

extension AuthErrorCode {
    var errorMessage: String {
        switch self {
        case .emailAlreadyInUse:
            return "The email is already in use with another account."
        case .userNotFound:
            return "Account not found for the specified user. Please check and try again."
        case .userDisabled:
            return "Your account has been disabled. Please contact support."
        case .invalidEmail, .invalidSender, .invalidRecipientEmail:
            return "Please enter a valid email."
        case .networkError:
            return "Network error. Please try again."
        case .weakPassword:
            return "Your password is too weak. The password must be 6 characters long or more."
        case .wrongPassword:
            return "Your password is incorrect. Please try again." // or use 'Forgot password' to reset your password.
        default:
            return "Unknown error occurred."
        }
    }
}

extension UIViewController{
    /**
     Displays an alert to the user with the appropriate message for the error
     - Parameter error: The error that happened
     */
    func handleError(_ error: Error) {
        if let errorCode = AuthErrorCode(rawValue: error._code) {
            print(errorCode.errorMessage)
            let alert = UIAlertController(title: "Error", message: errorCode.errorMessage, preferredStyle: .alert)

            let okAction = UIAlertAction(title: "Ok", style: .default)

            alert.addAction(okAction)

            self.present(alert, animated: true)

        }
    }
}
