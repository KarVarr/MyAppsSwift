//
//  ToolbarView.swift
//  TerraScape
//
//  Created by Karen Vardanian on 22.05.2023.
//

import UIKit

class ToolbarView: UIView {
    
    let toolbarLabel = ToolbarLabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        settings()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addViews() {
        addSubview(toolbarLabel.toolbarLabel.customLabel)
    }
    
    func settings() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black
        layer.cornerRadius = 40
    }
    
    func layout() {
        let label = toolbarLabel.toolbarLabel.customLabel
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    
}
