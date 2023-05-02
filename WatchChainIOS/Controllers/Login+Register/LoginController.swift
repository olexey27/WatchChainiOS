//
//  LoginController.swift
//  WatchChainIOS
//
//  Created by Alexej K on 02.01.23.
//

import LocalAuthentication
import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var qrCodeScan: UIButton!
    
    var isValidLogin = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImg.loadGif(name: "giphyImg")
        
        signinButton.isEnabled = false
        emailField.delegate = self
        passwordField.delegate = self
        passwordField.isSecureTextEntry = true
        
        setupButton()
    }
    
    func setupButton() {
        signinButton.layer.cornerRadius = 8
    }
    
    @IBAction func faceId(_ sender: UIButton) {
       authenticate()
        sender.pulsate()
    }
    
    private func authenticate() {
        
        let context = LAContext()
        
        var error:NSError? = nil
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            let reason = "explanation for authentication"
            
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) {
                success, authenticationError in
                
                if success {
                    
                    DispatchQueue.main.async {
                        //self.alert(with: "Authefication success!!!")
                        
                        guard let profileController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfilController") as? ProfilController else {
                            fatalError()
                        }
                        
                        self.present(profileController, animated: true, completion: nil)
                        
                    }
                } else {
                    print("Authification failt")
                }
            }
            
        } else {
            alert(with: "Authification not available !")
        }
    }
    
    private func alert(with message: String) {
        
        let alert = UIAlertController(title: "ERROR", message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func signinPressed(_ sender: UIButton) {
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
        sender.pulsate()
    }
    
    @IBAction func registerPressed() {
        performSegue(withIdentifier: "registerLandingSeque", sender: self)
    }
    
    @IBAction func guestPressed() {
        performSegue(withIdentifier: "signInLandingSeque", sender: self)
    }
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
