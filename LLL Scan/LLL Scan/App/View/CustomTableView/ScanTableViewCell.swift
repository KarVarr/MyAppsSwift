//
//  ScanTableViewCell.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 31.03.2024.
//

import UIKit

class ScanTableViewCell: UITableViewCell {
    let titleLabel = LabelViewCustom()
    
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
        contentView.addSubview(titleLabel.label)
    }
    
    private func configureCell() {
        
    }
    
    private func configureLabels() {
        
    }
    
    private func layoutCell() {
        NSLayoutConstraint.activate([
            titleLabel.label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
}
