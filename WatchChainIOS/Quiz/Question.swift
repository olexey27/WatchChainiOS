//
//  Question.swift
//  WatchChainIOS
//
//  Created by Alexej K on 20.05.24.
//

import Foundation
import Firebase

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
