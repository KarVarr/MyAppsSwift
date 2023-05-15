//
//  MainViewController.swift
//  TerraScape
//
//  Created by Karen Vardanian on 12.05.2023.
//  TerraScape - a combination of "terra", meaning earth, and "soundscape" to represent the sound of nature.

import UIKit

class MainViewController: UIViewController {
    let audioPlayer = AudioPlayer()
    
    let uiCollectionView = CustomUICollectionView()
    let images = Images()
    
    let smallBall = CustomUIView()
    let mediumBall = CustomUIView()
    let bigBall = CustomUIView()
    let largeBall = CustomUIView()
    
    let dynamicIslandBorderView = CustomUIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        navigation()
        settings()
        layout()
        collectionView()
        

        createGradientLayerForCircle(for: smallBall.customUIView, of: 25, with: Helpers.Colors.smallBallGradient, start: CGPoint(x: 0.5, y: 0.9), end: CGPoint(x: 0.0, y: 1))
        createGradientLayerForCircle(for: mediumBall.customUIView, of: 50, with: Helpers.Colors.mediumBallGradient, start: CGPoint(x: 0.5, y: 0.0), end: CGPoint(x: 0.5, y: 1.0))
        createGradientLayerForCircle(for: bigBall.customUIView, of: 75, with: Helpers.Colors.bigBallGradient, start: CGPoint(x: 0.5, y: 0.0), end: CGPoint(x: 0.5, y: 1.0))
        createGradientLayerForCircle(for: largeBall.customUIView, of: 100, with: Helpers.Colors.largeBallGradient, start: CGPoint(x: 0.1, y: 0.5), end: CGPoint(x: 0.5, y: 0.5))
        
        animateBalls(for: smallBall.customUIView, to: 180, path: true, time: 11)
        animateBalls(for: mediumBall.customUIView, to: 150, path: false, time: 15)
        animateBalls(for: bigBall.customUIView, to: 210, path: false, time: 13)
        animateBalls(for: largeBall.customUIView, to: 270, path: true, time: 30)
        
        //        let modelName = UIDevice.current.modelName
        //
        //        switch modelName {
        //        case "iPhone X":
        //            view.backgroundColor = .blue
        //        case "iPhone 14 Pro":
        //            view.backgroundColor = .red
        //
        //        case "iPhone 14 Pro Max":
        //            view.backgroundColor = .green
        //        default:
        //            view.backgroundColor = .black
        //        }
        
        
    }
    
    func addViews() {
        view.addSubview(smallBall.customUIView)
        view.addSubview(mediumBall.customUIView)
        view.addSubview(bigBall.customUIView)
        view.addSubview(largeBall.customUIView)
        view.addSubview(dynamicIslandBorderView.customUIView)
        
        view.addSubview(uiCollectionView.customCollectionView)
        
    }
    
    func settings() {
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = Helpers.Colors.mainViewGradient
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        
        view.layer.insertSublayer(gradient, at: 0)
        
        uiCollectionView.customCollectionView.showsVerticalScrollIndicator = false
        
        
        
        dynamicIslandBorderView.customUIView.backgroundColor = .white
        dynamicIslandBorderView.customUIView.layer.cornerRadius = 20
    }
    
    //MARK: - LAYOUT
    func layout() {
        let collection = uiCollectionView.customCollectionView
        let smallBall = smallBall.customUIView
        let mediumBall = mediumBall.customUIView
        let bigBall = bigBall.customUIView
        let largeBall = largeBall.customUIView
        let dynamicIsland = dynamicIslandBorderView.customUIView
        
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            smallBall.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            smallBall.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            smallBall.widthAnchor.constraint(equalToConstant: 50),
            smallBall.heightAnchor.constraint(equalToConstant: 50),
            
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
            
            dynamicIsland.topAnchor.constraint(equalTo: view.topAnchor, constant: 9.5),
            dynamicIsland.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dynamicIsland.widthAnchor.constraint(equalToConstant: 130),
            dynamicIsland.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
    //MARK: - NAVIGATION
    func navigation() {
        title = Helpers.Strings.navigationTitle
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let settingsButton = UIBarButtonItem(image: UIImage(systemName: "gearshape.fill"), style: .plain, target: self, action: #selector(settingButton))
        settingsButton.tintColor = UIColor.white
        navigationItem.rightBarButtonItem = settingsButton
    }
    
    //MARK: - ANIMATION
    
    
    func animateBalls(for ball: UIView, to distance: CGFloat, path clockwise: Bool, time duration: CFTimeInterval) {
        let centerX = view.bounds.width / 2
        let centerY = view.bounds.height / 2
        let radius = min(centerX, centerY) - 200 // adjust the radius as needed
        
        let smallBallPath = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerY), radius: radius - distance, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: clockwise)
        let smallBallAnimation = CAKeyframeAnimation(keyPath: "position")
        smallBallAnimation.path = smallBallPath.cgPath
        smallBallAnimation.duration = duration
        smallBallAnimation.repeatCount = .infinity
        smallBallAnimation.calculationMode = .paced
        ball.layer.add(smallBallAnimation, forKey: "animation")
        
    }
    
    func createGradientLayerForCircle(for circle: UIView, of radius: CGFloat, with color: [Any], start sPoint: CGPoint, end ePoint: CGPoint) {
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = color
        layer.startPoint = sPoint
        layer.endPoint = ePoint
        circle.layer.insertSublayer(layer, at: 0)
        circle.layer.cornerRadius = radius
        circle.clipsToBounds = true
    }
    
    
    
    
    @objc func settingButton() {
    }
    
    
    
}




