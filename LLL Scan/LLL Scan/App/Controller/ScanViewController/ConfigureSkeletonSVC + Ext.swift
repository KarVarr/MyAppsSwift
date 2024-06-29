//
//  ConfigureSkeletonSVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 29.06.2024.
//

import Foundation


extension ScanVC {
    // MARK: - Start Skeleton
    func startSkeleton() {
        self.titleFromParsingLabel.label.text = "Поиск на сайте..."
        self.miniatureImageHM.imageView.isSkeletonable = true
        self.miniatureImageHM.imageView.showAnimatedGradientSkeleton()
    }
    
    // MARK: - Stop Skeleton
    func stopSkeleton() {
        self.miniatureImageHM.imageView.hideSkeleton()
    }
}
