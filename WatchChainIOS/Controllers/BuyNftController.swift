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
    @IBOutlet weak var backgroundImg: UIImageView!
    
    let apiClient = APIClient()
    
    var collection: NftCollection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        backgroundImg.loadGif(name: "giphyImg")
        
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
    
    @IBAction func addFavorite(_ sender: Any) {
        let add = UIAlertController(title: "Add To Favorite", message: "Are you sure you want to add this to your Favorite?", preferredStyle: .alert)
        
        //add.addTextField()
        
        /*add.addAction(UIAlertAction(title: "YES", style: .default, handler: {(_) in
            let text = alert.textFields?.first?.text
         if(!text!.isEmpty){
         self.IN Favoriten wird es gespeichert.text! += "\(text!)\n"}}))*/
        
        add.addAction(UIAlertAction(title: "Yes", style: .cancel))
        add.addAction(UIAlertAction(title: "No", style: .default))
        
        present(add, animated: true)
    }
}
