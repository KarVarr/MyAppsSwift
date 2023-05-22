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
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupRemoteControl()
        setupNowPlayingInfo()
        return true
    }
    
    func setupRemoteControl() {
            UIApplication.shared.beginReceivingRemoteControlEvents()
            
            let commandCenter = MPRemoteCommandCenter.shared()
            
            commandCenter.playCommand.isEnabled = true
            commandCenter.playCommand.addTarget { [unowned self] event in
                print("should play sound")
                if !audioPlayer.players.isEmpty {
                    for player in audioPlayer.players {
                        if player.isPlaying {
                            player.play()
                        }
                    }
                }
                return .success
            }
            
            commandCenter.pauseCommand.isEnabled = true
            commandCenter.pauseCommand.addTarget { [unowned self] event in
                print("should pause sound")
                if !audioPlayer.players.isEmpty {
                    for player in audioPlayer.players {
                        if player.isPlaying {
                            player.pause()
                        }
                    }
                }
                return .success
            }
        }
        
        func setupNowPlayingInfo() {
            var nowPlayingInfo = [String: Any]()
            nowPlayingInfo[MPMediaItemPropertyTitle] = Helpers.Strings.navigationTitle
            
            if let image = UIImage(named: "AppIcon") {
                    nowPlayingInfo[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(boundsSize: image.size) { size in
                        return image
                    }
                }
            
            nowPlayingInfo[MPMediaItemPropertyArtist] = UIImage(named: "AppIcon")
            
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
        let audioSession = AVAudioSession.sharedInstance()
               do {
                   try audioSession.setActive(true)
                   try audioSession.setCategory(.playback, mode: .default, options: [.mixWithOthers, .allowAirPlay, .allowBluetooth])
                   audioPlayer.players.forEach { $0.play() }
               } catch {
                   print(error.localizedDescription)
               }
    }
    
}

