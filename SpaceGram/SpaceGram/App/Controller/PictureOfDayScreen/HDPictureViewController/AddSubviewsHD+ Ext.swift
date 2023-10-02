//
//  AddSubviews + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 01.10.2023.
//

import Foundation

extension HDPictureViewController {
    override func addSubviews() {
        view.addSubview(scrollViewForImage.scroll)
        scrollViewForImage.scroll.addSubview(hdPictureOfDay.customImage)
    }
}
