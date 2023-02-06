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
    @IBOutlet weak var newUserButton: UIButton!
    @IBOutlet weak var appleSignInButton: UIButton!
    @IBOutlet weak var googleSignInButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    @IBAction func signinPressed(_ sender: Any) {
        let loginRequest = LoginUserRequest(email: self.emailField.text ?? "",
                                            password: self.passwordField.text ?? ""
        )
        
        // Email check
        if !Validator.isValidEmail(with: loginRequest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        // Password check
        if !Validator.isPasswordValid(for: loginRequest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        AuthService.shared.signIn(with: loginRequest) { error in
            if let error = error {
                AlertManager.showSignInErrorAlert(on: self, with: error)
                return
            }
            
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.checkAuthentication()
            }
        }
    }
    
    
    // MARK: - Selectors
    @IBAction func didTapSignIn(_ sender: Any) {
        let loginRegquest = LoginUserRequest(
            email: self.emailField.text ?? "",
            password: self.passwordField.text ?? "")
        
        // Email check
        if !Validator.isValidEmail(with: loginRegquest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        // Password check
        if !Validator.isPasswordValid(for: loginRegquest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        AuthService.shared.signIn(with: loginRegquest) { error in
            if let error = error {
                AlertManager.showSignInErrorAlert(on: self, with: error)
                return
            }
            
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.checkAuthentication()
            }
        }
    }
    
    @IBAction func didTapNewUser(_ sender: Any) {
        let vc = RegisterController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    @IBAction func googleSignInPressed(_ sender: Any) {
    }
    
    
    
    @IBAction func appleSignInPressed(_ sender: Any) {
    }
    
    
    
    @IBAction func didTapForgotPassword(_ sender: Any) {
        let vc = ForgotPasswordController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
