//
//  ContentView.swift
//  SwiftUIImage
//
//  Created by Swapnil Roy on 1/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(systemName: "cloud.heavyrain")
            .font(.system(size: 100))
            .foregroundColor(.blue)
            .shadow(color: .gray, radius: 10, x: 0, y: 10)
    }
}

#Preview {
    ContentView()
}
