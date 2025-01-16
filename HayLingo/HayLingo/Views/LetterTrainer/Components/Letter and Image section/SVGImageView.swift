//
//  SVGImageView.swift
//  HayLingo
//
//  Created by Karen Vardanian on 16.01.2025.
//

import SwiftUI

struct SVGImageView: View {
    let imageName: String
    @State private var displayedImage: UIImage?
    @State private var isImageVisible = false
    let targetSize: CGSize
    
    init(imageName: String, targetSize: CGSize = CGSize(width: 200, height: 200)) {
        self.imageName = imageName
        self.targetSize = targetSize
    }
    
    var body: some View {
        Group {
            if let image = displayedImage, isImageVisible {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .transition(.opacity)
            } else {
                Color.clear
            }
        }
        .onAppear {
            loadImage()
        }
        .onDisappear {
            clearImage()
        }
        .onChange(of: imageName) { _, newName in
            withAnimation(.easeInOut(duration: 0.3)) {
                isImageVisible = false
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                loadImage()
                
                withAnimation(.easeInOut(duration: 0.3)) {
                    isImageVisible = true
                }
            }
        }
    }
    
    private func loadImage() {
        displayedImage = SVGImageManager.shared.loadImage(imageName, size: targetSize)
        
        withAnimation(.easeInOut(duration: 0.3)) {
            isImageVisible = true
        }
    }
    
    private func clearImage() {
        withAnimation(.easeInOut(duration: 0.3)) {
            isImageVisible = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            displayedImage = nil
            SVGImageManager.shared.clearCurrentImage()
        }
    }
}

#Preview {
    SVGImageView(imageName: "dog")
}
