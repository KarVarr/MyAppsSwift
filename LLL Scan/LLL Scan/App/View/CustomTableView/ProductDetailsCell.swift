//
//  ProductDetailsCell.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 01.05.2024.
//

import UIKit

class ProductDetailsCell: UITableViewCell {
    let labelView = LabelViewCustom()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        addViews()
        configureCell()
        configureLabels()
        layoutCell()
    }
    
    private func addViews() {
        contentView.addSubview(labelView.label)
    }
    
    private func configureCell() {
        
    }
    
    private func configureLabels() {
        labelView.label.numberOfLines = 0
        labelView.label.lineBreakMode = .byTruncatingTail
        labelView.label.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
    
    private func layoutCell() {
        NSLayoutConstraint.activate([
            labelView.label.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            labelView.label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            labelView.label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            labelView.label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with attribute: String) {
        labelView.label.text = attribute
    }
    
}
