//
//  HDPictureViewController.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 01.10.2023.
//

import UIKit

class HDPictureViewController: BaseController {
    let hdPictureOfDay = CustomImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        settingView()
        layoutView()
        addGradientLayer()
    }
    
    override func addSubviews() {
        view.addSubview(hdPictureOfDay.customImage)
    }
    
    override func settingView() {
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(actionPressed))
        
        hdPictureOfDay.customImage.contentMode = .scaleAspectFit
        hdPictureOfDay.customImage.enableZoom()
    }
    
    override func layoutView() {
        let hdPictureOfDay = hdPictureOfDay.customImage
        
        NSLayoutConstraint.activate([
            hdPictureOfDay.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hdPictureOfDay.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            hdPictureOfDay.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hdPictureOfDay.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    //MARK: - Gradient
    func addGradientLayer() {
        let gradientLayerForView = CAGradientLayer()
        gradientLayerForView.frame = view.bounds
        gradientLayerForView.colors = Helper.Colors.darkBlueGradient
        gradientLayerForView.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayerForView.locations = [0.2]
        self.view.layer.insertSublayer(gradientLayerForView, at: 0)
    }
    
    @objc func actionPressed() {
        
    }
    
}


