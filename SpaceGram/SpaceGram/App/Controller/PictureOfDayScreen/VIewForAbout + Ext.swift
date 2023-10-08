//
//  VIewForAbout + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 08.10.2023.
//

import UIKit


extension PictureOfDayViewController {
    //MARK: - ScrollView and ViewForAbout. Title and Explanation labels
    func configureCustomView() {
        scrollView.scroll.delegate = self
        scrollView.scroll.showsVerticalScrollIndicator = false
        scrollView.scroll.isSkeletonable = true
        scrollView.scroll.clipsToBounds = true
        scrollView.scroll.layer.cornerRadius = 30
        
        titleLabel.label.font = Helper.Font.DINCondensedBold(with: 36)
        titleLabel.label.textAlignment = .center
        explanationLabel.label.font = Helper.Font.AppleSDGothicNeoBold(with: 22)
        explanationLabel.label.textAlignment = .center
        
        let attributedText = NSMutableAttributedString(string: explanationLabel.label.text ?? "")
        let lineHeight: CGFloat = 2
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineHeightMultiple = lineHeight
        paragraphStyle.alignment = .center
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
        explanationLabel.label.attributedText = attributedText
        
    }
 
}
