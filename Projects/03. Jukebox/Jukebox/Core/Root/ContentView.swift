//
//  ContentView.swift
//  JukeStarter
//
//  Created by Emuel Aldridge on 10/28/20.
//
// Future:
// Make it so if you move the slider, it changes to a certain time in the song where you moved the slider to
// Only make button and slider pop up when you select your first song
// Search for your song feature
// SlideView feature to slide through the collection
// Improve UI
// Add animations
// Store the songs in a database/seperate view/list next time to add infinite songs
// Sort the songs by genre
//

import SwiftUI /// import SwiftUI
import AVFoundation /// import AVFoundation API

var playSound: AVAudioPlayer? /// store as a varaible to play the sound continuously

struct ContentView: View {
    
    @State private var isPlaying = false /// Track if audio is playing
    @State private var sliderValue: Double = 0 /// Track slider value
    
    
    var body: some View {
        VStack {
            HStack{
                /** Import Real Life - Send Me An Angel SongView */
                SongView(artist: "Real Life",
                         songTitle: "Send Me an Angel",
                         artistImage: "angel",
                         soundFile: "angel.m4a",
                         sliderValue: $sliderValue,
                         isPlaying: $isPlaying)
                /** Import MegaDeath - HolyWars */
                SongView(artist: "Megadeath",
                         songTitle: "Holy Wars",
                         artistImage: "wars",
                         soundFile: "wars.m4a",
                         sliderValue: $sliderValue,
                         isPlaying: $isPlaying)
            } /// HStack
            HStack{
                /** Import SteppenWolf - Born To be Wild */
                SongView(artist: "Steppenwolf",
                         songTitle: "Born To Be Wild",
                         artistImage: "wild",
                         soundFile: "wild.m4a",
                         sliderValue: $sliderValue,
                         isPlaying: $isPlaying)
                /** Import Kabir Singh - Bekhayali */
                SongView(artist: "Kabir Singh",
                         songTitle: "Bekhayali",
                         artistImage: "bekhayali",
                         soundFile: "bekhayali.m4a",
                         sliderValue: $sliderValue,
                         isPlaying: $isPlaying)
            } /// HStack
            
            Spacer() /// Seperate the SongView and  the Slider
            
            /** Slider moves from 1/30.5th from 0 to 30.5 of the bar */
            Slider(value: $sliderValue, in: 0...30.5, step: 1)
            
                Button(action: {
                    if isPlaying {
                        paws()
                    } else {
                        player()
                    }
                        isPlaying.toggle() // Toggle the playing state
                }, label: {
                    Image(systemName: isPlaying ? "pause.circle.fill": "play.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                }).playPauseButtonStyle(isPlaying: isPlaying)
        } /// VStack
        
        .onReceive(timer) { _ in
            if isPlaying {
                sliderValue += 1 /// iterate by 1/30.5
                if sliderValue >= 30.5 {
                    sliderValue = 0 /// reset the slider
                    isPlaying = false /// set itPlaying to false
                } /// if slider is at the end
            } /// if isPlaying is true
        } /// Create a timer
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
