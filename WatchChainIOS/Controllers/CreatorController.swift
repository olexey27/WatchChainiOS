//
//  CreatorController.swift
//  WatchChainIOS
//
//  Created by Alexej K on 31.01.23.
//

import UIKit

class CreatorController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collector: Collector?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.allowsSelection = false
    }
}

extension CreatorController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return collector?.collection.count ?? 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NftViewCell", for: indexPath) as! NftViewCell
        
        let nft = collector?.collection[indexPath.row]
        return UICollectionViewCell.init().self
    }
}
