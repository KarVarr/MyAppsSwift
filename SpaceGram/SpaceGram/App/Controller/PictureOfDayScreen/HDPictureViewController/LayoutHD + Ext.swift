//
//  LayoutHD + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 01.10.2023.
//

import UIKit

extension HDPictureViewController {
    
    override func layoutView() {
        let scrollViewForImage = scrollViewForImage.scroll
        let hdPictureOfDay = hdPictureOfDay.customImage
        
        NSLayoutConstraint.activate([
            scrollViewForImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollViewForImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollViewForImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollViewForImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            hdPictureOfDay.centerXAnchor.constraint(equalTo: scrollViewForImage.centerXAnchor),
            hdPictureOfDay.centerYAnchor.constraint(equalTo: scrollViewForImage.centerYAnchor),
            hdPictureOfDay.widthAnchor.constraint(equalTo: scrollViewForImage.widthAnchor, multiplier: 1),
            hdPictureOfDay.heightAnchor.constraint(equalTo: scrollViewForImage.widthAnchor, multiplier: 1),
        ])
    }
}
