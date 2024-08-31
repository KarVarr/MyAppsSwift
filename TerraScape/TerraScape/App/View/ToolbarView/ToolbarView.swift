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
        
        addViewsToolbar()
        configureView()
        layoutToolbar()
        configureLabelsToolbar()
        configureButtonsToolbar()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updatePlaybackState), name: .playbackStateChanged, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}


