//
//  MainViewModel.swift
//  PryanikyTest
//
//  Created by mac on 01.06.2022.
//

import Foundation

final class MainViewModel {
    
    var screenResults: [DataResult] = []
    var screenViews: [String] = []
    
    func fetchData(completion: @escaping ()->()) {
        NetworkEngine.request(endpoint: PryanikyEndpoint.getResults) { (result: Result<PryanikyResponse, Error>) in
            switch result {
                
            case .success(let pryanikObject):
                self.screenViews = pryanikObject.view
                self.screenResults = pryanikObject.data
                
                completion()
                
            case .failure(let error):
                print(error)
                completion()
            }
        }
    }
}
