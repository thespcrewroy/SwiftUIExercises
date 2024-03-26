//
//  ContentView.swift
//  JukeStarter
//
//  Created by Emuel Aldridge on 10/28/20.
//

import SwiftUI // import SwiftUI
import AVFoundation // import AVFoundation API

var playSound: AVAudioPlayer? // store as a varaible so sound won't stop (get destroyd) immedietly

struct ContentView: View {
    
    @State private var isPlaying = false // Track if audio is playing
    @State private var sliderValue: Double = 0 // Track slider value
    @State private var showSongViews = false // State to control the visibility and animation

    
    var body: some View {
        VStack {
            HStack{
                SongView(artist: "Real Life",
                         songTitle: "Send Me an Angel",
                         artistImage: "angel",
                         soundFile: "angel.m4a",
                         sliderValue: $sliderValue) /// Display Paint it Black by Rolling Stones
                SongView(artist: "Megadeath",
                         songTitle: "Holy Wars",
                         artistImage: "wars",
                         soundFile: "wars.m4a",
                         sliderValue: $sliderValue) /// Display Twist and Shout by Chubby Chekcer
            } /// HStack
            HStack{
                SongView(artist: "Steppenwolf",
                         songTitle: "Born To Be Wild",
                         artistImage: "wild",
                         soundFile: "wild.m4a",
                         sliderValue: $sliderValue) /// Display Twist and Shout by Beatles
                SongView(artist: "Kabir Singh",
                         songTitle: "Bekhayali",
                         artistImage: "bekhayali",
                         soundFile: "bekhayali.m4a",
                         sliderValue: $sliderValue) /// Display Walk This Way by Aerosmith
            } /// HStack
            
            Spacer() /// Seperate the SongView and the Play/Pause button
            
            Slider(value: $sliderValue, in: 0...30, step: 1)
            
            HStack(spacing: 11.0) {
                Button(action: {
                    if isPlaying {
                        paws()
                    } else {
                        player()
                    }
                    withAnimation(.bouncy()) {
                        isPlaying.toggle() // Toggle the playing state
                    }
                }) {
                    Image(systemName: isPlaying ? "pause.circle.fill": "play.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                }.playPauseButtonStyle(isPlaying: isPlaying)
            } /// HStack
        } /// HStack
        .onReceive(timer) { _ in
        if isPlaying {
            sliderValue += 1
            if sliderValue >= 30 {
                sliderValue = 0
                isPlaying = false
                // Stop the playback or handle as needed
            }
        }
    }
        .onAppear {
                    // Trigger the animation for SongViews when the ContentView appears
                    self.showSongViews = true
                }
    } /// VStack
}

private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

struct PlayPauseButtonStyle: ViewModifier {
    var isPlaying: Bool
    
    func body(content: Content) -> some View {
        content
            .imageScale(.large)
            .foregroundColor(.white)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color("blues"), Color("pruples")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .clipShape(Circle())
    }
}

extension View {
    func playPauseButtonStyle(isPlaying: Bool) -> some View {
        self.modifier(PlayPauseButtonStyle(isPlaying: isPlaying))
    }
}


/// Preview the SongView
#Preview {
    ContentView()
}
