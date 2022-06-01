//
//  SelectorCell.swift
//  PryanikyTest
//
//  Created by mac on 31.05.2022.
//

import UIKit

final class SelectorCell: UITableViewCell {

    static let identifier = String(describing: SelectorCell.self)
    
    lazy var segmentedControl: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    // MARK: - Init
    
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

        guard let variants = model?.data.variants else { return }
        for (index, item) in variants.enumerated() {
            segmentedControl.insertSegment(withTitle: item.text, at: index, animated: true)
        }
    }
    
    //MARK: - Private
    private func setupViews() {
        self.contentView.addSubview(segmentedControl)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            segmentedControl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            segmentedControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }
}
