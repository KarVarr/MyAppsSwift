//
//  AppDelegate.swift
//  TerraScape
//
//  Created by Karen Vardanian on 12.05.2023.
//

import UIKit
import AVFAudio

import AVFoundation
import MediaPlayer

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    let audioPlayer = AudioPlayerForSound()
    let toolbar = ToolbarView()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupRemoteControl()
        setupNowPlayingInfo()
        configureAudioSession()
        
        
        return true
    }
    
    func setupRemoteControl() {
        UIApplication.shared.beginReceivingRemoteControlEvents()
        
//        let commandCenter = MPRemoteCommandCenter.shared()
//
//        commandCenter.playCommand.isEnabled = true
//        commandCenter.playCommand.addTarget { [unowned self] event in
//            print("should play sound")
//            if !self.toolbar.audioPlayer.players.first!.isPlaying {
//                self.audioPlayer.players.first?.play()
//                return .success
//            }
//            return .commandFailed
//        }
//
//        commandCenter.pauseCommand.isEnabled = true
//        commandCenter.pauseCommand.addTarget { [unowned self] event in
//            print("should pause sound")
////            toolbar.audioPlayer.stopAllSound()
//            return .success
//        }
    }
    
    func setupNowPlayingInfo() {
        var nowPlayingInfo = [String: Any]()
        nowPlayingInfo[MPMediaItemPropertyTitle] = Helpers.Strings.navigationTitle
        nowPlayingInfo[MPMediaItemPropertyArtist] = UIImage(named: "AppIcon")
        
        if let image = UIImage(named: "AppIcon") {
            nowPlayingInfo[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(boundsSize: image.size) { size in
                return image
            }
        }
        
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
    
    //MARK: - Playing sound background
    func configureAudioSession() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback, mode: .default, options: [.mixWithOthers, .allowAirPlay, .allowBluetooth])
            try audioSession.setActive(true)
        } catch {
            print(error.localizedDescription)
        }
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

