//
//  CollectionViewExtention.swift
//  TerraScape
//
//  Created by Karen Vardanian on 14.05.2023.
//

import AVFoundation
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
        CGSize(width: (view.frame.size.width / 2 ) - 15 , height: (view.frame.size.width / 2 ) )
    }
    
    //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //        collectionView.deselectItem(at: indexPath, animated: true)
    //
    //        //        guard let cell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell else { return }
    //
    //    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allSounds.sounds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Helpers.Keys.collectionCell, for: indexPath) as! CustomCollectionViewCell
        
        let sound = allSounds.sounds[indexPath.item]
        cell.nameOfSound.customLabel.text = sound.name.capitalized
        cell.imageOfSound.customImageView.image = UIImage(named: sound.name)
        cell.volumeOfSound.customSlider.value = sound.volume
        cell.volumeOfSound.customSlider.addTarget(self, action: #selector(volumeSliderChanged), for: .valueChanged)
        cell.volumeOfSound.customSlider.tag = indexPath.item
        
        //performance?
        cell.layer.rasterizationScale = UIScreen.main.scale
        
        
        
        // Reset cell background color before returning the cell
        cell.contentView.backgroundColor = .clear
        
       
            if cellsToUpdate.contains(indexPath) {
                cellsToUpdate.remove(at: cellsToUpdate.firstIndex(of: indexPath)!)
            }
        
        
        return cell
    }
    
    
    /**This function plays\stops each song individually! */
    @objc func volumeSliderChanged(_ sender: UISlider) {
        
        let soundIndex = sender.tag
        allSounds.sounds[soundIndex].volume = sender.value
        
        let player = audioPlayer.players[soundIndex]
        player.volume = sender.value
        
        if !toolbar.onOffButton {
            player.volume = sender.value
        }
        
        
        savedData.save()
        
        let indexPath = IndexPath(item: soundIndex, section: 0)
        if !cellsToUpdate.contains(indexPath) {
            cellsToUpdate.append(indexPath)
        }
        
        
        uiCollectionView.customCollectionView.reloadItems(at: cellsToUpdate)
        cellsToUpdate.removeAll()
        
    }
}
