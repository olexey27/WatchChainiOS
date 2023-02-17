//
//  viewPicker.swift
//  WatchChainIOS
//
//  Created by Alexej K on 09.02.23.
//

import Foundation
import UIKit

extension ProfileEditorController {
    @objc func endEditing() {
        self.view.endEditing(true)
    }
    
    func pickGender() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(endEditing))
        toolbar.setItems([doneButton], animated: true)
        
        gender.inputAccessoryView = toolbar
        gender.inputView = genderPicker
    }
}

extension AddNftViewController {
    @objc func endEditing() {
        self.view.endEditing(true)
    }
    func pickCrypto() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(endEditing))
        toolbar.setItems([doneButton], animated: true)
        
        cryptoTF.inputAccessoryView = toolbar
        cryptoTF.inputView = cryptoPicker
    }
}
