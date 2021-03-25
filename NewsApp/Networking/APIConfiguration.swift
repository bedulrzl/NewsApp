//
//  APIConfiguration.swift
//  NewsApp
//
//  Created by Aprizal on 24/3/21.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: RequestParams { get }
}

