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
    let vStackSTVCForLabelsTitleAndCount = ViewStackCustom()
    let hStackSTVCForVStackAndButton = ViewStackCustom()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addViews()
        configureLabels()
        configureStacks()
        layoutCell()
    }
    
    private func addViews() {
        //TODO: была идея добавить кнопку в конце ячейки, для этого тут есть hStack.
        vStackSTVCForLabelsTitleAndCount.stack.addArrangedSubview(titleLabel.label)
        vStackSTVCForLabelsTitleAndCount.stack.addArrangedSubview(countLabel.label)
        hStackSTVCForVStackAndButton.stack.addArrangedSubview(vStackSTVCForLabelsTitleAndCount.stack)
        
        contentView.addSubview(hStackSTVCForVStackAndButton.stack)
    }
    
    private func configureLabels() {
        countLabel.label.textColor = .lightGray
        countLabel.label.font = UIFont(name: "Copperplate", size: 14)
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
        let hStackSTVCForVStackAndButton = hStackSTVCForVStackAndButton.stack
        
        NSLayoutConstraint.activate([
            hStackSTVCForVStackAndButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            hStackSTVCForVStackAndButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            hStackSTVCForVStackAndButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            hStackSTVCForVStackAndButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            hStackSTVCForVStackAndButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
        ])
    }
    
}
