//
//  ViewController.swift
//  PryanikyTest
//
//  Created by mac on 26.05.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var screenElements = ["hz", "selector", "picture", "hz"]

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds)
        
        tableView.register(HZCell.self, forCellReuseIdentifier: HZCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        print(HZCell.identifier, type(of: HZCell.identifier))
        NetworkEngine.request(endpoint: PryanikyEndpoint.getResults) { (result: Result<PryanikyResponse, Error>) in
            switch result {
                
            case .success(let pryanikObject):
                print(type(of: pryanikObject))
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func setupViews() {
        self.view.addSubview(tableView)
        
        
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return screenElements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HZCell.identifier, for: indexPath) as! HZCell
        cell.nameLabel.text = screenElements[indexPath.row]
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    
}
