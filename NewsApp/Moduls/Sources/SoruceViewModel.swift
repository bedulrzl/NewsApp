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
    var changeHandlerFilter: ((BaseViewModelChange) -> Void)?
    var didSelectedSource: ((_ id : String) -> Void)?
    private var category: String?
    private var responHandler: ((Swift.Result<SourceResponse, Error>) -> Void)!
    
    var sources: [Source] = [] {
        didSet {
            changeHandler?(.updateDataModel)
        }
    }
    
    var filteredSources: [Source] = [] {
        didSet {
            changeHandlerFilter?(.updateDataModel)
        }
    }
    
    init(categoryName: String) {
        self.category = categoryName
        responHandler = { result in
            switch result {
            case .success(let response):
                self.sources.append(contentsOf: response.sources)
                print(self.sources)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func processShowArticle(indexPath: IndexPath) {
        self.didSelectedSource?(sources[indexPath.row].id)
    }
    
    func processGetSource() {
        self.manager.request(route: .source(category: category ?? ""), completion: responHandler)
    }
    
    func filterForSource(_ searchText: String) {
        filteredSources = sources.filter{ (sourcest: Source) -> Bool in
            return sourcest.name.lowercased().contains(searchText.lowercased())
        }
        print(filteredSources)

    }
    
}
