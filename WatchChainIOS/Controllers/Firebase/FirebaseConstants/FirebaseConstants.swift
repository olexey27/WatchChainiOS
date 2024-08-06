//
//  FirebaseConstants.swift
//  WatchChainIOS
//
//  Created by Alexej K on 04/08/2024.
//

struct K {
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSeque = "RegisterToBrowser"
    static let loginSeque = "LoginToBrowser"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lughtBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
