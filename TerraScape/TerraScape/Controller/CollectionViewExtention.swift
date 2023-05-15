//
//  CollectionViewExtention.swift
//  TerraScape
//
//  Created by Karen Vardanian on 14.05.2023.
//

import UIKit


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
        
        if audioPlayer.player?.isPlaying != nil {
            audioPlayer.player?.stop()
        } else {
            audioPlayer.playSound()
        }
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
