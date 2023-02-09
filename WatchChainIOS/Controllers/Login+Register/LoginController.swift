//
//  LoginController.swift
//  WatchChainIOS
//
//  Created by Alexej K on 02.01.23.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var appleSignInButton: UIButton!
    @IBOutlet weak var googleSignInButton: UIButton!
    @IBOutlet weak var backgroundImg: UIImageView!
    
    var isValidLogin = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImg.loadGif(name: "giphyImg")
        
        signinButton.isEnabled = false
        emailField.delegate = self
        passwordField.delegate = self
        passwordField.isSecureTextEntry = true
    }
    
    @IBAction func signinPressed(_ sender: Any) {
        if(isValidLogin) {
            performSegue(withIdentifier: "signInLandingSeque", sender: self)
        } else {
            let alert = UIAlertController(title: "Login faild!", message: "Try again!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Reenter", style: .cancel, handler: { _ in
                self.emailField.text = ""
                self.passwordField.text = ""
                self.signinButton.isEnabled = false
                alert.dismiss(animated: true)
            }))
            present(alert, animated: true)
        }
    }
    
    @IBAction func registerPressed() {
        performSegue(withIdentifier: "registerLandingSeque", sender: self)
    }
    
    /*@IBAction func googleSignInPressed(_ sender: Any) {
    }
    
    
    
    @IBAction func appleSignInPressed(_ sender: Any) {
    }*/
}

extension LoginController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @IBAction func onTextChanged() {
        if(emailField.text?.count ?? 0 > 0 && passwordField.text?.count ?? 0 > 0) {
            signinButton.isEnabled = true
            if(emailField.text == "alexey27@gmail.com" && passwordField.text == "ZuWild") {
                isValidLogin = true
            } else {
                isValidLogin = false
            }
        }
    }
}
