//
//  CustomImageView.swift
//  DDTL
//
//  Created by Karen Vardanian on 15.11.2023.
//

import UIKit


class CustomImageView {
    let imageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
}
