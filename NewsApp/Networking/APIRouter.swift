//
//  APIRouter.swift
//  NewsApp
//
//  Created by Aprizal on 24/3/21.
//

import Foundation
import Alamofire

enum APIRouter: APIConfiguration {
    
    case source(category: String)
    case article(id: String)
    
    //MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .source,
             .article:
            return .get
        }
    }
    
    
    var parameters: RequestParams {
        switch self {
        case .source(let category):
            return.url(["category": category, "apiKey":"4a27365f23b24d8eb502b59016e31f07" ])
        case .article(let id):
            return.url(["sources": id, "apiKey":"4a27365f23b24d8eb502b59016e31f07" ])
        }
    }
    
    var path: String {
        switch self {
        case .source:
            return "/sources"
        case .article:
            return "/top-headlines"
        }
    }

    //MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        //HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        //Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        //Parameters
        
        switch parameters {
        case .body(let params):
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
        case .url(let params):
            let queryParams = params.map { pair in
                return URLQueryItem(name: pair.key, value: "\(pair.value)")
            }
            var components = URLComponents(string: url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            urlRequest.url = components?.url
        }
        return urlRequest
    }
    
  
}
