//
//  CloseButtonConfigure.swift
//  DDTL
//
//  Created by Karen Vardanian on 03.11.2023.
//

import UIKit

extension AddNewTaskViewController {
    func closeButtonConfigure() {
        closeButton.button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        closeButton.button.backgroundColor = .clear
        closeButton.button.titleLabel?.font = UIFont.systemFont(ofSize: 44)
        closeButton.button.tintColor = .white
        
        closeButton.button.addTarget(self, action: #selector(closeView), for: .touchUpInside)
    }
    
    @objc func closeView() {
        dismiss(animated: true)
    }
    
}
