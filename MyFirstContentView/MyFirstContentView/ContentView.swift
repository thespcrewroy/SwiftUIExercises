//
//  ContentView.swift
//  MyFirstContentView
//
//  Created by NMI Class on 2/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            print("SF Image button tapped")
        } label: {
            Label (
                title: {
                    Text("SF Image")
                        .fontWeight(.semibold)
                        .font(.title)
                },
                icon: {
                    Image(systemName: "square.and.arrow.up")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
            )
        }
        .buttonStyle(GradientBackgroundStyle())
        
        Button {
            print("ScrollView button tapped")
        } label: {
            Label (
                title: {
                    Text("ScrollView")
                        .fontWeight(.semibold)
                        .font(.title)
                },
                icon: {
                    Image(systemName: "square.and.pencil")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
            )
        }
        .buttonStyle(GradientBackgroundStyle())
        
        Button {
            print("Crazy Image button tapped")
        } label: {
            Label (
                title: {
                    Text("Crazy Image")
                        .fontWeight(.semibold)
                        .font(.title)
                },
                icon: {
                    Image(systemName: "trash")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
            )
        }
        .buttonStyle(GradientBackgroundStyle())
    }
}

struct GradientBackgroundStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
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
