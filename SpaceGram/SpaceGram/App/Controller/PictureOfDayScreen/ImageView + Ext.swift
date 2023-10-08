//
//  ImageView + Ext.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 08.10.2023.
//

import UIKit


extension PictureOfDayViewController {
    //MARK: - Picture Of The Day ImageView / Button HD for Picture of The Day
    func configurePictureOfDayImageView() {
        pictureOfDayImageView.customImage.isSkeletonable = true
        pictureOfDayImageView.customImage.layer.cornerRadius = 30
        pictureOfDayImageView.customImage.layer.borderWidth = 1
        pictureOfDayImageView.customImage.layer.borderColor = Helper.Colors.lightGray.cgColor
        pictureOfDayImageView.customImage.isUserInteractionEnabled = true
        pictureOfDayImageView.customImage.contentMode = .scaleAspectFill
        
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

}
