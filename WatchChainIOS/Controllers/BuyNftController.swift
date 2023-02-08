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
    
    let apiClient = APIClient()
    
    var collection: NftCollection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nftName.text = collection?.nftName
        
        self.apiClient.downloadImage(imageUrl: URL(string: collection!.nftImage)!) { image in
            DispatchQueue.main.async {
                self.nftView.image = image
            }
        }
        switch collection?.nftPrice {
                case .double(let x):
                    nftPrice.text = x.description
                case .string(let x):
                    nftPrice.text = x
                default:
                    break
                }
    }
}
