//
//  ScrollView + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 02.10.2023.
//

import UIKit


extension HDPictureViewController: UIScrollViewDelegate {
    func configureScrollView() {
        scrollViewForImage.scroll.delegate = self
        
//        scrollViewForImage.scroll.maximumZoomScale = 4
//        scrollViewForImage.scroll.minimumZoomScale = 1
        scrollViewForImage.scroll.showsVerticalScrollIndicator = false
        scrollViewForImage.scroll.showsHorizontalScrollIndicator = false
        scrollViewForImage.scroll.decelerationRate = UIScrollView.DecelerationRate.fast
        setCurrentMaxAndMinZoomScale()
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return hdPictureOfDay.customImage
    }
    
    func setCurrentMaxAndMinZoomScale() {
        let scrollView = scrollViewForImage.scroll
        
        let boundsSize = scrollView.bounds.size
        let imageSize = hdPictureOfDay.customImage.bounds.size
        
        let xScale = boundsSize.width / imageSize.width
        let yScale = boundsSize.height / imageSize.height
        let minScale = min(xScale, yScale)
        
        var maxScale: CGFloat = 1.0
        if minScale < 0.1 {
            maxScale = 0.3
        }
        if minScale >= 0.1 && minScale < 0.5 {
            maxScale = 0.7
        }
        if minScale >= 0.5 {
            maxScale = max(1.0, minScale)
        }
        
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = maxScale
    }
    
//    func scrollViewDidZoom(_ scrollView: UIScrollView) {
//        
//        if scrollView.zoomScale > 1 {
//            if let image = hdPictureOfDay.customImage.image {
//                let ratioWidth = hdPictureOfDay.customImage.frame.width / image.size.width
//                let ratioHeight = hdPictureOfDay.customImage.frame.height / image.size.height
//                
//                let ratio = ratioWidth < ratioHeight ? ratioWidth : ratioHeight
//                let newWidth = image.size.width * ratio
//                let newHeight = image.size.height * ratio
//                let conditionLeft = newWidth*scrollView.zoomScale > hdPictureOfDay.customImage.frame.width
//                let left =  (conditionLeft ? newWidth - hdPictureOfDay.customImage.frame.width : (scrollView.frame.width - scrollView.contentSize.width))
//                let conditionTop = newHeight*scrollView.zoomScale > hdPictureOfDay.customImage.frame.height
//                
//                let top =  (conditionTop ? newHeight - hdPictureOfDay.customImage.frame.height : (scrollView.frame.height - scrollView.contentSize.height))
//                
//                scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
//                
//            }
//        } else {
//            scrollView.contentInset = .zero
//        }
//    }
    
    
//    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
//        if scale > scrollView.minimumZoomScale {
//            UIView.animate(withDuration: 0.3) {
//                scrollView.setZoomScale(scrollView.minimumZoomScale, animated: true)
//            }
//        }
//    }
}
