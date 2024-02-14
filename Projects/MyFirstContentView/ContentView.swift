//
//  ContentView.swift
//  MyFirstContentView
//
//  Created by NMI Class on 2/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SFImage()) {
                    HStack {
                        Image(systemName: "star") // Replace "star" with the name of your SF image
                            .foregroundColor(.white)
                            .padding(.leading, 10) // Adjust the padding as needed
                        Text("SF Image")
                    }
                }
                .buttonStyle(GradientBackgroundStyle())
                NavigationLink(destination: ScrollViewer()) {
                    HStack {
                        Image(systemName: "star") // Replace "star" with the name of your SF image
                            .foregroundColor(.white)
                            .padding(.leading, 10) // Adjust the padding as needed
                        Text("ScrollView")
                    }
                }
                .buttonStyle(GradientBackgroundStyle())
                NavigationLink(destination: CrazyImage()) {
                    HStack {
                        Image(systemName: "star") // Replace "star" with the name of your SF image
                            .foregroundColor(.white)
                            .padding(.leading, 10) // Adjust the padding as needed
                        Text("CrazyImage")
                    }
                }
                .buttonStyle(GradientBackgroundStyle())
            }
        }
    }
}

struct GradientBackgroundStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .fontWeight(.semibold)
            .font(.title)
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color("Orange"), Color("Red")]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .shadow(radius: 5.0)
            .foregroundColor(.white)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

#Preview {
    ContentView()
}
