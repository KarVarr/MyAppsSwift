//
//  CustomLabel.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 26.09.2023.
//

import UIKit

class CustomLabel {
    let label: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
}
