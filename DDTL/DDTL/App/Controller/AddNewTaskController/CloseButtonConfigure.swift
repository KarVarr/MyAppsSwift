//
//  CloseButtonConfigure.swift
//  DDTL
//
//  Created by Karen Vardanian on 03.11.2023.
//

import UIKit

extension AddNewTaskViewController {
    func closeButtonConfigure() {
//        closeButton.button.setImage(UIImage(named: "closeButton"), for: .normal)
//        closeButton.button.imageView?.contentMode = .scaleAspectFit
//        closeButton.button.tintColor = .systemPink
       
        closeButton.button.addSubview(closeButtonCALayer.view)
        closeButton.button.addSubview(doneButtonCALayer.view)
        closeButtonCALayer.view.frame = closeButton.button.bounds
        
        closeButton.button.addTarget(self, action: #selector(closeView), for: .touchUpInside)
    }
    
    @objc func closeView() {
        dismiss(animated: true)
    }
    
}
