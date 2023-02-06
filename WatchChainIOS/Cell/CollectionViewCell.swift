//
//  CollectionViewCell.swift
//  WatchChainIOS
//
//  Created by Alexej K on 31.01.23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nftView1: UIImageView!
    @IBOutlet weak var nftView2: UIImageView!
    @IBOutlet weak var nftView3: UIImageView!
    @IBOutlet weak var aiLoadingNft1: UIActivityIndicatorView!
    @IBOutlet weak var aiLoadingNft2: UIActivityIndicatorView!
    @IBOutlet weak var aiLoadingNft3: UIActivityIndicatorView!
    
    @IBOutlet weak var collectionName: UITextView!
    @IBOutlet weak var collectorName: UITextView!
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var aiLoadingLogo: UIActivityIndicatorView!
}
    
