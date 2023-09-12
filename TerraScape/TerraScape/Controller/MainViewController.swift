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
    let savedData = SavedData()
    var cellsToUpdate: [IndexPath] = []
    
    let allSounds = AllSounds()
    let audioPlayer = AudioPlayerForSound()
    
    let uiCollectionView = CustomUICollectionView()
    let smallBall = CustomUIView()
    let mediumBall = CustomUIView()
    let bigBall = CustomUIView()
    let largeBall = CustomUIView()

    let toolbar = ToolbarView()
    
    let animations = Animations()
    
    var initialToolbarWidth: CGFloat = -300
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        allSounds.sounds = savedData.load()
        
        addViews()
        settings()
        layout()
        collectionView()
        createCircles()
        
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
        
        toolbar.parentViewController = self
        toolbar.audioPlayer = audioPlayer
        
    }
    //MARK: - LAYOUT
    
    func layout() {
        let collection = uiCollectionView.customCollectionView
        let smallBall = smallBall.customUIView
        let mediumBall = mediumBall.customUIView
        let bigBall = bigBall.customUIView
        let largeBall = largeBall.customUIView
        
//        let toolbarTrailingConstraint = toolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: initialToolbarWidth)
//        toolbarTrailingConstraint.isActive = true
        
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
        
        // Animate the toolbar appearance with the updated width
//        view.layoutIfNeeded()
//        UIView.animate(withDuration: 1.0) {
//            toolbarTrailingConstraint.constant = -20
//            self.view.layoutIfNeeded()
//        }
    }
    
    //MARK: - ANIMATION
    
    func createCircles() {
        willEnterForeground()
        
        animations.createGradientLayerForCircle(for: smallBall.customUIView, in: view, of: 37.5, with: Helpers.Colors.smallBallGradient, start: CGPoint(x: 0.1, y: 0.5), end: CGPoint(x: 0.5, y: 0.5))
        
        animations.createGradientLayerForCircle(for: mediumBall.customUIView, in: view, of: 50, with: Helpers.Colors.mediumBallGradient, start: CGPoint(x: 0.5, y: 0.0), end: CGPoint(x: 0.5, y: 1.0))
        
        animations.createGradientLayerForCircle(for: bigBall.customUIView, in: view, of: 75, with: Helpers.Colors.bigBallGradient, start: CGPoint(x: 0.5, y: 0.0), end: CGPoint(x: 0.5, y: 1.0))
        
        animations.createGradientLayerForCircle(for: largeBall.customUIView, in: view, of: 100, with: Helpers.Colors.largeBallGradient, start: CGPoint(x: 0.1, y: 0.5), end: CGPoint(x: 0.5, y: 0.5))
    }
    
    func willEnterForeground() {
        animations.animateBalls(for: smallBall.customUIView, in: view, to: 180, path: true, time: 11)
        animations.animateBalls(for: mediumBall.customUIView, in: view, to: 150, path: false, time: 15)
        animations.animateBalls(for: bigBall.customUIView, in: view, to: 210, path: false, time: 13)
        animations.animateBalls(for: largeBall.customUIView, in: view, to: 270, path: true, time: 30)
    }
}
