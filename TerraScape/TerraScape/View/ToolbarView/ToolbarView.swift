//
//  ToolbarView.swift
//  TerraScape
//
//  Created by Karen Vardanian on 22.05.2023.
//

import UIKit
import AVFAudio
import AVFoundation

class ToolbarView: UIView {
    weak var parentViewController: UIViewController?
    var allSounds = AllSounds()
    
    var audioPlayer = AudioPlayerForSound()
    
    let label = ToolbarLabel()
    let settingButton = CustomButtonView()
    let playButton = CustomButtonView()
    
    var onOffButton = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        settings()
        buttonsSetting()
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        addSubview(label.toolbarLabel.customLabel)
        addSubview(settingButton.customButton)
        addSubview(playButton.customButton)
    }
    
    func settings() {
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black
        layer.cornerRadius = 35
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
   
    }
    
    func buttonsSetting() {
        playButton.customButton.setImage(UIImage(named: "play")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        playButton.customButton.addTarget(self, action: #selector(playButtonForSound), for: .touchUpInside)
        
        
        settingButton.customButton.setImage(UIImage(named: "gear")?.withTintColor(.secondaryLabel, renderingMode: .alwaysOriginal), for: .normal)
        settingButton.customButton.addTarget(self, action: #selector(settingButtonPressed), for: .touchUpInside)
    }
    
    func layout() {
        let label = label.toolbarLabel.customLabel
        let playButton = playButton.customButton
        let settingButton = settingButton.customButton
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.widthAnchor.constraint(greaterThanOrEqualTo: label.widthAnchor),
            
            playButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            playButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            playButton.widthAnchor.constraint(equalToConstant: 60),
            playButton.heightAnchor.constraint(equalToConstant: 60),
            
            settingButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            settingButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            settingButton.widthAnchor.constraint(equalToConstant: 60),
            settingButton.heightAnchor.constraint(equalToConstant: 60),
            
        ])
        
    }
    
    @objc func playButtonForSound() {
        
        for index in 0..<allSounds.sounds.count {
            var sound = allSounds.sounds[index]
            
            if sound.onOff {
                audioPlayer.playAllSound()
                
                UIView.transition(with: self.playButton.customButton, duration: 0.2, options: .transitionCrossDissolve, animations: {
                    self.playButton.customButton.setImage(UIImage(named: "pause")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
                }, completion: nil)
                
                sound.onOff = false
                sound.volume = CustomUISlider().customSlider.value
            } else {
                audioPlayer.stopAllSound()
                
                UIView.transition(with: self.playButton.customButton, duration: 0.2, options: .transitionCrossDissolve, animations: {
                    self.playButton.customButton.setImage(UIImage(named: "play")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
                }, completion: nil)
                
                sound.onOff = true
                SavedData().load()
            }
            
            allSounds.sounds[index] = sound
//            print(sound.onOff)
            print(sound.volume)
        }
    }
    
    
    @objc func settingButtonPressed() {
        let settingVC = SettingsViewController()
        
        settingVC.modalPresentationStyle = .formSheet
        parentViewController?.present(settingVC, animated: true)
    }
    
}


