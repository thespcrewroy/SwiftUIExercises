//
//  Delete:Edit:Share.swift
//  SwiftUIButton
//
//  Created by Swapnil Roy on 1/31/24.
//

import SwiftUI

struct Delete_Edit_Share: View {
    var body: some View {
        Button {
            print("Share button tapped")
        } label: {
            Label (
                title: {
                    Text("Share")
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
            print("Edit button tapped")
        } label: {
            Label (
                title: {
                    Text("Edit")
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
            print("Delete button tapped")
        } label: {
            Label (
                title: {
                    Text("Delete")
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
            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .shadow(radius: 5.0)
            .foregroundColor(.white)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

#Preview {
    Delete_Edit_Share()
}
