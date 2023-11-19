//
//  TableViewCell.swift
//  DDTL
//
//  Created by Karen Vardanian on 03.11.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    let titleLabel = CustomLabelView()
    let dateLabel = CustomLabelView()
    
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        addViews()
        configureCell()
        layoutCell()
    }
    
    private func addViews() {
        contentView.addSubview(titleLabel.label)
        contentView.addSubview(dateLabel.label)
    }
    
    private func configureCell() {
        titleLabel.label.font = Helper.Fonts.RighteousRegular(with: 22)
        dateLabel.label.font = Helper.Fonts.BlackOpsOneRegular(with: 16)
    }
    
    private func layoutCell() {
        let titleLabel = titleLabel.label
        let dateLabel = dateLabel.label
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            dateLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
    
    
    
}

