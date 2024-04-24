//
//  ProductDetailTableViewCell.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 24.04.2024.
//

import UIKit

class ProductDetailTableViewCell: UITableViewCell {
    let articleLabelPDVC = LabelViewCustom()
    let titleLabelPDVC = LabelViewCustom()
    let colorLabelPDVC = LabelViewCustom()
    let materialLabelPDVC = LabelViewCustom()
    let imagePDVC = ImageViewCustom()
    
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
        let views: [UIView] = [
            articleLabelPDVC.label,
            titleLabelPDVC.label,
            colorLabelPDVC.label,
            materialLabelPDVC.label,
            imagePDVC.imageView,
        ]
        
        for addView in views {
            contentView.addSubview(addView)
        }
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
