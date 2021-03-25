//
//  CategoryResponse.swift
//  NewsApp
//
//  Created by Aprizal on 24/3/21.
//

import Foundation


struct CategoryResponse: Codable {
    let categorys : [Category]
}

struct Category: Codable {
    let id: Int
    let name: String
}

extension CategoryResponse {
    static func DataCategory() -> CategoryResponse {
        let dataArr = [Category(id: 10, name: "business"), Category(id: 11, name: "entertainment"), Category(id: 12, name: "general"), Category(id: 13, name: "health"), Category(id: 11, name: "science"), Category(id: 11, name: "sports"), Category(id: 11, name: "technology")]
       return CategoryResponse(categorys: dataArr)
    }
}
