//
//  ImageView.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 26.09.2023.
//

import UIKit

class CustomImageView {
    let customImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
}
