//
//  WorldListVCTableViewCell.swift
//  DDTL
//
//  Created by Karen Vardanian on 06.12.2023.
//

import UIKit

class WorldListVCTableViewCell: UITableViewCell {
    let titleLabel = CustomLabelView()
    let descriptionLabel = CustomLabelView()
    let dateLabel = CustomLabelView()
    let likesLabel = CustomLabelView()

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
        contentView.addSubview(descriptionLabel.label)
        contentView.addSubview(dateLabel.label)
        contentView.addSubview(likesLabel.label)
    }
    
    private func configureCell() {
       
    }
    
    private func layoutCell() {
       
    }

}
