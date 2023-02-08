//
//  RegisterController + Extension.swift
//  WatchChainIOS
//
//  Created by Alexej K on 07.02.23.
//

import UIKit

// Textfields
extension RegisterController: UITextFieldDelegate {
    func registerViewShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case usernameField:
            emailField.becomeFirstResponder()
        default: self.view.endEditing(true)
        }
        return true
    }
}
