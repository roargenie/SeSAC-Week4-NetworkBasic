//
//  WebViewController.swift
//  SeSAC Week4 NetworkBasic
//
//  Created by 이명진 on 2022/07/28.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var webView: WKWebView!
    
    var destinationURL: String = "https://www.apple.com"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        openWebPage(url: destinationURL)
        searchBar.delegate = self
        
        
    }
    
    func openWebPage(url: String) {
        guard let url = URL(string: url) else {
            print("Invaild URL")
            return
        }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
}

extension WebViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        openWebPage(url: searchBar.text!)
        
    }
}
