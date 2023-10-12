//
//  Button + Ext.swift
//  Answer Book
//
//  Created by Karen Vardanian on 12.10.2023.
//

import Foundation

extension MainViewController {
    //MARK: - Button
    func configureShakeButton() {
        shakeButton.button.titleLabel?.font = Helper.Font.noteworthyBold(with: dynamicFontSize(20))
        shakeButton.button.layer.cornerRadius = shakeButton.button.frame.height / 2
        shakeButton.button.addTarget(self, action: #selector(shakeButtonPressed), for: .touchUpInside)
    }
}
