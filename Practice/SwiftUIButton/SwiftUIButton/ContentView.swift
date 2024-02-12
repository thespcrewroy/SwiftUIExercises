//
//  ContentView.swift
//  SwiftUIButton
//
//  Created by Swapnil Roy on 1/31/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            print("Hello World tapped!")
        } label: {
            Text("Hello World")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding()
                .background(.purple)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(.purple, lineWidth:  5)
                }
        }
    }
}

#Preview {
    ContentView()
}
