//
//  SourceResponse.swift
//  NewsApp
//
//  Created by Aprizal on 25/3/21.
//

// MARK: - SourceResponse
struct SourceResponse: Codable {
    let status: String
    let sources: [Source]
}

// MARK: - Source
struct Source: Codable {
    let id, name, sourceDescription: String
    let url: String
    let category, language, country: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case sourceDescription = "description"
        case url, category, language, country
    }
}
