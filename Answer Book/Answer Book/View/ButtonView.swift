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
        button.setTitle(Helper.String.buttonTitleBeforePress, for: .normal)
        button.backgroundColor = Helper.Colors.yellow
        return button
    }()
}

