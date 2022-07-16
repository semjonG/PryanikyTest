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
        tableView.delegate = self
        tableView.separatorColor = UIColor.clear
        
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
            cell.selectionStyle = .none
            return cell
            
        case .picture:
            let cell = tableView.dequeueReusableCell(withIdentifier: PictureCell.identifier, for: indexPath) as! PictureCell
            let pictureObject = viewModel.screenResults.first(where: { $0.name == "picture" })
            cell.configure(pictureObject)
            cell.selectionStyle = .none
            return cell
            
        case .selector:
            let cell = tableView.dequeueReusableCell(withIdentifier: SelectorCell.identifier, for: indexPath) as! SelectorCell
            let selectorObject = viewModel.screenResults.first(where: { $0.name == "selector" })
            cell.configure(selectorObject)
            
            cell.onSegmentSelectTitle = { title in
//                self.showAlert(with: title, variantID: variantID)
                self.showAlert(with: title)
            }
            cell.selectionStyle = .none
            return cell

        case .none:
            return UITableViewCell()
        }
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        UIView.animate(withDuration: 0.2, animations: {
            let cell = tableView.cellForRow(at: indexPath)
            cell?.frame = CGRect(x: (cell?.frame.origin.x)!-15,
                                 y: (cell?.frame.origin.y)!,
                                 width: cell!.bounds.size.width,
                                 height: cell!.bounds.size.height)

        }) { (finished) in
            UIView.animate(withDuration: 0.3, animations: {
                let cell = tableView.cellForRow(at: indexPath)
                cell?.frame = CGRect(x: (cell?.frame.origin.x)!+15,
                                     y: (cell?.frame.origin.y)!,
                                     width: cell!.bounds.size.width,
                                     height: cell!.bounds.size.height)
            })
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        guard let index = tableView.indexPathForSelectedRow?.row else { return }

        let viewKey = viewModel.screenViews[index] //hz, selector, picture, hz
        
        guard let viewData: DataResult = viewModel.screenResults.first(where: { $0.name == "\(viewKey)" }) else { return }
        
        if viewData.name == "selector" {
            tableView.deselectRow(at: indexPath, animated: true)
            return
        }
        showAlert(with: viewData.data.text)
    }
    
    func showAlert(with message: String?) { // nil для 2х параметров
        
        let alertController = UIAlertController(title: "Объект",
                                                message: "\(message ?? "")",
                                                preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true)
    }
}

