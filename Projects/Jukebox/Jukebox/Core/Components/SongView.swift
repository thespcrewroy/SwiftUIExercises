//
//  SongView.swift
//  JukeStarter
//
//  Created by Swapnil Roy on 3/25/24.
//

import SwiftUI

struct SongView: View {
    
    /**
     * artist: the name of the artist
     * songTitle: the title of the song
     * artistImage: the image representing the artist
     * soundFile: the sound file associated with the song
     */
    var artist: String = "Real Life"
    var songTitle: String = "Send Me An Angel"
    var artistImage: String = "angel"
    var soundFile: String = "angel.m4a"
    
    @Binding var sliderValue: Double
    @Binding var isPlaying: Bool // Declare isPlaying as a binding
    
    /// A view representing a song setup.
    ///
    /// - Parameters:
    ///   - artist: The name of the artist.
    ///   - songTitle: The title of the song.
    ///   - artistImage: The image representing the artist.
    ///   - soundFile: The sound file associated with the song.
    ///
    /// - Returns: A view displaying the artist name, song title, and artist image.
    var body: some View {
        VStack {
            /// button that executes the playSound function from storage
            Button(action: {
                playsound(thesong: soundFile)
                sliderValue = 0
                isPlaying = true
            }) {
                VStack {
                    /// displays the name of the artist
                    Text(artist)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    /// displays the title of the song
                    Text(songTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                    /// displays an image of hte album
                    Image(artistImage)
                    
                }
            }
        }
    }
}

struct SongView_Previews: PreviewProvider {
    @State static var sliderValue: Double = 0 // Provide a default value for sliderValue
    
    static var previews: some View {
        SongView(artist: "Real Life",
                 songTitle: "Send Me An Angel",
                 artistImage: "angel",
                 soundFile: "angel.m4a",
                 sliderValue: $sliderValue,
                 isPlaying: .constant(true))
    }
}
