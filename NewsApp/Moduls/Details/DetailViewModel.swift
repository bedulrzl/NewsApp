//
//  DetailViewModel.swift
//  NewsApp
//
//  Created by Aprizal on 27/3/21.
//

import Foundation
import WebKit

class DetailViewModel: NSObject, BaseViewModel, WKNavigationDelegate {
    
    var manager: APIClient = APIClient.shared
    var detailHandler: ((DetailChanges) -> Void)?
    var changeHandler: ((BaseViewModelChange) -> Void)? = nil
    
    var article: Article? {
        didSet {
            if let url = article?.url {
                detailHandler?(.start(url))
            }
        }
    }
    override init() {
        super.init()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        detailHandler?(.finish)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        detailHandler?(.finish)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        detailHandler?(.failure(error.localizedDescription))
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        detailHandler?(.failure(error.localizedDescription))
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        detailHandler?(.finish)
    }
}
