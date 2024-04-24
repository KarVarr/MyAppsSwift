//
//  ProductDetailTableViewCell.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 24.04.2024.
//

import UIKit

class ProductDetailTableViewCell: UITableViewCell {
    let titleLabelPDVC = LabelViewCustom()
    
    override func awakeFromNib() {
        super.awakeFromNib()    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        addViews()
        configureCell()
        configureLabels()
        layoutCell()
    }
    
    private func addViews() {
        contentView.addSubview(titleLabelPDVC.label)
    }
    
    private func configureCell() {
        
    }
    
    private func configureLabels() {
        
    }
    
    private func layoutCell() {
        NSLayoutConstraint.activate([
            titleLabelPDVC.label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabelPDVC.label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
}
