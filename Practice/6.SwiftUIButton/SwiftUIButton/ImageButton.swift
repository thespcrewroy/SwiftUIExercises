//
//  ImageButton.swift
//  SwiftUIButton
//
//  Created by Swapnil Roy on 1/31/24.
//

import SwiftUI

struct ImageButton: View {
    var body: some View {
        Button {
            print("Delete button tapped!")
        } label: {
            Label (
                title: {
                    Text("Delete")
                        .fontWeight(.semibold)
                        .font(.title)
            },
            icon: {
                Image(systemName: "trash")
                    .font(.title)
                }
            )
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .shadow(radius: 5.0)
            .foregroundColor(.white)
        }
    }
}

struct ImageButton_Previews: PreviewProvider {
    static var previews: some View {
        ImageButton()
    }
}




