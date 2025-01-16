//
//  SVGImageManager.swift
//  HayLingo
//
//  Created by Karen Vardanian on 16.01.2025.
//

import Foundation
import UIKit

final class SVGImageManager {
    static let shared = SVGImageManager()
    private var currentImage: UIImage?
    private var currentKey: String?
    
    private init() {}
    
    func loadImage(_ name: String, size: CGSize) -> UIImage? {
        // Если тот же самый SVG с тем же размером - возвращаем кэшированное изображение
        if currentKey == "\(name)_\(size.width)_\(size.height)", let image = currentImage {
            return image
        }
        
        // Очищаем предыдущее изображение
        clearCurrentImage()
        
        // Загружаем и рендерим SVG с учетом размера
        if let image = UIImage(named: name)?.withRenderingMode(.alwaysOriginal) {
            let renderer = UIGraphicsImageRenderer(size: size)
            let renderedImage = renderer.image { context in
                image.draw(in: CGRect(origin: .zero, size: size))
            }
            
            currentImage = renderedImage
            currentKey = "\(name)_\(size.width)_\(size.height)"
            return renderedImage
        }
        
        return nil
    }
    
    func clearCurrentImage() {
        currentImage = nil
        currentKey = nil
    }
}
