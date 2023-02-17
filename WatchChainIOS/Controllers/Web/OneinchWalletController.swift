//
//  OneinchWalletController.swift
//  WatchChainIOS
//
//  Created by Alexej K on 17.02.23.
//

import UIKit
import WebKit

class OneinchWalletController: UIViewController {
    
    @IBOutlet weak var oforwardButton: UIButton!
    @IBOutlet weak var obackButton: UIButton!
    @IBOutlet weak var osearchBar: UISearchBar!
    @IBOutlet weak var owebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://1inch.io/wallet/")!
        owebView.load(URLRequest(url: url))
        owebView.allowsBackForwardNavigationGestures = true
        owebView.navigationDelegate = self
        
        // SearchBar
        osearchBar.text = url.absoluteString
        osearchBar.delegate = self
        osearchBar.autocapitalizationType = .none
    }
    
    @IBAction func obackPress(_ sender: Any) {
        owebView.goBack()
    }
    
    @IBAction func oforwardPress(_ sender: Any) {
        owebView.goForward()
    }
}

extension OneinchWalletController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!) {
        self.osearchBar.text = owebView.url!.absoluteString
    }
}

extension OneinchWalletController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchText = osearchBar.text!
        searchBar.resignFirstResponder()
        let newURL = URL(string: "https://\(searchText)")!
        owebView.load(URLRequest(url: newURL))
        osearchBar.text = newURL.absoluteString
    }
}
