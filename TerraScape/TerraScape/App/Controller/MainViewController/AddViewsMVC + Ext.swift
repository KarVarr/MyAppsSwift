//
//  AddViewsMVC + Ext.swift
//  TerraScape
//
//  Created by Karen Vardanian on 23.08.2024.
//

import UIKit

extension MainViewController {
    func addViewsMVC() {
        view.addSubview(uiCollectionView.customCollectionView)
        view.addSubview(toolbar)
    }
}
