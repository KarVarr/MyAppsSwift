//
//  CustomButtonView.swift
//  DDTL
//
//  Created by Karen Vardanian on 03.11.2023.
//

import UIKit

class CustomButtonView {
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPink
        button.setTitleColor(.black, for: .normal)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        button.layer.cornerRadius = 44
        return button
    }()
}
