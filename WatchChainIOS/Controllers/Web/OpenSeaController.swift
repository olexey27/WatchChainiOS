//
//  OpenSeaController.swift
//  WatchChainIOS
//
//  Created by Alexej K on 08.02.23.
//

import UIKit
import WebKit
import Firebase

class OpenSeaController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://opensea.io/de-DE/collection/clonex")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self
        
        // SearchBar
        searchBar.text = url.absoluteString
        searchBar.delegate = self
        searchBar.autocapitalizationType = .none
    }
    
    @IBAction func forwardPresses(_ sender: UIButton) {
        webView.goForward()
    }
    
    @IBAction func backwardPressed(_ sender: UIButton) {
        webView.goBack()
    }
}

extension OpenSeaController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!) {
        self.searchBar.text = webView.url!.absoluteString
    }
}

extension OpenSeaController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchText = searchBar.text!
        searchBar.resignFirstResponder()
        let newURL = URL(string: "https://\(searchText)")!
        webView.load(URLRequest(url: newURL))
        searchBar.text = newURL.absoluteString
    }
}
