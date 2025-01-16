//
//  ImageCacheManager.swift
//  HayLingo
//
//  Created by Karen Vardanian on 16.01.2025.
//

import Foundation
import UIKit


final class ImageCacheManager {
    static let shared = ImageCacheManager()
    private var cache = NSCache<NSString, UIImage>()
    private var currentImageKey: String?
    
    private init() {
        cache.countLimit = 1 // We only need to cache the current image
        cache.totalCostLimit = 1024 * 1024 * 50 // 50 MB limit
    }
    
    func getImage(_ name: String) -> UIImage? {
        // If requesting a new image, clear the old one
        if currentImageKey != name {
            if let oldKey = currentImageKey {
                cache.removeObject(forKey: oldKey as NSString)
            }
            currentImageKey = name
        }
        
        // Check cache first
        if let cachedImage = cache.object(forKey: name as NSString) {
            return cachedImage
        }
        
        // Load from bundle
        if let image = UIImage(named: name) {
            cache.setObject(image, forKey: name as NSString)
            return image
        }
        
        return nil
    }
    
    func clearCache() {
        cache.removeAllObjects()
        currentImageKey = nil
    }
}
