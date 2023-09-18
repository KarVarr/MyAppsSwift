//
//  LabelView.swift
//  Answer Book
//
//  Created by Karen Vardanian on 17.09.2023.
//

import UIKit

class LabelView {
    let label: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
}
