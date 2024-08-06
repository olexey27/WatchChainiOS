//
//  RegisterViewController.swift
//  WatchChainIOS
//
//  Created by Alexej K on 25.06.24.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    //Navigate to the BrowserController
                    self.performSegue(withIdentifier: K.registerSeque, sender: self)
                }
            }
        }
    }
}
