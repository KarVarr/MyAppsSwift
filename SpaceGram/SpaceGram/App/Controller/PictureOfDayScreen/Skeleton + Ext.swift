//
//  Skeleton + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 02.10.2023.
//

import Foundation


extension PictureOfDayViewController {
    //MARK: - Skeleton
    func showSkeleton() {
        let arrayOfElementsForSkeleton = [pictureOfDayImageView.customImage, scrollView.scroll]
        
        arrayOfElementsForSkeleton.forEach {
            $0.showGradientSkeleton(usingGradient: .init(baseColor: Helper.Colors.lightGray),animated: true, delay: 0)
        }
    }
    
    func hideSkeleton() {
        let arrayOfElementsForSkeleton = [pictureOfDayImageView.customImage, scrollView.scroll]
        
        arrayOfElementsForSkeleton.forEach {
            $0.hideSkeleton()
        }
    }
}
