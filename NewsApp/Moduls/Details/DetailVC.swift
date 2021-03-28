//
//  DetailVC.swift
//  NewsApp
//
//  Created by Aprizal on 27/3/21.
//

import UIKit
import WebKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var webDetail: WKWebView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    weak var viewModel: DetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewmModel()
    }
    private func setupUI() {
        self.webDetail.navigationDelegate = viewModel
       
    }
    func bindViewmModel() {
        viewModel?.detailHandler = { change in
            switch change {
            case .start(let url):
                self.loadWebView(pageurl: url)
            case .failure(let errorMessage):
                //FAIL
                DispatchQueue.main.async {
                    self.showError(message: errorMessage)
                }
            case .finish:
                self.loadingIndicator.stopAnimating()
            }
        }
    }
    
    private func loadWebView(pageurl: String) {
        if let webURL = viewModel?.article?.url {
            guard let url = URL(string: webURL) else {return}
            self.loadingIndicator.startAnimating()
            webDetail.load(URLRequest(url: url))
        } else {
            self.loadingIndicator.stopAnimating()
        }
    }
 
    private func showError(message: String) {
        self.loadingIndicator.stopAnimating()
    }

}
