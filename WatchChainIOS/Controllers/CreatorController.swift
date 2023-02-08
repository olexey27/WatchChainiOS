//
//  CreatorController.swift
//  WatchChainIOS
//
//  Created by Alexej K on 31.01.23.
//

import UIKit

class CreatorController: UIViewController {
    
    
    @IBOutlet weak var titelImgView: UIImageView!
    @IBOutlet weak var collectorName: UILabel!
    @IBOutlet weak var logoImg: UIImageView!
    
    @IBOutlet weak var collectionName: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let apiClient = APIClient()
    
    var collector: Collector?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.allowsSelection = false
        
        collectorName.text = collector?.collectorName
        collectionName.text = collector?.collectionName
    
        self.apiClient.downloadImage(imageUrl: URL(string: collector!.collectorTitleImg)!) { image in
            DispatchQueue.main.async {
                self.titelImgView.image = image
            }
            
        }
        self.apiClient.downloadImage(imageUrl: URL(string: collector!.collectorLogo)!) { image in
            DispatchQueue.main.async {
                self.logoImg.image = image
            }
            
        }
    }
}

extension CreatorController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return collector?.collection.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NftViewCell
        
        let nft = collector?.collection[indexPath.row]
        cell.nftName.text = nft?.nftName
        //cell.price.text = nft?.nftPrice.encode(to: Encoder()
        
        self.apiClient.downloadImage(imageUrl: URL(string: nft!.nftImage)!) { image in
            DispatchQueue.main.async {
                cell.imageView.image = image
            }
        }
        return cell
    }
    
    
}
