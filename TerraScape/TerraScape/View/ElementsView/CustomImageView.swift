//
//  ImageView.swift
//  TerraScape
//
//  Created by Karen Vardanian on 12.05.2023.
//

import UIKit

class CustomImageView {
    let customImageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .red
        image.contentMode = .scaleAspectFit
        return image
    }()
}
