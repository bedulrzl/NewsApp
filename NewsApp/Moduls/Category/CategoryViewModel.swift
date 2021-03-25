//
//  CategoryViewModel.swift
//  NewsApp
//
//  Created by Aprizal on 24/3/21.
//

import UIKit
import Alamofire

class CategoryViewModel: BaseViewModel {
    
    var manager: APIClient = APIClient.shared
    var changeHandler: ((BaseViewModelChange) -> Void)?
    var didSelectCategory: ((_ name: String) -> Void)?
    var responHandler: ((Swift.Result<CategoryResponse, Error>) -> Void)!
    var data = CategoryResponse.DataCategory()
    

    var category: [Category] = [] {
        didSet {
            changeHandler?(.updateDataModel)
        }
    }
    
    init() {
        self.getData()
    }
    
    func processShowSource(indexPath: IndexPath) {
        self.didSelectCategory?(category[indexPath.row].name)
    }
   
    func getData() {
        self.category.append(contentsOf: data.categorys)
        print(category)
    }
    
}

