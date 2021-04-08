//
//  TestViewModel.swift
//  NewsApp
//
//  Created by Aprizal on 8/4/21.
//

import Foundation

class TestViewModel: BaseViewModel {
    var manager: APIClient = APIClient.shared
    var changeHandler: ((BaseViewModelChange) -> Void)?
    var responHandler: ((Swift.Result<Test, Error>) -> Void)!
    private var id: Int!
    
    var datums: [Datum] = [] {
        didSet {
            changeHandler?(.updateDataModel)
        }
    }
    

    init(idTest: Int) {
        self.id = idTest
        responHandler = { result in
            switch result {
            case .success(let response):
                self.datums.append(contentsOf: response.data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

    }
    
    func processGetTest() {
        self.manager.requestTest(route: .test(id: id), completion: responHandler)
    }
}
