//
//  BrowserNftAPI.swift
//  WatchChainIOS
//
//  Created by Alexej K on 13.01.23.
//

import Foundation
import UIKit
import Firebase

struct Response: Codable {
    var collectors: [Collector]
}

// MARK: API Client
struct APIClient {
    
    // MARK: Download Product Info
    func downloadNftInfo(completion: @escaping(Respons) -> Void) {
        
        let urlData = "https://public.syntax-institut.de/apps/batch2/AlexeyKrasnokutskiy/data.json"
        
        // Endpoint
        let url = URL(string: urlData)
        guard url != nil else {return}
        
        // Session
        let session = URLSession.shared
        
        // Data Task
        let dataTask = session.dataTask(with: url!, completionHandler: {
            data, response, error in
            guard let data = data, error == nil else {return}
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(Respons.self, from: data)
                completion(response)
            } catch {
                print("An eroor occured \(error)")
            }
        })
        dataTask.resume()
    }
    
    // MARK: Download Image
    /*func downloadImage(imageUrl: URL, completion: @escaping(UIImage) -> Void) {
        
        // Session
        let session = URLSession.shared
        
        // Donwload Task
        let downloadTask = session.downloadTask(with: imageUrl) { localURL, URLResponse, error in
            let image = UIImage(data: try! Data(contentsOf: localURL!))!
            completion(image)
        }
        downloadTask.resume()
    }*/
    
    // MARK: Download Image shows the file that no longer exists as nil
    func downloadImage(imageUrl: URL, completion: @escaping (UIImage?) -> Void) {
        let session = URLSession.shared
        let downloadTask = session.downloadTask(with: imageUrl) { localURL, _, error in
            if let localURL = localURL {
                if let imageData = try? Data(contentsOf: localURL), let image = UIImage(data: imageData) {
                    completion(image)
                } else {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
        downloadTask.resume()
    }
}

