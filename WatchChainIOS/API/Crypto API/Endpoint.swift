//
//  Endpoint.swift
//  WatchChainIOS
//
//  Created by Alexej K on 22.05.23.
//

import Foundation

enum Endpoint {
    
    case fetchCoins(url: String = "/v1/cryptocurrency/listings/latest", currency: String = "CAD")
    
    private var url: URL? {
        var components = URLComponents()
        components.scheme = Constants.scheme
        components.host = Constants.baseURL
        components.port = Constants.port
        components.path = self.path
        components.queryItems = []
        return components.url
    }
    
    private var path: String {
        switch self {
        case .fetchCoins(let url, _):
            return url
        }
    }
    
    private var queryItem: [URLQueryItem] {
        switch self {
        case .fetchCoins(_, let currency):
            return [
            URLQueryItem(name: "limit", value: "150"),
            URLQueryItem(name: "sort", value: "market_cap"),
            URLQueryItem(name: "convert", value: currency),
            URLQueryItem(name: "aux", value: "cmc_rank,max_supply,circulating_supply,total_supply")
            ]
        }
    }
    
    private var httpMethod: String {
        switch self {
        case .fetchCoins:
            return HTTP.Method.get.rawValue
        }
    }
    
    private var httpBody: Data? {
        switch self {
        case .fetchCoins:
            return nil
        }
    }
}
