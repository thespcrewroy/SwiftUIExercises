//
//  ContentView.swift
//  Assignment_4
//
//  Created by NMI Student on 2/12/24.
//

import SwiftUI
//
//  Delete:Edit:Share.swift
//  SwiftUIButton
//
//  Created by Swapnil Roy on 1/31/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isButtonTapped: Bool = false
    @State private var Numb: Int = 0
    
    var body: some View {
        VStack{
            Button {
                print("Share button tapped")
                // Change the value of State isButtonTapped each time the button is tapped
                isButtonTapped.toggle()
                // Increment the value of Numb by two
                Numb += 2
            } label: {
                Label (
                    title: {
                        Text("Change")
                            .fontWeight(.semibold)
                            .font(.title)
                            .offset(x:-20)
                    },
                    icon: {
                        Image(systemName: "arrow.clockwise.icloud")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .offset(x: -50)
                    }
                )
            }
            .buttonStyle(GradientBackgroundStyle())
            Image(isButtonTapped ? "dq1": "dq2")
            Text("\(self.Numb)") //
            
        }
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
