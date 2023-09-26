//
//  ViewController.swift
//  SpaceGram
//
//  Created by Karen Vardanian on 26.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let pictureOfDayImageView = ImageView()
    let customToolbar = CustomView()
    let separateLineForToolbar = CustomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        addSubviews()
        settingView()
        layoutView()
    }
    
    func addSubviews() {
        view.addSubview(pictureOfDayImageView.customImage)
        view.addSubview(customToolbar.view)
        view.addSubview(separateLineForToolbar.view)
    }
    
    func settingView() {
        view.backgroundColor = .white
        title = "SpaceGram"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        customToolbar.view.backgroundColor = .blue
        separateLineForToolbar.view.backgroundColor = .systemPink.withAlphaComponent(0.5)
    }
    
    func layoutView() {
        let customToolbar = customToolbar.view
        let separateLineForToolbar = separateLineForToolbar.view
        
        NSLayoutConstraint.activate([
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
    
    @objc func composeItem() {
        
    }
    
    @objc func deleteItem() {
        
    }
}
