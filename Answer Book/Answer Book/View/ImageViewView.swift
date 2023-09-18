//
//  ImageViewView.swift
//  Answer Book
//
//  Created by Karen Vardanian on 18.09.2023.
//

import UIKit

class ImageViewView {
    let imageContainer: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
//        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        
        return image
    }()
}
