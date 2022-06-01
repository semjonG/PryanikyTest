//
//  HZCell.swift
//  PryanikyTest
//
//  Created by mac on 31.05.2022.
//

import UIKit

final class HZCell: UITableViewCell {
    
    static let identifier = String(describing: HZCell.self)
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0 // убрали ограничение по кол-ву строк для Лейбла (адаптация под экран)
        label.lineBreakMode = .byWordWrapping // перенос по слову
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
    
    //MARK: - Public
    func configure(_ model: DataResult?) {
        nameLabel.text = model?.data.text ?? ""
    }
    
    //MARK: - Private
    private func setupViews() {
        self.contentView.addSubview(nameLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ])
    }
}
