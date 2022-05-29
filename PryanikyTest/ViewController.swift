//
//  ViewController.swift
//  PryanikyTest
//
//  Created by mac on 26.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkEngine.request(endpoint: PryanikyEndpoint.getSearchResults) { (result: Result<PryanikyResponse, Error>) in
            switch result {
                
            case .success(let pryanikObject):
                print(type(of: pryanikObject))
                
            case .failure(let error):
                print(error)
            }
        }
        
    }


}

