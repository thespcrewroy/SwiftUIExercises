//
//  ContentView.swift
//  SwiftUIState
//
//  Created by Swapnil Roy on 2/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isPlaying = false
    
    var body: some View {
        Button {
            // Switch between the play and stop button
            isPlaying.toggle()
        } label: {
            Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill")
                .font(.system(size: 150))
                .foregroundColor(isPlaying ? .red : .green)
        }
    }
}

#Preview {
    ContentView()
}
