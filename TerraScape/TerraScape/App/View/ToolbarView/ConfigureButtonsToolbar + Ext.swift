//
//  ConfigureButtonsToolbar + Ext.swift
//  TerraScape
//
//  Created by Karen Vardanian on 25.08.2024.
//

import UIKit

extension ToolbarView {
    func configureButtonsToolbar() {
        //MARK: - Play button
        playButton.customButton.setImage(
            UIImage(named: "play")?.withTintColor(.white, renderingMode: .alwaysOriginal),
            for: .normal
        )
        
        playButton.customButton.addTarget(
            self,
            action: #selector(playButtonForSound),
            for: .touchUpInside
        )
        
        //Arabic localization
        if UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft {
            playButton.customButton.transform = playButton.customButton.transform.rotated(by: .pi)
        }
        
        //MARK: - Setting button
        settingButton.customButton.setImage(
            UIImage(named: "info")?.withTintColor(.secondaryLabel, renderingMode: .alwaysOriginal),
            for: .normal
        )
        
        settingButton.customButton.addTarget(
            self,
            action: #selector(settingButtonPressed),
            for: .touchUpInside
        )
    }
    
    @objc func playButtonForSound() {
        audioPlayer.togglePlayback()
    }
    
    @objc func updatePlaybackState() {
        updatePlayButtonImage(isPlaying: audioPlayer.isPlaying)
    }
    
    private func updatePlayButtonImage(isPlaying: Bool) {
        let imageName = isPlaying ? "pause" : "play"
        playButton.customButton.setImage(UIImage(named: imageName)?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
    }
    
    @objc func settingButtonPressed() {
        guard let parentViewController = parentViewController else {
            print("Error: Parent view controller is not set")
            return
        }
        
        let settingVC = AboutViewController()
        settingVC.modalPresentationStyle = .popover
        parentViewController.present(settingVC, animated: true, completion: nil)
    }
}
