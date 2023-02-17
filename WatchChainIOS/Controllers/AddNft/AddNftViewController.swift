//
//  AddNftViewController.swift
//  WatchChainIOS
//
//  Created by Alexej K on 31.01.23.
//

import UIKit
import CoreData

class AddNftViewController: UIViewController, UINavigationControllerDelegate, UITextFieldDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var collectionTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var cryptoTF: UITextField! //PickerView
    
    var targetName = ""
    var targetId: UUID?
    let cryptoPicker = UIPickerView()
    let cryptoArray = ["Bitcoin", "Ethereum", "Solana", "DogeCoin"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        collectionTextField.delegate = self
        yearTextField.delegate = self
        keyboardDissmissable()
        
        cryptoPicker.dataSource = self
        cryptoPicker.delegate = self
        pickCrypto()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        if targetName != "" {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Collection")
            let idString = targetId?.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString!)
            fetchRequest.returnsObjectsAsFaults = false
            do {
                let results = try context.fetch(fetchRequest)
                for result in results as! [NSManagedObject] {
                    
                    if let name = result.value(forKey: "name") as? String {
                        nameTextField.text = name
                    }
                    if let collection = result.value(forKey: "collection") as? String {
                        collectionTextField.text = collection
                    }
                    if let year = result.value(forKey: "year") as? Int {
                        yearTextField.text = String(year)
                    }
                    if let imageData = result.value(forKey: "image") as? Data {
                        let image = UIImage(data: imageData)
                        imageView.image = image
                    }
                }
            } catch {
                print("Error")
            }
        } else {
        }
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTap))
        imageView.addGestureRecognizer(gestureRecognizer)
    }
        
    @objc func imageTap() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    // KEYBOARD OVERLAPS VIEW
    @objc func keyBoardWillShow(notification: NSNotification) {
        if self.view.frame.origin.y == 0 && (yearTextField.isFirstResponder) {
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
        
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:
                                   [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
        
    @IBAction func saveButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let saveData = NSEntityDescription.insertNewObject(forEntityName: "Collection", into: context)
            
        saveData.setValue(nameTextField.text!, forKey: "name")
        saveData.setValue(collectionTextField.text!, forKey: "collection")
        if let year = Int(yearTextField.text!) {
            saveData.setValue(year, forKey: "year")
        }
        let imagePress = imageView.image?.jpegData(compressionQuality: 0.5)
        saveData.setValue(imagePress, forKey: "image")
        saveData.setValue(UUID(), forKey: "id")
        do {
            try context.save()
            print("Succes")
        } catch {
            print("Error")
        }
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "newData"), object: nil)
        self.navigationController?.popViewController(animated: true)
    }
}
