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
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell else { return }
        
        if cell.backgroundColor != UIColor(white: 1, alpha: 0.4) {
            cell.backgroundColor = UIColor(white: 1, alpha: 0.4)
        } else {
            cell.backgroundColor = .clear
        }
        
//        audioPlayer.playSound(for: images.allImages[indexPath.item], with: cell.currentVolume)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return images.allImages.count
        return allSounds.sounds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Helpers.Keys.collectionCell, for: indexPath) as! CustomCollectionViewCell
        
//        let imageNames = images.allImages[indexPath.item]
//
//        cell.imageOfSound.customImageView.image = UIImage(named: imageNames)
//        cell.nameOfSound.customLabel.text = imageNames.capitalized
//        cell.audioPlayer.players.first?.volume = cell.currentVolume
        
        let sound = allSounds.sounds[indexPath.item]
        cell.nameOfSound.customLabel.text = sound.name.capitalized
        cell.imageOfSound.customImageView.image = UIImage(named: sound.name)
        cell.volumeSlider.customSlider.value = sound.volume
        cell.volumeSlider.customSlider.addTarget(self, action: #selector(volumeSliderChanged), for: .valueChanged)
        cell.volumeSlider.customSlider.tag = indexPath.item
        
        
        return cell
    }
    
    @objc func volumeSliderChanged(_ sender: UISlider) {
        let soundIndex = sender.tag
        allSounds.sounds[soundIndex].volume = sender.value
        
        let player = audioPlayer.players[soundIndex]
        
        player.volume = sender.value
        print(sender.value)
        
        if player.volume == 0.0 {
            player.stop()
        } else {
            player.play()
        }
        
    }
}
