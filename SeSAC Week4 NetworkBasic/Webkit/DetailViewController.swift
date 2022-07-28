

import UIKit
import WebKit



class DetailViewController: UIViewController {
    
    static let identifier = "DetailViewController"
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var webView: WKWebView!
    
    var destinationURL: String = "https://www.naver.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        openWeb(destinationURL)
    }
    
    func openWeb(_ urlStr: String) {
        guard let url = URL(string: urlStr) else { return }
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
    
    @IBAction func goBackButtonTapped(_ sender: UIBarButtonItem) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func goForwardButtonTapped(_ sender: UIBarButtonItem) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func refreshButtonTapped(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
}

extension DetailViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let str = searchBar.text else { return }
        openWeb(str)
    }
}
