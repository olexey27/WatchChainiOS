//
//  BrowserController.swift
//  WatchChainIOS
//
//  Created by Alexej K on 04.01.23.
//

import UIKit

class BrowserController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let apiClient = APIClient()
    
    var selectedCollector: Collector?
    var collectors: [Collector]?

    override func viewDidLoad() {
        super.viewDidLoad()
                
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsSelection = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        apiClient.downloadNftInfo { response in
            print(response)
            self.collectors = response
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nftSeque" {
            let destinationView = segue.destination as! CreatorController
            destinationView.collector = selectedCollector
        }
    }
}

extension BrowserController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectors?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        guard let product = collectors?[indexPath.row] else {
            return cell
        }
        
        cell.collectionName.text = product.collectionName
        cell.collectorName.text = product.collectorName
        
        self.apiClient.downloadImage(imageUrl: URL(string: product.collection[0].nftImage)!) { image in
            DispatchQueue.main.async {
                cell.nftView1.image = image
            }
        }
        
        self.apiClient.downloadImage(imageUrl: URL(string: product.collection[1].nftImage)!) { image in
            DispatchQueue.main.async {
                cell.nftView2.image = image
            }
        }
        
        self.apiClient.downloadImage(imageUrl: URL(string: product.collection[2].nftImage)!) { image in
            DispatchQueue.main.async {
                cell.nftView3.image = image
            }
        }
        
        self.apiClient.downloadImage(imageUrl: URL(string: product.collectorLogo)!) { image in
            DispatchQueue.main.async {
                cell.logoImageView.image = image
            }
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCollector = collectors?[indexPath.row]
        performSegue(withIdentifier: "nftSeque", sender: self)
    }
}
