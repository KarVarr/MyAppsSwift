//
//  ImageViewCustom.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 31.03.2024.
//

import UIKit

class ImageViewCustom {
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
}
