//
//  Musicview.swift
//  TheZooit
//
//  Created by Muhammad Usman Siddiqui on 23/10/2023.
//

import AVFoundation
import SwiftUI
import AVKit

struct MusicView: View {
    
    @ObservedObject var music: MusicViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            Color("backgroundColor").ignoresSafeArea()
            
            VStack(alignment: .leading) {
                
                HStack {
                    Button(action: { dismiss() },label: {
                        Image(systemName: "chevron.backward")
                            .foregroundStyle(Color("customLightGreen"))
                            .font(.system(size: 30))
                            .frame(width: 35, height: 35)
                    })
                    Spacer()
                    Text("Background sound").font(.system(size: 17))
                        .fontWeight(.semibold)
                    Spacer().frame(width: 125)
                }
                
                List {
                    ForEach(music.songs.indices, id: \.self) { index in
                        Button {
                            music.setupAudio(audioFileName: music.songs[index].file)
                            music.playAudio(songIndex: index)
                            music.currentSongIndex = index
                        }label: {
                            Text(music.songs[index].name)
                                .fontWeight(.regular)
                                .font(.system(size: 22))
                                .fontWidth(.expanded)
                                .foregroundStyle(music.currentSongIndex == index ? Color("backgroundColor") : Color.white)
                            
                        }.listRowInsets(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 0))
                            .listRowSeparatorTint(Color("customLightGreen"))
                        .listRowBackground(
                            music.currentSongIndex == index ? Color("customLightGreen").opacity(0.7) : Color("backgroundColor"))
                    }
                }.listStyle(PlainListStyle())
                    .frame(maxHeight: 630)
                HStack {
                    
                    Spacer()
                    Button{
                        music.playPreviousTrack()
                    }label: {
                        Image(systemName: "backward.end")
                            .foregroundStyle(.white)
                            .font(.system(size: 46))
                            .frame(width: 59, height: 30)
                    }
                    Button{
                        music.isPlaying ? music.stopAudio() : music.playAudio(songIndex: nil)
                    }label: {
                        Image(systemName: music.isPlaying ? "pause.fill" : "play.fill").foregroundStyle(Color("customLightGreen"))
                            .font(.system(size: 50))
                            .frame(width: 59, height: 30)
                    }
                    Button{
                        music.playNextTrack()
                    }label: {
                        Image(systemName: "forward.end")
                            .foregroundStyle(.white)
                            .font(.system(size: 46))
                            .frame(width: 59, height: 30)
                    }
                    Spacer()
                }
                Spacer()

            }
        }.background(Color.clear)
            .environment(\.defaultMinListRowHeight, 54)
            .navigationBarBackButtonHidden()
    }
}

struct MusicView_Previews: PreviewProvider {
    @StateObject static var music = MusicViewModel()
    
    static var previews: some View {
        MusicView(music: music)
            .preferredColorScheme(.dark)
        
    }
}
