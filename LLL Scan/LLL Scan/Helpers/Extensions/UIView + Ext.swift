//
//  UIView + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 03.04.2024.
//

import UIKit

extension UIImage {
    func resizeImage(toSize size: CGSize) -> UIImage? {
        let aspectRatio = self.size.width / self.size.height
        
        var newSize: CGSize
        if size.width / size.height > aspectRatio {
            newSize = CGSize(width: size.width, height: size.width / aspectRatio)
        } else {
            newSize = CGSize(width: size.height * aspectRatio, height: size.height)
        }
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}


