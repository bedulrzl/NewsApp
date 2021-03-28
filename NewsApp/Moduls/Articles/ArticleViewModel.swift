//
//  ArticleViewModel.swift
//  NewsApp
//
//  Created by Aprizal on 26/3/21.
//

import Foundation
import Alamofire

class ArticleViewModel: BaseViewModel {

    var manager: APIClient = APIClient.shared
    var changeHandler: ((BaseViewModelChange) -> Void)?
    var changeHandlerFilter: ((BaseViewModelChange) -> Void)?
    private var responHandler: ((Swift.Result<ArticleResponse, Error>) -> Void)!
    private var id: String?
    var didSelectedArticle: ((_ article: Article) -> Void)?

    var articles: [Article] = [] {
        didSet {
            changeHandler?(.updateDataModel)
        }
    }
    
    var filteredArticle: [Article] = [] {
        didSet {
            changeHandlerFilter?(.updateDataModel)
        }
    }

    init(sourceId: String) {
        self.id = sourceId
        responHandler = { result in
            switch result {
            case .success(let response):
                self.articles.append(contentsOf: response.articles)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

    }
    
    func processShowDetail(indexPath: IndexPath) {
        let article = articles[indexPath.row]
        self.didSelectedArticle?(article)
    }
    
    func processGetArticle() {
        guard let id = id else { return }
        self.manager.request(route: .article(id: id), completion: responHandler)
    }
    
    func filteredForArticle(_ searchText: String) {
        filteredArticle = articles.filter{ (articles: Article) -> Bool in
            return articles.title.lowercased().contains(searchText.lowercased())
        }
    }
}
