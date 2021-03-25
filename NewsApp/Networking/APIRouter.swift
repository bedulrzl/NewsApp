//
//  APIRouter.swift
//  NewsApp
//
//  Created by Aprizal on 24/3/21.
//

import Foundation
import Alamofire

enum APIRouter: APIConfiguration {
    
    case category(source: String)
    
    //MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .category:
            return .get
        }
    }
    
    
    var parameters: RequestParams {
        switch self {
        case .category(let name):
            return.url(["category": name, "apiKey":"54abb45a32314dc485cf180629b23189", ])
        }
    }
    
    var path: String {
        switch self {
        case .category:
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
