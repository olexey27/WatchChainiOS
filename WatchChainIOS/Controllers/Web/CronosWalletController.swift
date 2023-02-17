//
//  CronosWalletController.swift
//  WatchChainIOS
//
//  Created by Alexej K on 17.02.23.
//

import UIKit
import WebKit

class CronosWalletController: UIViewController {
    
    @IBOutlet weak var cforwardButton: UIButton!
    @IBOutlet weak var cbackButton: UIButton!
    @IBOutlet weak var csearchBar: UISearchBar!
    @IBOutlet weak var cwebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://cronos.org/")!
        cwebView.load(URLRequest(url: url))
        cwebView.allowsBackForwardNavigationGestures = true
        cwebView.navigationDelegate = self
        
        // SearchBar
        csearchBar.text = url.absoluteString
        csearchBar.delegate = self
        csearchBar.autocapitalizationType = .none
    }
    
    @IBAction func cbackPress(_ sender: Any) {
        cwebView.goBack()
    }
    
    @IBAction func cforwardPress(_ sender: Any) {
        cwebView.goForward()
    }
}

extension CronosWalletController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!) {
        self.csearchBar.text = cwebView.url!.absoluteString
    }
}

extension CronosWalletController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchText = csearchBar.text!
        searchBar.resignFirstResponder()
        let newURL = URL(string: "https://\(searchText)")!
        cwebView.load(URLRequest(url: newURL))
        csearchBar.text = newURL.absoluteString
    }
}
