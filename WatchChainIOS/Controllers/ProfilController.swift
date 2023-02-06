//
//  ProfilController.swift
//  WatchChainIOS
//
//  Created by Alexej K on 05.01.23.
//

//import Foundation
import UIKit

class ProfilController: UIViewController {
    
    @IBOutlet var profilePic: UIImageView!
    @IBOutlet var titelPic: UIImageView!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var logoutButton: UIButton!
    @IBOutlet var editProfileButton: UIButton!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AuthService.shared.fetchUser { [weak self] user, error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showFetchingUserError(on: self, with: error)
                return
            }
            
            if let user = user {
                self.nameLabel.text = "\(user.username)"
                self.emailLabel.text = "\(user.email)"
            }
        }
    }
    
    @objc private func didTapLogout() {
        AuthService.shared.signOut { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showLogoutError(on: self, with: error)
                return
            }
            
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.checkAuthentication()
            }
        }
        
    }
}
