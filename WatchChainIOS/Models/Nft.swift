//
//  Nft.swift
//  WatchChainIOS
//
//  Created by Alexej K on 24.01.23.
//

import Foundation

struct NftCollection: Codable {
    var nftImage: String
    var nftName: String
    var nftPrice: NftPrice
}
enum NftPrice: Codable {
    case double(Double)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Double.self) {
            self = .double(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(NftPrice.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for NftPrice"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .double(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

typealias Respons = [Collector]
