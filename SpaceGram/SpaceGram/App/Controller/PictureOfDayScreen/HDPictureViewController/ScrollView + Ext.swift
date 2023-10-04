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
        
        scrollViewForImage.scroll.maximumZoomScale = 3
        scrollViewForImage.scroll.minimumZoomScale = 1
        scrollViewForImage.scroll.showsVerticalScrollIndicator = false
        scrollViewForImage.scroll.showsHorizontalScrollIndicator = false
        scrollViewForImage.scroll.decelerationRate = UIScrollView.DecelerationRate.fast
        
        let zoomingTap = UITapGestureRecognizer(target: self, action: #selector(handleZoomingTap))
        zoomingTap.numberOfTapsRequired = 2
        hdPictureOfDay.customImage.addGestureRecognizer(zoomingTap)
        hdPictureOfDay.customImage.isUserInteractionEnabled = true
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(handleSingleTap))
        singleTap.numberOfTapsRequired = 1
        scrollViewForImage.scroll.addGestureRecognizer(singleTap)
        singleTap.require(toFail: zoomingTap)
        
    }
    
    //MARK: - UITapGestureRecognizer
    @objc func handleZoomingTap(sender: UITapGestureRecognizer) {
        let location = sender.location(in: hdPictureOfDay.customImage)
        
        if scrollViewForImage.scroll.zoomScale > scrollViewForImage.scroll.minimumZoomScale {
            scrollViewForImage.scroll.setZoomScale(scrollViewForImage.scroll.minimumZoomScale, animated: true)
        } else {
            let newScale = scrollViewForImage.scroll.maximumZoomScale
            let zoomRect = zoomRectForScale(scale: newScale, center: location)
            scrollViewForImage.scroll.zoom(to: zoomRect, animated: true)
        }
    }
    
    
    @objc func handleSingleTap(sender: UITapGestureRecognizer) {
        if navigationController?.navigationBar.isHidden == true {
            navigationController?.setNavigationBarHidden(false, animated: true)
            tabBarController?.tabBar.isHidden = false
        } else {
            navigationController?.setNavigationBarHidden(true, animated: true)
            tabBarController?.tabBar.isHidden = true
        }
    }
    

    
    
    //MARK: - Zoom scale
    func zoomRectForScale(scale: CGFloat, center: CGPoint) -> CGRect {
        let width = scrollViewForImage.scroll.frame.size.width / scale
        let height = scrollViewForImage.scroll.frame.size.height / scale
        let x = center.x - (width / 2.0)
        let y = center.y - (height / 2.0)
        return CGRect(x: x, y: y, width: width, height: height)
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
}
