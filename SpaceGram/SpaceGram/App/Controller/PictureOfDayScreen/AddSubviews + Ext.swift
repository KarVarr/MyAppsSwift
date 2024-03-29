//
//  AddSubviews + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 01.10.2023.
//

import Foundation


extension PictureOfDayViewController {
    override func addSubviews() {
        /* Stars */
        view.addSubview(starsView.view)
        
        /* Main imageView */
        view.addSubview(pictureOfDayImageView.customImage)
        pictureOfDayImageView.customImage.addSubview(buttonHDPictureOfDay.button)
        
        /* Scroll View */
        view.addSubview(scrollView.scroll)
        scrollView.scroll.addSubview(viewForAbout.view)
        scrollView.scroll.addSubview(refreshControl.refresh)
        
        viewForAbout.view.addSubview(titleLabel.label)
        viewForAbout.view.addSubview(explanationLabel.label)
        
    }
}
