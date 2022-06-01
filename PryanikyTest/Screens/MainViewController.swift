//
//  ViewController.swift
//  PryanikyTest
//
//  Created by mac on 26.05.2022.
//

import UIKit
import SDWebImage

enum CellType: String {
    case hz = "hz"
    case picture = "picture"
    case selector = "selector"
}

final class MainViewController: UIViewController {
    
   var viewModel = MainViewModel()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds)
        
        tableView.register(HZCell.self, forCellReuseIdentifier: HZCell.identifier)
        tableView.register(PictureCell.self, forCellReuseIdentifier: PictureCell.identifier)
        tableView.register(SelectorCell.self, forCellReuseIdentifier: SelectorCell.identifier)
        
        tableView.dataSource = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        viewModel.fetchData { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    private func setupViews() {
        self.view.addSubview(tableView)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.screenViews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellType = CellType(rawValue: viewModel.screenViews[indexPath.row])
        
        switch cellType {
            
        case .hz:
            let cell = tableView.dequeueReusableCell(withIdentifier: HZCell.identifier, for: indexPath) as! HZCell
            let hzObject = viewModel.screenResults.first(where: { $0.name == "hz" })
            cell.configure(hzObject)
            return cell
            
        case .picture:
            let cell = tableView.dequeueReusableCell(withIdentifier: PictureCell.identifier, for: indexPath) as! PictureCell
            let pictureObject = viewModel.screenResults.first(where: { $0.name == "picture" })
            cell.configure(pictureObject)
            return cell
            
        case .selector:
            let cell = tableView.dequeueReusableCell(withIdentifier: SelectorCell.identifier, for: indexPath) as! SelectorCell
            let selectorObject = viewModel.screenResults.first(where: { $0.name == "selector" })
            cell.configure(selectorObject)
            return cell

        case .none:
            return UITableViewCell()
        }
    }
}
