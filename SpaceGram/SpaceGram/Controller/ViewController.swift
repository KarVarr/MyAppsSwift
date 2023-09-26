//
//  ViewController.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 26.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let scrollView = CustomScrollView()
    
    let verticalStackView = CustomStackView()
    let pictureOfDayImageView = CustomImageView()
    let titleLabel = CustomLabel()
    let dateLabel = CustomLabel()
    let explanationLabel = CustomLabel()
    
    let separateLineForToolbar = CustomView()
    let customToolbar = CustomView()
    
    
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
        scrollView.scroll.addSubview(verticalStackView.sView)
        
        verticalStackView.sView.addArrangedSubview(pictureOfDayImageView.customImage)
        verticalStackView.sView.addArrangedSubview(titleLabel.label)
        verticalStackView.sView.addArrangedSubview(dateLabel.label)
        verticalStackView.sView.addArrangedSubview(explanationLabel.label)
        
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
        verticalStackView.sView.alignment = .center
        verticalStackView.sView.axis = .vertical
        verticalStackView.sView.spacing = 20
        
        verticalStackView.sView.layer.borderWidth = 3
        verticalStackView.sView.layer.borderColor = UIColor.green.cgColor
                
        scrollView.scroll.layer.borderWidth = 2
        scrollView.scroll.layer.borderColor = UIColor.red.cgColor
        
        titleLabel.label.text = "Title"
        dateLabel.label.text = "Date 23.09.2023"
        explanationLabel.label.text = "Do you see the horse's head?   What you are seeing is not the famous Horsehead nebula toward Orion, but rather a fainter nebula that only takes on a familiar form with deeper imaging.  The main part of the here-imaged molecular cloud complex is  reflection nebula IC 4592.  Reflection nebulas are made up of very fine dust that normally appears dark but can look quite blue when reflecting the visible light of energetic nearby stars.  In this case, the source of much of the reflected light is a star at the eye of the horse.  That star is part of Nu Scorpii, one of the brighter star systems toward the constellation of the Scorpion (Scorpius).   A second reflection nebula dubbed IC 4601 is visible surrounding two stars above and to the right of the image center."
    }
    
    func layoutView() {
        let scrollView = scrollView.scroll
        
        let verticalStackView = verticalStackView.sView
        let pictureOfDayImageView = pictureOfDayImageView.customImage
        let titleLabel = titleLabel.label
        let dateLabel = dateLabel.label
        let explanationLabel = explanationLabel.label
        
        let separateLineForToolbar = separateLineForToolbar.view
        let customToolbar = customToolbar.view
        
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: separateLineForToolbar.topAnchor, constant: -20),
            
            verticalStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            verticalStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            pictureOfDayImageView.topAnchor.constraint(equalTo: verticalStackView.topAnchor),
            pictureOfDayImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            pictureOfDayImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            
//            titleLabel.topAnchor.constraint(equalTo: pictureOfDayImageView.bottomAnchor),
//            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
//            explanationLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            explanationLabel.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 20),
            explanationLabel.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: -20),
            
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
