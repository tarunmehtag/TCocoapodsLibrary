//
//  AudioFiles.swift
//  FlyingDino
//
//  Created by Mobile on 29/03/19.
//  Copyright © 2019 Mobile. All rights reserved.
//

import Foundation
import AVFoundation

class AudioPlayer: NSObject {
    
    //MARK:- Variables
    var backgroundMusic: AVAudioPlayer?
    var bombSoundEffect: AVAudioPlayer?
    static var shared = AudioPlayer()
    
    //MARK:- Play Background Music
    func playBackgroundMusic() {
        let path = Bundle.main.path(forResource: "Intro_music.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            backgroundMusic = try AVAudioPlayer(contentsOf: url)
            backgroundMusic?.numberOfLoops = -1
            backgroundMusic?.play()
        } catch {
            
        }
    }
    
    //MARK:- Play Action Audio
    func playSoundFile(_ AudioFile:String) {
        let path = Bundle.main.path(forResource: AudioFile, ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            bombSoundEffect = try AVAudioPlayer(contentsOf: url)
            bombSoundEffect?.play()
        } catch {
            
        }
    }
    
    //MARK: Stop Playing Audio
    func stopPlayingAudio() {
        backgroundMusic?.pause()
    }
    
    //MARK: Resume Playing
    func resumePlayingAudio() {
        backgroundMusic?.play()
    }
    
}
