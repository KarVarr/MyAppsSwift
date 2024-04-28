//
//  ScanTableViewCell.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 31.03.2024.
//

import UIKit

class ScanTableViewCell: UITableViewCell {
    let titleLabel = LabelViewCustom()
    let countLabel = LabelViewCustom()
    let buttonConvertToCSV = ButtonViewCustom()
    let vStackSTVCForLabelsTitleAndCount = ViewStackCustom()
    let hStackSTVCForVStackAndButton = ViewStackCustom()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        addViews()
        configureCell()
        configureLabels()
        configureStacks()
        layoutCell()
        
    }
    
    
    private func addViews() {
        contentView.addSubview(vStackSTVCForLabelsTitleAndCount.stack)
        contentView.addSubview(hStackSTVCForVStackAndButton.stack)
        
        vStackSTVCForLabelsTitleAndCount.stack.addArrangedSubview(titleLabel.label)
        vStackSTVCForLabelsTitleAndCount.stack.addArrangedSubview(countLabel.label)
        hStackSTVCForVStackAndButton.stack.addArrangedSubview(vStackSTVCForLabelsTitleAndCount.stack)
        hStackSTVCForVStackAndButton.stack.addArrangedSubview(buttonConvertToCSV.button)
    }
    private func configureCell() {
        
    }
    
    private func configureLabels() {
        
    }
    
    private func configureStacks() {
        vStackSTVCForLabelsTitleAndCount.stack.axis = .vertical
        vStackSTVCForLabelsTitleAndCount.stack.distribution = .fillEqually
        vStackSTVCForLabelsTitleAndCount.stack.spacing = 5
        vStackSTVCForLabelsTitleAndCount.stack.alignment = .leading
        
        hStackSTVCForVStackAndButton.stack.axis = .horizontal
        hStackSTVCForVStackAndButton.stack.distribution = .fillEqually
        hStackSTVCForVStackAndButton.stack.alignment = .center
    }
    
    private func layoutCell() {
        let vStackSTVCForLabelsTitleAndCount = vStackSTVCForLabelsTitleAndCount.stack
        let hStackSTVCForVStackAndButton = hStackSTVCForVStackAndButton.stack
        
        NSLayoutConstraint.activate([
            hStackSTVCForVStackAndButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            hStackSTVCForVStackAndButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            hStackSTVCForVStackAndButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            vStackSTVCForLabelsTitleAndCount.leadingAnchor.constraint(equalTo: hStackSTVCForVStackAndButton.leadingAnchor, constant: 20),
            vStackSTVCForLabelsTitleAndCount.centerYAnchor.constraint(equalTo: hStackSTVCForVStackAndButton.centerYAnchor),
        ])
    }
    
}
