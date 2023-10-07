//
//  Settings + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 27.09.2023.
//

import UIKit

extension PictureOfDayViewController {
    override func settingView() {
        setNavTitle(title: .pictureOfDay)
        
        configurePictureOfDayImageView()
        configureCustomView()
        addGradientLayer()
        showSkeleton()
    }
    
    //MARK: - Picture Of The Day ImageView / Button HD for Picture of The Day
    private func configurePictureOfDayImageView() {
        pictureOfDayImageView.customImage.isSkeletonable = true
        pictureOfDayImageView.customImage.layer.cornerRadius = 30
        pictureOfDayImageView.customImage.layer.borderWidth = 1
        pictureOfDayImageView.customImage.layer.borderColor = Helper.Colors.lightGray.cgColor
        pictureOfDayImageView.customImage.isUserInteractionEnabled = true
        
        buttonHDPictureOfDay.button.clipsToBounds = true
        buttonHDPictureOfDay.button.setTitle("HD", for: .normal)
        buttonHDPictureOfDay.button.setTitleColor(Helper.Colors.lightOrange.withAlphaComponent(0.5), for: .normal)
        buttonHDPictureOfDay.button.titleLabel?.font = Helper.Font.CopperplateBold(with: 20)
        buttonHDPictureOfDay.button.backgroundColor = Helper.Colors.lightGray.withAlphaComponent(0.5)
        buttonHDPictureOfDay.button.layer.cornerRadius = 22
        
        buttonHDPictureOfDay.button.addTarget(self, action: #selector(buttonHDPressed), for: .touchUpInside)
    }
    
    @objc func buttonHDPressed() {
        let hdVC = HDPictureViewController()
        navigationController?.pushViewController(hdVC, animated: true)
        
        hdVC.hdPictureOfDay.customImage.image = pictureOfDayImageViewHD.customImage.image
        hdVC.navigationItem.title = titleLabel.label.text
    }
    
    
    //MARK: - ScrollView and ViewForAbout. Title and Explanation labels
    private func configureCustomView() {
        scrollView.scroll.delegate = self
        scrollView.scroll.showsVerticalScrollIndicator = false
        scrollView.scroll.isSkeletonable = true
        scrollView.scroll.clipsToBounds = true
        scrollView.scroll.layer.cornerRadius = 30
        
        titleLabel.label.font = Helper.Font.DINCondensedBold(with: 36)
        titleLabel.label.textAlignment = .center
        explanationLabel.label.font = Helper.Font.AppleSDGothicNeoBold(with: 28)
        explanationLabel.label.textAlignment = .center
        
        let attributedText = NSMutableAttributedString(string: explanationLabel.label.text ?? "")
        let lineHeight: CGFloat = 2
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineHeightMultiple = lineHeight
        paragraphStyle.alignment = .center
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
        explanationLabel.label.attributedText = attributedText
        
        explanationLabel.label.layer.shadowOffset = CGSize(width: 0, height: 20)
        explanationLabel.label.layer.shadowOpacity = 1
        explanationLabel.label.layer.shadowRadius = 1
        explanationLabel.label.layer.shadowColor = Helper.Colors.darkBlue.cgColor
        starWarsStyleText()
    }
    
    private func starWarsStyleText() {
   
        let perspective: CGFloat = -1 / 1000
        var transform = CATransform3DIdentity
        transform.m34 = perspective

        let angle: CGFloat = CGFloat.pi / 3
        transform = CATransform3DRotate(transform, angle, 1, 0, 0)

        
        viewForAbout.view.layer.transform = transform
    }
    
    
}
