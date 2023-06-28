//
//  ProfileEditorController.swift
//  WatchChainIOS
//
//  Created by Alexej K on 09.02.23.
//

import UIKit

class ProfileEditorController: UIViewController, UIPickerViewDataSource {
    
    @IBOutlet weak var titleImg: UIImageView!
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var birthday: UITextField! // Datepicker
    @IBOutlet weak var gender: UITextField! //PickerView
    @IBOutlet weak var saveButton: UIButton!
    
    let datePicker = UIDatePicker()
    let genderPicker = UIPickerView()
    let genderArray = ["Male", "Female", "Divers"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        keyboardDissmissable()
        
        /// Animated Images
        //titleImg.loadGif(name: "photo.fill")
        //logoImg.loadGif(name: "person.fill")
        
        //userName.text = "Alexey"
        //emailField.text = "alexey27@gmail.com"
        
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        createDatePicker()
        
        genderPicker.dataSource = self
        genderPicker.delegate = self
        pickGender()

        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    // KEYBOARD OVERLAPS VIEW
    @objc func keyBoardWillShow(notification: NSNotification) {
        if self.view.frame.origin.y == 0 && (emailField.isFirstResponder) {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyBoardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    // DISMISS KEYBOARD OUTSIDE
    @objc func dismissKeyboardTouchOutside() {
        self.view.endEditing(true)
    }
    
    func keyboardDissmissable() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    // DATA TRANSFER
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! ProfilController
        let user = sender as! User
        destinationViewController.user = user
    }
}

