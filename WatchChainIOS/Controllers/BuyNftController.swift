//
//  BuyNftController.swift
//  WatchChainIOS
//
//  Created by Alexej K on 02.02.23.
//

import UIKit

class BuyNftController: UIViewController {
    
    @IBOutlet weak var nftView: UIImageView!
    @IBOutlet weak var nftName: UILabel!
    @IBOutlet weak var nftPrice: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    let apiClient = APIClient()
    
    var collection: [NftCollection]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

