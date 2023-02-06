//
//  ForgotPasswordController.swift
//  WatchChainIOS
//
//  Created by Alexej K on 05.01.23.
//

import UIKit

class ForgotPasswordController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    @IBAction func signUpPressed(_ sender: Any) {
        let email = self.emailField.text ?? ""
        
        if !Validator.isValidEmail(with: email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        AuthService.shared.forgotPassword(with: email) { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showErrorSendingPasswordReset(on: self, with: error)
                return
            }
            
            AlertManager.showPasswordResetSent(on: self)
        }
    }
}
