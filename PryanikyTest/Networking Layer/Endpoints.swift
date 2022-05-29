//
//  Endpoints.swift
//  PryanikyTest
//
//  Created by mac on 29.05.2022.
//

import Foundation
import Alamofire

// https://pryaniky.com/static/json/sample.json

protocol Endpoint {
    // HTTPS
    var scheme: String { get }
    
    // https://pryaniky.com
    var baseURL: String { get }
    
    // /static/json/sample.json
    var path: String { get }
    
    // -
    var parameters: Parameters? { get }
    
    // "GET"
    var method: HTTPMethod { get }
}
