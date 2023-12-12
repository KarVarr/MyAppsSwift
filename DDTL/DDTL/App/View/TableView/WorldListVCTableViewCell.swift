//
//  WorldListVCTableViewCell.swift
//  DDTL
//
//  Created by Karen Vardanian on 06.12.2023.
//

import UIKit

class WorldListVCTableViewCell: UITableViewCell {
    let titleLabel = CustomLabelView()
    let dateLabel = CustomLabelView()
    let likesLabel = CustomLabelView()

    override func awakeFromNib() {
        super.awakeFromNib()
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
        contentView.addSubview(likesLabel.label)
    }
    
    private func configureCell() {
       
    }
    
    private func layoutCell() {
        let titleLabel = titleLabel.label
        let dateLabel = dateLabel.label
        let likesLabel = likesLabel.label
        
        //MARK: - Title Label
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
        ])
        
        //MARK: - Date Label
        NSLayoutConstraint.activate([
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
        ])
        
        //MARK: - Likes Label
        NSLayoutConstraint.activate([
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            likesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }

}
