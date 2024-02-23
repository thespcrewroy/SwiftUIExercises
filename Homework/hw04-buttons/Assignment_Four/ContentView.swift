//
//  ContentView.swift
//  Assignment_Four
//
//  Created by Swapnil Roy on 1/31/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Button {
            print("'Go Dawgs!' tapped")
        } label: {
            Label (
                title: {
                    Text("Go Dawgs!")
                        .fontWeight(.semibold)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .offset(x: -10, y:0)
                },
                icon: {
                    Image(systemName: "dog.circle")
                        .font(.system(size: 40))
                        .frame(alignment: .leading)
                        .offset(x: -20, y:0)
                }
            )
            
        }
        .buttonStyle(DawgStyle())
        
        Button {
            print("'Players' tapepd")
        } label: {
            Label (
                title: {
                    Text("Players")
                        .fontWeight(.semibold)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .offset(x: -20, y:0)
                },
                icon: {
                    Image(systemName: "figure.american.football")
                        .font(.system(size: 40))
                        .frame(alignment: .leading)
                        .offset(x: -40, y:0)
                }
            )
            
        }
        .buttonStyle(DawgStyle())
        
        Button {
            print("Send to store page")
        } label: {
            Label (
                title: {
                    Text("Merch")
                        .fontWeight(.semibold)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .offset(x: -20, y:0)
                },
                icon: {
                    Image(systemName: "diamond.fill")
                        .font(.system(size: 30))
                        .frame(alignment: .leading)
                        .offset(x: -50, y:0)
                }
            )
            
        }
        .buttonStyle(DawgStyle())
        
    }
}

struct DawgStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color("Red"), Color("Orange")]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(40)
            .padding(.horizontal, 15)
            .foregroundColor(.white)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
    
}

#Preview {
    ContentView()
}
