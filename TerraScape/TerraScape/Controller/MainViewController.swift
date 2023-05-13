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
    
    let testView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemPink
        view.layer.cornerRadius = 100
        return view
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        addViews()
        navigation()
        settings()
        layout()
        collectionView()
        
        animationCustomViews()
    }
    
    func addViews() {
        view.addSubview(testView)
        view.addSubview(uiCollectionView.customCollectionView)
    }
    
    func settings() {
//        view.backgroundColor = .black
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = Helpers.Colors.mainViewGradient
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 0.6)
        
        view.layer.insertSublayer(gradient, at: 0)
        
        uiCollectionView.customCollectionView.showsVerticalScrollIndicator = false
    }
    
    //MARK: - LAYOUT
    func layout() {
        let collection = uiCollectionView.customCollectionView
        
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            testView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            testView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            testView.widthAnchor.constraint(equalToConstant: 200),
            testView.heightAnchor.constraint(equalToConstant: 200),
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
    
    
    @objc func settingButton() {
        
    }
    
    //MARK: - ANIMATION
    
    func animationCustomViews() {
        UIView.animate(withDuration: 60.0, delay: 0.0, options: [.autoreverse, .repeat, .curveEaseInOut]) {
            let randomX = CGFloat(arc4random_uniform(UInt32(self.view.bounds.width - self.testView.bounds.width)))
            let randomY = CGFloat(arc4random_uniform(UInt32(self.view.bounds.height - self.testView.bounds.height)))
            self.testView.frame.origin = CGPoint(x: randomX, y: randomY)
            
        }
        
      
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
