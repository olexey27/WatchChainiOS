//
//  ViewCryptoControllerViewModel.swift
//  WatchChainIOS
//
//  Created by Alexej K on 15.05.23.
//

import UIKit
import Firebase

class ViewCryptoControllerViewModel {
    
    var onImageLoaded: ((UIImage?)->Void)?
    
    // MARK: - Variables
    let coin: Coin
    
    
    // MARK: - Initializer
    init(_ coin: Coin) {
        self.coin = coin
        self.loadImage()
    }
    private func loadImage() {
        
        DispatchQueue.global().async { [weak self] in
            if let logoURL = self?.coin.logoURL,
               let imageData = try? Data(contentsOf: logoURL),
               let logoImage = UIImage(data: imageData) {
                self?.onImageLoaded?(logoImage)
            }
        }
    }
    
    // MARK: - Computed Properties
    var rankLabel: String {
        return "Rank: \(self.coin.rank)"
    }
    
    var priceLabel: String {
        return "Price: $\(self.coin.pricingData.CAD.price) CAD"
    }
    
    var marketCapLabel: String {
        return "Market Cap: $\(self.coin.pricingData.CAD.market_cap) CAD"
    }
    
    var maxSupplyLabel: String {
        
        if let maxSupply = self.coin.maxSupply {
            return "Max Supply: \(maxSupply)"
        } else {
            return "--\n"
        }
    }
}
