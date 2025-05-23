//
//  ContentView.swift
//  LessonZero
//
//  Created by Swapnil Roy on 12/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationView {
                VStack(alignment: .leading) {
                    NavigationLink(destination: Purple()) {
                        Text("Purple")
                            .font(.largeTitle)
                            .foregroundColor(Color.purple)
                    } // NavigationLink
                    NavigationLink(destination: Green()) {
                        Text("Green")
                            .font(.largeTitle)
                            .foregroundColor(Color.green)
                    } // NavigationLink
                    NavigationLink(destination: Red()) {
                        Text("Red")
                            .font(.largeTitle)
                            .foregroundColor(Color.red)
                    } // NavigationLink
                    NavigationLink(destination: Blue()) {
                        Text("Blue")
                            .font(.largeTitle)
                            .foregroundColor(Color.blue)
                    } // NavigationLink
                    NavigationLink(destination: Me()) {
                        Text("Me")
                            .font(.largeTitle)
                            .foregroundColor(Color.black)
                    } // NavigationLink
                } // VStack
            } // NavigationView
        } // VStack
        .padding()
    } // body
} // ContentView

#Preview {
    ContentView()
} // Preview
