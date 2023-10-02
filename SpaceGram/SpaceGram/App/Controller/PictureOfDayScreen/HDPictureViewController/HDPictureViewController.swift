//
//  HDPictureViewController.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 01.10.2023.
//

import UIKit

class HDPictureViewController: BaseController {
    let hdPictureOfDay = CustomImageView()
    let scrollViewForImage = CustomScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        settingView()
        layoutView()
    }
}


