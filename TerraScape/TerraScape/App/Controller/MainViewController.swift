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
    
    let animations = Animations()
    
    var initialToolbarWidth: CGFloat = -300
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
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
        settings()
        layout()
        collectionView()
        animations.createCircles(in: self)
    }
    
    
    func addViews() {
        view.addSubview(smallBall.customUIView)
        view.addSubview(mediumBall.customUIView)
        view.addSubview(bigBall.customUIView)
        view.addSubview(largeBall.customUIView)
        view.addSubview(uiCollectionView.customCollectionView)
        view.addSubview(toolbar)
    }
    
    func settings() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = Helpers.Colors.mainViewGradient
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        
        view.layer.insertSublayer(gradient, at: 0)
        
        uiCollectionView.customCollectionView.showsVerticalScrollIndicator = false
        
//        toolbar.parentViewController = self
        toolbar.audioPlayer = audioPlayer
        toolbar.setParentViewController(self)
    }
    //MARK: - LAYOUT
    
    func layout() {
        let collection = uiCollectionView.customCollectionView
        let smallBall = smallBall.customUIView
        let mediumBall = mediumBall.customUIView
        let bigBall = bigBall.customUIView
        let largeBall = largeBall.customUIView
        
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            toolbar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            toolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            toolbar.heightAnchor.constraint(equalToConstant: 70),
            
            smallBall.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            smallBall.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            smallBall.widthAnchor.constraint(equalToConstant: 75),
            smallBall.heightAnchor.constraint(equalToConstant: 75),
            
            mediumBall.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mediumBall.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mediumBall.widthAnchor.constraint(equalToConstant: 100),
            mediumBall.heightAnchor.constraint(equalToConstant: 100),
            
            bigBall.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            bigBall.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            bigBall.widthAnchor.constraint(equalToConstant: 150),
            bigBall.heightAnchor.constraint(equalToConstant: 150),
            
            largeBall.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            largeBall.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            largeBall.widthAnchor.constraint(equalToConstant: 200),
            largeBall.heightAnchor.constraint(equalToConstant: 200),
            
        ])
    }
    
    
}
