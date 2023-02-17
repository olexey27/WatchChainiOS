//
//  PhantomWalletController.swift
//  WatchChainIOS
//
//  Created by Alexej K on 17.02.23.
//

import UIKit
import WebKit

class PhantomWalletController: UIViewController {
    
    @IBOutlet weak var pforwardButton: UIButton!
    @IBOutlet weak var pbackButton: UIButton!
    @IBOutlet weak var psearchBar: UISearchBar!
    @IBOutlet weak var pwebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://phantom.app/")!
        pwebView.load(URLRequest(url: url))
        pwebView.allowsBackForwardNavigationGestures = true
        pwebView.navigationDelegate = self
        
        // SearchBar
        psearchBar.text = url.absoluteString
        psearchBar.delegate = self
        psearchBar.autocapitalizationType = .none
    }
    
    @IBAction func pbackPress(_ sender: Any) {
        pwebView.goBack()
    }
    
    @IBAction func pforwardPress(_ sender: Any) {
        pwebView.goForward()
    }
}

extension PhantomWalletController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!) {
        self.psearchBar.text = pwebView.url!.absoluteString
    }
}

extension PhantomWalletController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchText = psearchBar.text!
        searchBar.resignFirstResponder()
        let newURL = URL(string: "https://\(searchText)")!
        pwebView.load(URLRequest(url: newURL))
        psearchBar.text = newURL.absoluteString
    }
}
