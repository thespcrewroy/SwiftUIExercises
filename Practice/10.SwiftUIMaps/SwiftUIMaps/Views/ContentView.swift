//
//  ContentView.swift
//  SwiftUIMaps
//
//  Created by Swapnil Roy on 3/7/24.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}


#Preview {
    ContentView()
        .environment(ModelData())
}
