//
//  BrowserNftAPI.swift
//  WatchChainIOS
//
//  Created by Alexej K on 13.01.23.
//

import Foundation
import UIKit

struct Response: Codable {
    var collectors: [Collector]
}

struct APIClient {
    
    func downloadNftInfo(completion: @escaping(Response) -> Void) {
        
        let urlData = "https://public.syntax-institut.de/apps/batch2/AlexeyKrasnokutskiy/data.json"
        
        let url = URL(string: urlData)
        guard url != nil else {return}
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!, completionHandler: {
            data, response, error in
            
            guard let data = data, error == nil else {return}
            
            let decoder = JSONDecoder()
            
            do {
                let response = try decoder.decode(Response.self, from: data)
                
                completion(response)
            } catch{
                print("An eroor occured \(error)")
            }
        })
        
        dataTask.resume()
    }
    func downloadImage(imageUrl: URL, completion: @escaping(UIImage) -> Void) {
        let session = URLSession.shared
        
        let downloadTask = session.downloadTask(with: imageUrl) { localURL, URLResponse, error in
            
            let image = UIImage(data: try! Data(contentsOf: localURL!))!
            completion(image)
        }
        downloadTask.resume()
    }
}

