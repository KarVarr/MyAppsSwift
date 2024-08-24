//
//  MainViewController + Ext.swift
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allSounds.sounds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Helpers.Keys.collectionCell, for: indexPath) as! CustomCollectionViewCell
        
        let sound = allSounds.sounds[indexPath.item]
        DispatchQueue.global().async {
            if let image = UIImage(named: sound.image) {
                DispatchQueue.main.async {
                    cell.imageOfSound.customImageView.image = image
                    cell.nameOfSound.customLabel.text = sound.name.capitalized
//                    cell.volumeOfSound.customSlider.value = sound.volume
                    cell.volumeOfSound.value = sound.volume
                }
            }
        }
        
//        cell.volumeOfSound.customSlider.addTarget(self, action: #selector(self.volumeSliderChanged), for: .valueChanged)
        cell.volumeOfSound.addTarget(self, action: #selector(self.volumeSliderChanged), for: .valueChanged)
//        cell.volumeOfSound.customSlider.tag = indexPath.item
        cell.volumeOfSound.tag = indexPath.item
        
        if cellsToUpdate.contains(indexPath) {
            cellsToUpdate.remove(at: cellsToUpdate.firstIndex(of: indexPath)!)
        }
        return cell
    }
    
    @objc func volumeSliderChanged(_ sender: UISlider) {
        let soundIndex = sender.tag
        let sound = allSounds.sounds[soundIndex]
        allSounds.sounds[soundIndex].volume = sender.value
        
        audioPlayer.setVolume(for: sound.name, volume: sender.value)
        
        if toolbar.onOffButton {
            audioPlayer.play(sound: sound.name)
        }
        print("Changed volume for \(sound.name) to \(sender.value)")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let padding: CGFloat = 20
           let collectionViewSize = collectionView.frame.size.width - padding

          
           let numberOfItemsPerRow: CGFloat = 3
           
           let width = collectionViewSize / numberOfItemsPerRow
           let height = width * 1.5
           
           return CGSize(width: width, height: height)
       }
}
