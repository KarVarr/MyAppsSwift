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
        
        scrollViewForImage.scroll.maximumZoomScale = 4
        scrollViewForImage.scroll.minimumZoomScale = 1
        scrollViewForImage.scroll.showsVerticalScrollIndicator = false
        scrollViewForImage.scroll.showsHorizontalScrollIndicator = false
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return hdPictureOfDay.customImage
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if scrollView.zoomScale > 1 {
            if let image = hdPictureOfDay.customImage.image {
                let ratioWidth = hdPictureOfDay.customImage.frame.width / image.size.width
                let ratioHeight = hdPictureOfDay.customImage.frame.height / image.size.height
                
                let ratio = ratioWidth < ratioHeight ? ratioWidth : ratioHeight
                let newWidth = image.size.width * ratio
                let newHeight = image.size.height * ratio
                let conditionLeft = newWidth*scrollView.zoomScale > hdPictureOfDay.customImage.frame.width
                let left =  (conditionLeft ? newWidth - hdPictureOfDay.customImage.frame.width : (scrollView.frame.width - scrollView.contentSize.width))
                let conditionTop = newHeight*scrollView.zoomScale > hdPictureOfDay.customImage.frame.height
                
                let top =  (conditionTop ? newHeight - hdPictureOfDay.customImage.frame.height : (scrollView.frame.height - scrollView.contentSize.height))
                
                scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
                
            }
        } else {
            scrollView.contentInset = .zero
        }
    }
    
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        if scale < scrollView.minimumZoomScale {
            UIView.animate(withDuration: 0.3) {
                scrollView.setZoomScale(scrollView.minimumZoomScale, animated: false)
            }
        }
    }
}
