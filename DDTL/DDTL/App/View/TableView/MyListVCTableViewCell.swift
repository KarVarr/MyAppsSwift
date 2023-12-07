//
//  TableViewCell.swift
//  DDTL
//
//  Created by Karen Vardanian on 03.11.2023.
//

import UIKit

class MyListVCTableViewCell: UITableViewCell {
    let titleLabel = CustomLabelView()
    let dateLabel = CustomLabelView()
    
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
        contentView.addSubview(dateLabel.label)
    }
    
    private func configureCell() {
       
    }
    
    private func configureLabels() {
        titleLabel.label.font = Helper.Fonts.RighteousRegular(with: 28)
        titleLabel.label.textColor = Helper.Colors.darkBlue
        
        dateLabel.label.font = Helper.Fonts.BlackOpsOneRegular(with: 16)
        dateLabel.label.textColor = Helper.Colors.placeholder
    }
    
    private func layoutCell() {
        let titleLabel = titleLabel.label
        let dateLabel = dateLabel.label
        
        NSLayoutConstraint.activate([
            dateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
    
    
    
}

