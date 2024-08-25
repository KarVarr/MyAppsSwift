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
        layoutToolbar()
        labelSettings()
        configureButtonsToolbar()
        
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
    
    func setParentViewController(_ viewController: UIViewController) {
        self.parentViewController = viewController
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}


