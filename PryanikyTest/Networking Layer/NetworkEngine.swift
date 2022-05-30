//
//  NetworkEngine.swift
//  PryanikyTest
//
//  Created by mac on 29.05.2022.
//

import Alamofire

final class NetworkEngine {
    //1
    class func request<T: Codable>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> ()) {
        
        //2
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.baseURL
        components.path = endpoint.path
        // components.queryItems = endpoint.parameters
        
        //3
        guard let url = components.url else { return }
        
        //4
        AF.request(url,
                   method: endpoint.method,
                   parameters: endpoint.parameters).responseData { responseData in
            //5
            guard responseData.error == nil else {
                completion(.failure(responseData.error!))
                print(responseData.error?.localizedDescription ?? "Unknown error")
                return
            }
            
            guard responseData.response != nil, let data = responseData.data else { return }
            
            let decoder = JSONDecoder()
            do {
                let pryanikObject = try decoder.decode(T.self, from:data)
                print("Response :", pryanikObject)
                completion(.success(pryanikObject))
            } catch {
                print(error)
            }
        }
    }
}
