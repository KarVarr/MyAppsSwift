//
//  Navigation + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 29.09.2023.
//

import UIKit


extension PictureOfDayViewController {
    //MARK: - Navigation
    func configureNavigation() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    
    
    //MARK: - Toolbar
    func configureToolbar() {
        customToolbar.view.backgroundColor = Helper.Colors.lightSkyBlue
        separateLineForToolbar.view.backgroundColor = Helper.Colors.lightGray.withAlphaComponent(0.8)
    }
    
    //MARK: - StackView For Toolbar
    func configureStackViews() {
        
        addImagesToToolbar()
        
        horizontalVStackForToolbar.sView.axis = .horizontal
        horizontalVStackForToolbar.sView.alignment = .center
        horizontalVStackForToolbar.sView.distribution = .fillEqually
        horizontalVStackForToolbar.sView.spacing = 20
    }
    
    private func addImagesToToolbar() {
        for imageName in imagesForToolbar.images {
            let imageView = CustomImageView()
            imageView.customImage.image = UIImage(named: imageName)
            imageView.customImage.contentMode = .scaleAspectFit
            imageView.customImage.isUserInteractionEnabled = true
            imageView.customImage.image = imageView.customImage.image?.withRenderingMode(.alwaysTemplate)
            imageView.customImage.tintColor = Helper.Colors.darkBlue
            horizontalVStackForToolbar.sView.addArrangedSubview(imageView.customImage)
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
            imageView.customImage.addGestureRecognizer(tapGesture)
        }
    }
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        guard let tappedImageView = sender.view as? UIImageView else { return }
        
        for subview in horizontalVStackForToolbar.sView.arrangedSubviews {
            if let imageView = subview as? UIImageView {
                view.layoutIfNeeded()
                if imageView == tappedImageView {
                    UIView.animate(withDuration: 0.3) {
                        imageView.tintColor = Helper.Colors.lightOrange
                        imageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                        self.view.layoutIfNeeded()
                    }
                } else {
                    UIView.animate(withDuration: 0.3) {
                        imageView.tintColor = Helper.Colors.darkBlue
                        imageView.transform = .identity
                        self.view.layoutIfNeeded()
                    }
                }
            }
        }
    }
}
