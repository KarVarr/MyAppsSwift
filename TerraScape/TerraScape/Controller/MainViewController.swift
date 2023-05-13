//
//  MainViewController.swift
//  TerraScape
//
//  Created by Karen Vardanian on 12.05.2023.
//  TerraScape - a combination of "terra", meaning earth, and "soundscape" to represent the sound of nature.

import UIKit

class MainViewController: UIViewController {
    
    let uiCollectionView = CustomUICollectionView()
    let images = Images()
    
    let smallBall = CustomUIView()
    let mediumBall = CustomUIView()
    let bigBall = CustomUIView()
    let largeBall = CustomUIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        navigation()
        settings()
        layout()
        collectionView()
        
        animationCustomViews(smallBall.customUIView)
        animationCustomViews(mediumBall.customUIView)
        animationCustomViews(bigBall.customUIView)
        animationCustomViews(largeBall.customUIView)
    }
    
    func addViews() {
        view.addSubview(smallBall.customUIView)
        view.addSubview(mediumBall.customUIView)
        view.addSubview(bigBall.customUIView)
        view.addSubview(largeBall.customUIView)
        
        view.addSubview(uiCollectionView.customCollectionView)
    }
    
    func settings() {
                view.backgroundColor = .black
        
//        let gradient = CAGradientLayer()
//        gradient.frame = view.bounds
//        gradient.colors = Helpers.Colors.mainViewGradient
//        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
//        gradient.endPoint = CGPoint(x: 0.0, y: 0.6)
//
//        view.layer.insertSublayer(gradient, at: 0)
        
        uiCollectionView.customCollectionView.showsVerticalScrollIndicator = false
        
        smallBall.customUIView.backgroundColor = .cyan
        smallBall.customUIView.layer.cornerRadius = 25
        
        mediumBall.customUIView.backgroundColor = .magenta
        mediumBall.customUIView.layer.cornerRadius = 50
        
        bigBall.customUIView.backgroundColor = .orange
        bigBall.customUIView.layer.cornerRadius = 75
        
        largeBall.customUIView.backgroundColor = .blue
        largeBall.customUIView.layer.cornerRadius = 100
        largeBall.customUIView.translatesAutoresizingMaskIntoConstraints = false
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
    func animationCustomViews(_ ball: UIView) {
        UIView.animate(withDuration: 30.0, delay: 0.0, options: [.autoreverse, .repeat]) {
            let randomX = CGFloat(arc4random_uniform(UInt32(self.view.bounds.width - ball.bounds.width)))
            let randomY = CGFloat(arc4random_uniform(UInt32(self.view.bounds.height - ball.bounds.height)))
            ball.frame.origin = CGPoint(x: randomX, y: randomY)
        }
        
    }
    
    
    
    
    
    @objc func settingButton() {
        
    }
    
    
    
    
    
}


//MARK: - CUSTOM COLLECTION VIEW
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView() {
        uiCollectionView.customCollectionView.delegate = self
        uiCollectionView.customCollectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (view.frame.size.width / 2 ) - 10 , height: (view.frame.size.width / 2 ) )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.allImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Helpers.Keys.collectionCell, for: indexPath) as! CustomCollectionViewCell
        
        let imageNames = images.allImages[indexPath.item]
        
        cell.imageOfSound.customImageView.image = UIImage(named: imageNames)
        cell.nameOfSound.customLabel.text = imageNames.capitalized
        
        return cell
    }
}
