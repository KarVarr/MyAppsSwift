//
//  AppDelegate.swift
//  TerraScape
//
//  Created by Karen Vardanian on 12.05.2023.
//

import UIKit
import AVFoundation
import MediaPlayer

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    let audioPlayer = AudioPlayerForSound()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupAudioSession()
        setupRemoteCommandCenter()
        return true
    }
    
    private func setupAudioSession() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback, mode: .default, options: [.mixWithOthers])
            try audioSession.setActive(true)
            print("Audio session successfully activated.")
        } catch let error as NSError {
            print("Failed to set audio session category: \(error.localizedDescription) (code: \(error.code))")
            if let underlyingError = error.userInfo[NSUnderlyingErrorKey] as? NSError {
                print("Underlying error: \(underlyingError.localizedDescription) (code: \(underlyingError.code))")
            }
        }
    }
    
    private func setupRemoteCommandCenter() {
        let commandCenter = MPRemoteCommandCenter.shared()
        
        commandCenter.playCommand.addTarget { [weak self] _ in
            self?.audioPlayer.playAllSounds()
            self?.updatePlaybackState(isPlaying: true)
            return .success
        }
        
        commandCenter.pauseCommand.addTarget { [weak self] _ in
            self?.audioPlayer.stopAllSounds()
            self?.updatePlaybackState(isPlaying: false)
            return .success
        }
    }
    
    func updatePlaybackState(isPlaying: Bool) {
        // Update UI
        NotificationCenter.default.post(name: Notification.Name("PlaybackStateChanged"), object: nil, userInfo: ["isPlaying": isPlaying])
        
        // Update lock screen
        var nowPlayingInfo = MPNowPlayingInfoCenter.default().nowPlayingInfo ?? [String: Any]()
        nowPlayingInfo[MPNowPlayingInfoPropertyIsLiveStream] = true
        nowPlayingInfo[MPNowPlayingInfoPropertyPlaybackRate] = isPlaying ? 1.0 : 0.0
        nowPlayingInfo[MPMediaItemPropertyTitle] = "TerraScape"
        nowPlayingInfo[MPMediaItemPropertyArtist] = "Ambient Sounds"
        
        if let image = UIImage(named: "AppIcon") {
            nowPlayingInfo[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(boundsSize: image.size) { _ in image }
        }
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
    
    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
}

