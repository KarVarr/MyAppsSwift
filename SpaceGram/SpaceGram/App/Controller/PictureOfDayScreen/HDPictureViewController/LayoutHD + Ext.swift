//
//  LayoutHD + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 01.10.2023.
//

import UIKit

extension HDPictureViewController {
    
       override func layoutView() {
           let hdPictureOfDay = hdPictureOfDay.customImage
           
           NSLayoutConstraint.activate([
               hdPictureOfDay.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               hdPictureOfDay.centerYAnchor.constraint(equalTo: view.centerYAnchor),
               hdPictureOfDay.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               hdPictureOfDay.trailingAnchor.constraint(equalTo: view.trailingAnchor),
           ])
       }
}
