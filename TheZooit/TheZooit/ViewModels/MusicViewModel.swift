//
//  MusicViewModel.swift
//  TheZooit
//
//  Created by Yuliia on 28/10/23.
//

import AVFoundation
import SwiftUI
import AVKit

class MusicViewModel: ObservableObject {
    @Published var isPlaying = false
    @Published var currentSongIndex: Int? = nil
    
    private var player: AVAudioPlayer?
    
    
    func setupAudio(audioFileName: String = "ambient-piano-ampamp-strings-10711"){
        print("in setupAudion func. audioFileName: \(audioFileName)")
        guard let url = Bundle.main.url(forResource: audioFileName, withExtension: "mp3")
        else { print("couldn't set up url")
            return }
        do {
            if let bundlePath = Bundle.main.path(forResource: audioFileName, ofType: "mp3") {
                print("File exists at: \(bundlePath)")
            } else {
                print("File not found")
            }
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            } catch {
                print("Error setting audio session category: \(error)")
            }
            
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
        } catch {
            print("Error loading audio: (error)")
        }
        print("set up player with audio: \(audioFileName)")
    }
    
    func playAudio(songIndex: Int?) {
        if let player = player, let songIndex = songIndex {
            player.play()
            isPlaying = true
            currentSongIndex = songIndex
        } else {
            setupAudio()
            playAudio(songIndex: 0)
        }
    }
    
    func stopAudio() {
        player?.pause()
        isPlaying = false
    }
    
    func playNextTrack() {
        if currentSongIndex ?? 0 < songs.count - 1 {
            currentSongIndex! += 1
        } else {
            currentSongIndex = 0
        }
        setupAudio(audioFileName: songs[currentSongIndex ?? 0].file)
        playAudio(songIndex: currentSongIndex)
    }
    
    func playPreviousTrack() {
        if currentSongIndex ?? 0 > 0 {
            currentSongIndex! -= 1
        } else {
            currentSongIndex = songs.count - 1
        }
        setupAudio(audioFileName: songs[currentSongIndex ?? 0].file)
        playAudio(songIndex: currentSongIndex)
    }
    
    func playFrogSound() {
        setupAudio(audioFileName: "Frog_sound")
        player?.play()
    }
    
    var songs: [SongModel] = [
        SongModel(name: "Instrumental", file: "ambient-piano-ampamp-strings-10711"),
        SongModel(name: "Lo-fi", file: "lofi-study-112191"),
        SongModel(name: "Chill", file: "once-in-paris-168895"),
        SongModel(name: "Guitar", file: "the-cradle-of-your-soul-15700"),
        SongModel(name: "Relaxing", file: "morning-garden-acoustic-chill-15013"),
        SongModel(name: "Rain", file: "soft-rain-ambient-111154"),
        SongModel(name: "Forest", file: "scary-forest-90162"),
        SongModel(name: "Soft", file: "price-of-freedom-33106"),
        SongModel(name: "Motivational", file: "piano-moment-9835"),
        SongModel(name: "Thoughtful", file: "random-thoughts-20586")
    ]
}
