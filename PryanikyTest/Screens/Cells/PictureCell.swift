//
//  PictureCell.swift
//  PryanikyTest
//
//  Created by mac on 31.05.2022.
//

import UIKit

final class PictureCell: UITableViewCell {
    
    static let identifier = String(describing: PictureCell.self)
    
    lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    lazy var pictureImageView: UIImageView = {
        let picture = UIImageView()
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.contentMode = .scaleAspectFit
        picture.layer.cornerRadius = 20
        picture.clipsToBounds = true
        return picture
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping 
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
        let url = URL(string: model?.data.url ?? "")
        pictureImageView.sd_setImage(with: url, completed: nil)
    }
    
    private func setupViews() {
        contentView.addSubview(backView)
        contentView.addSubview(pictureImageView)
        contentView.addSubview(nameLabel)
    }
    
    private func setupConstraints() {
        backView.pinEdgesToSuperView(top: 8, bottom: 8, left: 20, right: 20)
        
        NSLayoutConstraint.activate([
            pictureImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            pictureImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pictureImageView.widthAnchor.constraint(equalToConstant: 300),
            pictureImageView.heightAnchor.constraint(equalToConstant: 300),
            
            nameLabel.topAnchor.constraint(equalTo: pictureImageView.bottomAnchor, constant: 20),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ])
    }
}

