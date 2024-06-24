//
//  ProfilController.swift
//  WatchChainIOS
//
//  Created by Alexej K on 05.01.23.
//

import UIKit
import Firebase

class ProfilController: UIViewController {
    
    var user: User!
    
    @IBOutlet var profilePic: UIImageView!
    @IBOutlet var titelPic: UIImageView!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var walletButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "Guest"
        emailLabel.text = "Guest1@mail.com"
        
        /// Animated Images
        //profilePic.loadGif(name: "profilegif")
        //titelPic.loadGif(name: "titlegif")
    }
    
    @IBAction func logoutPressed() {
        performSegue(withIdentifier: "logoutSeque", sender: self)
    }
    
    @IBAction func editButtonPressed() {
        performSegue(withIdentifier: "editProfileSeque", sender: self)
    }
}
