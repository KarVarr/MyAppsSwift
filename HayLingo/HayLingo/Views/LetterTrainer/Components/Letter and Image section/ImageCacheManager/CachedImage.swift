//
//  CachedImage.swift
//  HayLingo
//
//  Created by Karen Vardanian on 16.01.2025.
//

import SwiftUI

struct CachedImage: View {
    let imageName: String
    @State private var image: UIImage?
    
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                Color.clear
            }
        }
        .onAppear {
            image = ImageCacheManager.shared.getImage(imageName)
        }
        .onDisappear {
            // Clear the image when view disappears
            image = nil
        }
    }
}

#Preview {
    CachedImage()
}
