//
//  PictureCell.swift
//  PryanikyTest
//
//  Created by mac on 31.05.2022.
//

import UIKit

final class PictureCell: UITableViewCell {
    
    static let identifier = String(describing: PictureCell.self)
    
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
        let url = URL(string: model?.data.url ?? "")
        pictureImageView.sd_setImage(with: url, completed: nil)
    }
    
    private func setupViews() {
        self.contentView.addSubview(pictureImageView)
        self.contentView.addSubview(nameLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            pictureImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            pictureImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pictureImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            pictureImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: pictureImageView.bottomAnchor, constant: 20),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ])
    }
}

