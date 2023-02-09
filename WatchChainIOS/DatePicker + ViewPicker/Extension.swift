//
//  Extension.swift
//  WatchChainIOS
//
//  Created by Alexej K on 09.02.23.
//

import UIKit

// TEXTFIELDS
extension ProfileEditorController: UITextViewDelegate {
    func registerViewShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userName:
            emailField.becomeFirstResponder()
        default: self.view.endEditing(true)
        }
        return true
    }
}

// TEXTFIELDS
extension ProfileEditorController: UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case genderPicker: return genderArray.count
        default: return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView {
        case genderPicker: return genderArray[row]
        default: return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case genderPicker: gender.text = genderArray[row]
        default: print("Error")
        }
    }
}
