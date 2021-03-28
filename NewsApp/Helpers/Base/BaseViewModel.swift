//
//  BaseViewModel.swift
//  NewsApp
//
//  Created by Aprizal on 24/3/21.
//

import Foundation

protocol BaseViewModel  {
    var manager: APIClient { get set }
    var changeHandler: ((BaseViewModelChange) -> Void)? {get set}
}

enum BaseViewModelChange {
    case loaderStart
    case loaderEnd
    case updateDataModel
    case error(message: String)
}

enum DetailChanges {
    case start(String)
    case finish
    case failure(String)
}
