//
//  CustomScrollView.swift
//  TerraScape
//
//  Created by Karen Vardanian on 01.09.2024.
//

import UIKit

class CustomScrollView {
    let customScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.alwaysBounceVertical = true
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
}
