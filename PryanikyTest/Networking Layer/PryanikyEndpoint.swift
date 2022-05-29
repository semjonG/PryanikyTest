//
//  PryanikyEndpoint.swift
//  PryanikyTest
//
//  Created by mac on 29.05.2022.
//

import Foundation
import Alamofire

enum PryanikyEndpoint: Endpoint {
    
    case getSearchResults
    
    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return "pryaniky.com"
        }
    }
    
    var path: String {
        switch self {
        case .getSearchResults:
            return "/static/json/sample.json"
        }
    }
    
    var parameters: Parameters? {
//        let apiKey = ""
        
        switch self {
        default:
            return [:]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getSearchResults:
            return HTTPMethod.get
        }
    }
}
