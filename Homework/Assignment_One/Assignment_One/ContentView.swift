//
//  ContentView.swift
//  Assignment_One
//
//  Created by Swapnil Roy on 1/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack(alignment: .center) {
                NavigationLink(destination: one_text()){
                    Text("Text")
                        .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.black)
                }
                NavigationLink(destination: two_SFSymbol()) {
                    Text("SF Symbol")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .padding()
                }
                NavigationLink(destination: three_Image()) {
                    Text("Image")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
