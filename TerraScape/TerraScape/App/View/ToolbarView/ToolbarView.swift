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
    var audioPlayer = AudioPlayerForSound.shared
    
    let label = CustomLabelView()
    let settingButton = CustomButtonView()
    let playButton = CustomButtonView()
    
    var isButtonPlay = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        settings()
        layout()
        labelSettings()
        buttonsSetting()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updatePlaybackState), name: .playbackStateChanged, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        addSubview(label.customLabel)
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
    
    func labelSettings() {
        label.customLabel.text = Helpers.Strings.navigationTitle
        label.customLabel.textColor = .white.withAlphaComponent(0.15)
    }
    
    func buttonsSetting() {
        playButton.customButton.setImage(UIImage(named: "play")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        playButton.customButton.addTarget(self, action: #selector(playButtonForSound), for: .touchUpInside)
        
        
        settingButton.customButton.setImage(UIImage(named: "gear")?.withTintColor(.secondaryLabel, renderingMode: .alwaysOriginal), for: .normal)
        settingButton.customButton.addTarget(self, action: #selector(settingButtonPressed), for: .touchUpInside)
    }
    
    func layout() {
        let label = label.customLabel
        let playButton = playButton.customButton
        let settingButton = settingButton.customButton
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            
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
        audioPlayer.togglePlayback()
    }
    
    @objc func updatePlaybackState() {
        updatePlayButtonImage(isPlaying: audioPlayer.isPlaying)
    }
    
    private func updatePlayButtonImage(isPlaying: Bool) {
        let imageName = isPlaying ? "pause" : "play"
        playButton.customButton.setImage(UIImage(named: imageName)?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
    }
    
    func setParentViewController(_ viewController: UIViewController) {
        self.parentViewController = viewController
    }
    
    @objc func settingButtonPressed() {
        guard let parentViewController = parentViewController else {
            print("Error: Parent view controller is not set")
            return
        }
        
        let settingVC = SettingsViewController()
        settingVC.modalPresentationStyle = .popover
        parentViewController.present(settingVC, animated: true, completion: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}


