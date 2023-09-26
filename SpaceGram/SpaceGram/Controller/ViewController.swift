//
//  ViewController.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 26.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let pictureOfDayImageView = CustomImageView()
    let customToolbar = CustomView()
    let separateLineForToolbar = CustomView()
    let scrollView = CustomScrollView()
    let verticalStackView = CustomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        addSubviews()
        settingView()
        layoutView()
    }
    
    func addSubviews() {
        view.addSubview(scrollView.scroll)
        scrollView.scroll.addSubview(verticalStackView.view)
        
        verticalStackView.view.addSubview(pictureOfDayImageView.customImage)
        
        view.addSubview(customToolbar.view)
        view.addSubview(separateLineForToolbar.view)
    }
    
    func settingView() {
        view.backgroundColor = .white
        title = "SpaceGram"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        customToolbar.view.backgroundColor = .blue
        separateLineForToolbar.view.backgroundColor = .systemPink.withAlphaComponent(0.5)
        pictureOfDayImageView.customImage.image = UIImage(systemName: "plus")
        scrollView.scroll.showsVerticalScrollIndicator = false
    }
    
    func layoutView() {
        let scrollView = scrollView.scroll
        let pictureOfDayImageView = pictureOfDayImageView.customImage
        let customToolbar = customToolbar.view
        let separateLineForToolbar = separateLineForToolbar.view
        
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: customToolbar.topAnchor),
            
            pictureOfDayImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            pictureOfDayImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            pictureOfDayImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            pictureOfDayImageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            pictureOfDayImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            pictureOfDayImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            separateLineForToolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separateLineForToolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            separateLineForToolbar.bottomAnchor.constraint(equalTo: customToolbar.topAnchor),
            separateLineForToolbar.heightAnchor.constraint(equalToConstant: 1.0),
            
            customToolbar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customToolbar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            customToolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customToolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customToolbar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
        ])
    }
    
}
