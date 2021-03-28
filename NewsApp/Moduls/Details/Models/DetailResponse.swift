//
//  DetailResponse.swift
//  NewsApp
//
//  Created by Aprizal on 27/3/21.
//
//
//import Foundation
//
//struct DetailResponse {
//    let status: String
//    let totalResults: Int
//    let articles: [ArticleDetail]
//}
//
//struct ArticleDetail: Codable {
//    let source: SourceDetail
//    let author: String?
//    let title: String
//    let articleDescription: String?
//    let url: String
//    let urlToImage: String?
//    let publishedAt: String
//    let content: String
//
//    enum CodingKeys: String, CodingKey {
//        case source, author, title
//        case articleDescription = "description"
//        case url, urlToImage, publishedAt, content
//    }
//
//}
//
//struct SourceDetail: Codable {
//    let id: String?
//    let name: String
//}
