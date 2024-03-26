//
//  SongModel.swift
//  JukeStarter
//
//  Created by Emuel Aldridge on 10/28/20.
//


import AVFoundation

/**
 Plays a sound file with the given name.

 - Parameter thesong: The name of the sound file to be played ( a varible from SongView)
 */
func playsound (thesong: String){
    let thepath: String = Bundle.main.path(forResource: thesong, ofType: nil)! /// finds the song file "thesong" in my project folder
    let url: URL = URL(fileURLWithPath: thepath) /// creates a URL file out of "thesong" file
    do {
        playSound = try AVAudioPlayer(contentsOf: url) /// try to play the sound file
        player() /// execute player function
    } catch {
        print("Failed to load file") /// if failed to load file, print to console
    }
}

/**
Pauses the twist audio player utitlizing the pause function by AVAudioPlayer API
*/
func paws(){
    playSound?.pause() /// pause the sound file
}

/**
Plays the twist audio player utitlizing the play function by AVAudioPlayer API
*/
func player(){
    playSound?.play()   /// play the sound file
}
