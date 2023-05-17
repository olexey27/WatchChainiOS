//
//  CoinError.swift
//  WatchChainIOS
//
//  Created by Alexej K on 17.05.23.
//

import Foundation

struct CoinError: Decodable {
    let errorCode: Int
    let errorMessage: String
    
    enum CodingKeys: String, CodingKey {
        case status
        case errorCode = "error_code"
        case errorMessage = "error_message"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let status = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .status)
        
        errorCode = try status.decode(Int.self, forKey: .errorCode)
        errorMessage = try status.decode(String.self, forKey: .errorMessage)
    }
}
