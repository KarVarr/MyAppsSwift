//
//  ProductDetailsCellHeader.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 03.05.2024.
//

import UIKit

class ProductDetailsCellHeader: UITableViewHeaderFooterView {
    let headerTitleLabel = LabelViewCustom()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with title: String) {
        headerTitleLabel.label.textColor = .black
        headerTitleLabel.label.font = UIFont(name: "Copperplate", size: 18)
        headerTitleLabel.label.text = title
        setupUI()
    }
    
    private func setupUI() {
        let headerView = UIView()
        headerView.backgroundColor = .lightGray
        self.backgroundView = headerView
        
        self.addSubview(headerTitleLabel.label)
        
        NSLayoutConstraint.activate([
            headerTitleLabel.label.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            headerTitleLabel.label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerTitleLabel.label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
