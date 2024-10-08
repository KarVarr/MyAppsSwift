//
//  UICollectionMVC + Ext.swift
//  TerraScape
//
//  Created by Karen Vardanian on 14.05.2023.
//

import UIKit


extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView() {
        uiCollectionView.customCollectionView.delegate = self
        uiCollectionView.customCollectionView.dataSource = self
        uiCollectionView.customCollectionView.prefetchDataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allSounds.sounds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Helpers.Keys.collectionCell, for: indexPath) as! CustomCollectionViewCell
        
        let sound = allSounds.sounds[indexPath.item]
        let localizedSoundName = NSLocalizedString(sound.name, comment: "")
        
        cell.nameOfSound.customLabel.text = localizedSoundName.capitalized
        cell.volumeOfSound.value = sound.volume
        DispatchQueue.global().async {
            if let image = UIImage(named: sound.image) {
                DispatchQueue.main.async {
                    if let visibleCell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell {
                        visibleCell.imageOfSound.customImageView.image = image
                    }
                }
            }
        }
        cell.volumeOfSound.addTarget(self, action: #selector(self.volumeSliderChanged), for: .valueChanged)
        cell.volumeOfSound.tag = indexPath.item

        return cell
    }
    
    @objc func volumeSliderChanged(_ sender: UISlider) {
        let soundIndex = sender.tag
        let sound = allSounds.sounds[soundIndex]
        let volume = sender.value
        
        allSounds.sounds[soundIndex].volume = volume
        
        userDefaults.setValue(volume, forKey: "\(sound.name)_volume")
        
        
        audioPlayer.setVolume(for: sound.name, volume: volume)
        
        if toolbar.isButtonPlay {
            audioPlayer.play(sound: sound.name)
        }
        print("Changed volume for \(sound.name) to \(volume)")
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

//MARK: - Images prefetching
extension MainViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            let sound = allSounds.sounds[indexPath.item]
            DispatchQueue.global().async {
                _ = UIImage(named: sound.image)
            }
        }
    }
}
