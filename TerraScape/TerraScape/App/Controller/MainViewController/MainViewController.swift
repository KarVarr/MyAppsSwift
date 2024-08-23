//
//  MainViewController.swift
//  TerraScape
//
//  Created by Karen Vardanian on 12.05.2023.
//  TerraScape - a combination of "terra", meaning earth, and "soundscape" to represent the sound of nature.

import UIKit
import AVKit
import AVFAudio
import AVFoundation
import MediaPlayer

class MainViewController: UIViewController {
    var cellsToUpdate: [IndexPath] = []
    
    var allSounds = AllSounds()
    let audioPlayer = AudioPlayerForSound()
    
    let uiCollectionView = CustomUICollectionView()
    let smallBall = CustomUIView()
    let mediumBall = CustomUIView()
    let bigBall = CustomUIView()
    let largeBall = CustomUIView()
    
    let toolbar = ToolbarView()
    
    var initialToolbarWidth: CGFloat = -300
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViewsMVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let toolbarTrailingConstraint = toolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: initialToolbarWidth)
        toolbarTrailingConstraint.isActive = true
        
        view.layoutIfNeeded()
        UIView.animate(withDuration: 1.0) {
            toolbarTrailingConstraint.constant = -20
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        configureViewMVC()
        layoutViewMVC()
    } 
}
