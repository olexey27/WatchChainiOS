//
//  BuyNftController.swift
//  WatchChainIOS
//
//  Created by Alexej K on 02.02.23.
//

import UIKit
import AVFoundation
import Firebase

class BuyNftController: UIViewController {
    
    @IBOutlet weak var nftView: UIImageView!
    @IBOutlet weak var nftName: UILabel!
    @IBOutlet weak var nftPrice: UILabel!
    @IBOutlet weak var backgroundImg: UIImageView!
    
    var player: AVAudioPlayer?
    
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
    @IBAction func buyPressed(_ sender: UIButton) {
        playSound()
    }
            
    func playSound() {
        guard let url = Bundle.main.url(forResource: "mr-krabs-money", withExtension: "mp3") else
        { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
