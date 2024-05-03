//
//  ProductDetailsCell.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 01.05.2024.
//

import UIKit

class ProductDetailsCell: UITableViewCell {
    let articleLabel = LabelViewCustom()
    let titleLabel = LabelViewCustom()
    let colorLabel = LabelViewCustom()
    let materialLabel = LabelViewCustom()
    let descriptionLabel = LabelViewCustom()
    let priceLabel = LabelViewCustom()
    
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
        
    }
    
    private func configureCell() {
        
    }
    
    private func configureLabels() {
        
    }
    
    private func layoutCell() {
        
    }
    
    func configure(with attribute: String) {
        
    }
    
}
