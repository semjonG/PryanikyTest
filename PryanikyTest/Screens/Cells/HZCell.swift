//
//  HZCell.swift
//  PryanikyTest
//
//  Created by mac on 31.05.2022.
//

import UIKit

final class HZCell: UITableViewCell {
    
    static let identifier = String(describing: HZCell.self)
    
    lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0 
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - cell shadow
    override func layoutSubviews() {
        contentView.backgroundColor = UIColor.clear
        backgroundColor = UIColor.clear
        backView.layer.cornerRadius = 12
        backView.clipsToBounds = true
        
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = .zero
    }
    
    //MARK: - Public
    func configure(_ model: DataResult?) {
        nameLabel.text = model?.data.text ?? ""
    }
    
    //MARK: - Private
    private func setupViews() {
        
        contentView.addSubview(backView)
        contentView.addSubview(nameLabel)
    }
    
    private func setupConstraints() {
        backView.pinEdgesToSuperView(top: 8, bottom: 8, left: 20, right: 20)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ])
    }
}



