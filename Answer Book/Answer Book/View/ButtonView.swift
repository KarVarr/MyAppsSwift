//
//  ButtonView.swift
//  Answer Book
//
//  Created by Karen Vardanian on 17.09.2023.
//

import UIKit

class ButtonView {
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ask question", for: .normal)
        button.titleLabel?.font = Helper.Font.noteworthyBold(with: 20)
        button.backgroundColor = Helper.Colors.yellow
        return button
    }()
}

