//
//  AddSubviews + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 01.10.2023.
//

import Foundation


extension PictureOfDayViewController {
    override func addSubviews() {
         
         view.addSubview(starsView.view)
         
         /* Horizontal StackView */
         view.addSubview(viewContainerForTitleAndDate.view)
         viewContainerForTitleAndDate.view.addSubview(pictureOfTheDayTitleLabel.label)
         viewContainerForTitleAndDate.view.addSubview(pictureOfTheDayDateLabel.label)
         
         view.addSubview(pictureOfDayImageView.customImage)
         
         /* Scroll View */
         view.addSubview(scrollView.scroll)
         scrollView.scroll.addSubview(viewForAbout.view)
         
         viewForAbout.view.addSubview(titleLabel.label)
         viewForAbout.view.addSubview(explanationLabel.label)
         
         /* Toolbar */
         view.addSubview(separateLineForToolbar.view)
         view.addSubview(customToolbar.view)
         customToolbar.view.addSubview(horizontalStackForToolbar.sView)
     }
}
