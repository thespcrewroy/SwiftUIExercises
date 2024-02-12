//
//  ButtonModifiers.swift
//  SwiftUIButton
//
//  Created by Swapnil Roy on 1/31/24.
//

import SwiftUI

struct ButtonModifiers: View {
    var body: some View {
        VStack {
            Button(action: {}) {
                Text("Add to Cart")
                    .font(.headline)
            }
            
            Button(action: {}) {
                Text("Discover")
                    .font(.headline)
                    .frame(maxWidth: 90)
            }
            
            Button (action: {}) {
                Text("Check out")
                    .font(.headline)
            }
        }
        .tint(.purple)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
    }
}

#Preview {
    ButtonModifiers()
}
