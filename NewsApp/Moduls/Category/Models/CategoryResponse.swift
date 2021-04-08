//
//  CategoryResponse.swift
//  NewsApp
//
//  Created by Aprizal on 24/3/21.
//

import Foundation
import UIKit

struct CategoryResponse: Codable {
    let categorys : [Category]
}

struct Category: Codable {
    let id: Int
    let name: String
}

extension CategoryResponse {
    static func DataCategory() -> CategoryResponse {
        let dataArr = [Category(id: 1, name: "business"), Category(id: 2, name: "entertainment"), Category(id: 3, name: "general"), Category(id: 4, name: "health"), Category(id: 5, name: "science"), Category(id: 6, name: "sports"), Category(id: 7, name: "technology")]
    
       return CategoryResponse(categorys: dataArr)
    }
}
