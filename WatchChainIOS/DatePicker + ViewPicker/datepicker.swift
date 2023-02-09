//
//  datepicker.swift
//  WatchChainIOS
//
//  Created by Alexej K on 09.02.23.
//

import Foundation
import UIKit

extension ProfileEditorController {
    
    func createDatePicker() {
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar Button Done
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donepressed))
        toolbar.setItems([doneButton], animated: true)
        
        birthday.inputAccessoryView = toolbar
        
        birthday.inputView = datePicker
    }
    
    @objc func donepressed() {
        //format date
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        
        birthday.text = formatter.string(from: datePicker.date)
        
        self.view.endEditing(true)
    }
}
