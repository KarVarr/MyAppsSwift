//
//  ConfigureStackView + Ext.swift
//  DDTL
//
//  Created by Karen Vardanian on 15.11.2023.
//

import UIKit

extension MyListViewController {
    func configureStackView() {
        verticalStackViewForLabelAndPointingFingerImageView.stack.axis = .vertical
        verticalStackViewForLabelAndPointingFingerImageView.stack.alignment = .center
        verticalStackViewForLabelAndPointingFingerImageView.stack.spacing = 10
    }
}
