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
        
        cell.imageOfSound.customImageView.image = UIImage(named: sound.image)
        cell.nameOfSound.customLabel.text = sound.name.capitalized
        cell.volumeOfSound.customSlider.value = sound.volume
        cell.volumeOfSound.customSlider.addTarget(self, action: #selector(self.volumeSliderChanged), for: .valueChanged)
        cell.volumeOfSound.customSlider.tag = indexPath.item
        
        if cellsToUpdate.contains(indexPath) {
            cellsToUpdate.remove(at: cellsToUpdate.firstIndex(of: indexPath)!)
        }
        return cell
    }
    
    
    
    /**This function plays\stops all songs ! */
    @objc func volumeSliderChanged(_ sender: UISlider) {
        
        let soundIndex = sender.tag
        allSounds.sounds[soundIndex].volume = sender.value
        
        let player = audioPlayer.players[soundIndex]
        player.volume = sender.value
        
        if !toolbar.onOffButton {
            player.volume = sender.value
        }
        
        //        savedData.save(sounds: allSounds.sounds)
        
        let indexPath = IndexPath(item: soundIndex, section: 0)
        if !cellsToUpdate.contains(indexPath) {
            cellsToUpdate.append(indexPath)
        }
        
//           uiCollectionView.customCollectionView.reloadItems(at: cellsToUpdate)
        cellsToUpdate.removeAll()
    }
}
