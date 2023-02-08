//
//  Collector.swift
//  WatchChainIOS
//
//  Created by Alexej K on 24.01.23.
//

import Foundation

struct Collector : Codable {
    var collectorName: String
    var collectionName: String
    var collectorLogo: String
    var collectorTitleImg: String
    var collection: [NftCollection]
    
}
