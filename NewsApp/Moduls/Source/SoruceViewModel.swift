//
//  SoruceViewModel.swift
//  NewsApp
//
//  Created by Aprizal on 25/3/21.
//

import Foundation

class SourceViewModel: BaseViewModel{
    
    var manager: APIClient = APIClient.shared
    var changeHandler: ((BaseViewModelChange) -> Void)?
    private var name: String?
    private var responHandler: ((Swift.Result<SourceResponse, Error>) -> Void)!
    var articles: [Article] = [] {
        didSet {
            changeHandler?(.updateDataModel)
        }
    }
    
    init(SourceName: String) {
        self.name = SourceName
        getSource()
    }
    
    func getSource(){
        responHandler = { result in
            switch result {
            case .success(let response):
                self.articles.append(contentsOf: response.articles)
                print(self.articles)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func processGetSource() {
        self.manager.request(route: .category(source: name!), completion: responHandler)
    }
    
}
